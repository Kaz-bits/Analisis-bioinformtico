
#Vamos a comenzar utilizando algunos de los objetos que R maneja, y los cuales son de 
#gran importancia conocer para poder avanzar.


#------CREANDO VECTORES------

#Hemos escuchado la palabra "vector" antes, en cursos de física, álgebra, etc., pues en R, un vector es
#un componente central, el cual puede contener gran variedad de datos, ya sea, numeros, cadenas, valores
#logicos, etc. Para crear un vector se emplea la función "c()"

c(1,2,3,5,6,8,9,0,2)
c(2*4, 4*7, 2*8, 10*11)
c("César", "22", "QFB", "Verde")
c(T, F, T, F, F)

#Puedes combinar vectores, sin importar la longitud de uno o del otro 

v1 <- c(1:5)
v2 <- c(6:10)
v3 <- c(v1, v2)


v4 <- c(1:6)
v5 <- c(7:20)
v6 <- c(v4, v5)



#Lo anterior es una forma de crear variables en R, de igual forma se puede usar el signo "=" pero 
#para casos prácticos no lo recomiendo, pues algunas veces puede confundirse con otras funciones que
#emplean el mismo signo. 

#Existen muchas formas de poder crear un vector, algunas de ellas son las siguientes:

assign("carrera", c("QFB", "QA", "Q", "IQ", "QIM", "IQM"))
print(carrera)

numeros <- seq(from = 3, to = 30, by = 3)
print(numeros)


#De igual forma, puede ser util saber el tipo de elemento que nuestro vector guarde, por ejemplo, si son
#datos numericos, logicos, etc. 

v6 <- c(v4, v5)
class(v6) #"Integer"

p <- c("César", "22", "QFB", "Verde")
class(p)  #"chacracter"

l <- c(T, F, T, F, F)
class(l) #"logical"

pi <- c(pi + 1, pi + 2)
class(pi) #"numeric"

class(class)

#Al manipular objetos, de igual forma nos será util saber como extraer un valor especifico de una posicion
#para ello, se usan los corchetes


v6[18]
v6[9:15]
v6[21]
v6[c(9, 14, 16, 18)]
v6[-1]
v6[-(9:15)]

v6 < 15

v6[v6 < 15]
v6[v6 < 5]
v6[v6 <= 5]

v6 %% 2 == 0

v1 + v2
v4 + v5 
v1 + v6

#Otro caso particular para los vectores, es que podemos asociarle valores
#es decir, que tengan un encabezado con el nombre de cada elemento

frutas <- c(naranja = 15, pera = 100, manzana = 2, durazno = 30)
frutas

#Cuando se imprime el vector "frutas", vemos en la consola que cada nombre
#tiene asociado un valor numerico

frutas[1]

#Si buscamos extraer algun elemento del vector, se extraerá el nombre y 
#el valor numerico asociado.


#Otra funcionalidad de R es que podemos realizar operaciones, para nuestros
#propósitos no las usaremos tan frecuentemente, pero te las muestro
#para que sepas lo que es posible realizar


v1 + v2
v2 - v1
v1 * v2
v1 / v2
v1 + 2*(v2)
log(v2)
sqrt(v1) + sqrt(v2)

as.numeric(format(log(((3*v1) + (2*v2))/(4)), digits = 2))
class(as.numeric(format(log(((3*v1) + (2*v2))/(4)), digits = 2)))

sin(v1) 
cos(v1)


#una operacion sencila como una suma, una resta, multiplicación, división,
#exponencial, etc. La función sqrt() es la raíz cuadrada. Otro tipo de operaciones
#que se pueden hacer son las trigonométricas. Esto lo digo porque incluso
#puedes generar ecuaciones o funciones que realicen ciertas opreaciones de
#interés. 


#Una herramienta que nos puede bastante útil para realizar ya sea modelos
#estadísticos o para poder generar ciertos gráficos, es la obtención de 
#factores, es decir, la frecuencia de aparición de ciertos caracteres. El 
#siguiente vector "carrera" 

carrera_FQ <- c("QFB", "QA", "Q", "QIM", "IQ", "IQM", "QFB", "QA", "QA")
carrera_FQ <- as.factor(carrera_FQ)
carrera_FQ

#Lo anterior lo que genera es el mismo vector, con la misma longitud, pero,
#se ha adicionado una estructura denominada "levels"

unclass(carrera_FQ)
table(carrera_FQ) 

carrera_FQ[1]
levels(carrera_FQ)[4] <- "Q"
as.integer(carrera_FQ)

#------CREACION DE DATAFRAMES------

#Los dataframes son estrcutruas en dos dimensione (rectangulares), en los cuales puede haber datos de 
#cualquier tipo, sin importar la clase. Normalmente, es la estructura de datos mas usadas. En un dataframe
#tendremos columnas y tendremos renglones, las columnas serán las variables, y los renglones las observaciones


#Te voy a mostrar un dataframe, nosotros podemos crearlos, pero el siguiente comando ejecuta un dataframe
#ya hecho y cargado en Rstudio

iris

#Los dataframes están compuestos por vectores, entonces, ya te imaginaras, que si tenemos varios
#vectores, podemos crear un dataframe:


nombre <- c("Cesar", "Mariana", "Alex", "Diana")
edad <- c(22, 21, 21, 23)
carrera <- c("QFB", "QA", "Q", "QFB")
deporte <- c(F, T, T, T)

df2 <- data.frame(nombre, edad, carrera, deporte)
df2
class(df2)

#Esa es una forma muy eficiente en la que podemos ir guardando nuestras observaciones, pero ahora imagina
#tener miles de datos. 

#De igual forma podemos extraer valores de los dataframes

df2[1] #Extraer la primer columna
df2[2]
df2[1, 2] #Renglón, columna

df2[c(1,3), 3]
df2


#A los dataframes igual podemos agregarles columnas o renglones. Supongamos que queremos
#añadir una columna que contenga el área de interes de cada persona.

df2$intereses <- c("Genómica", "Microbiología", "Cuántica", "Calidad")
df2

df2$música <- cbind(c("rock", "ska", "pop", "metal"))
df2

df2 <- rbind(df2, c("Perla", 22, "IQ", FALSE, "Balances", "rock"))
df2


#Estos comandos nos podrán ser de ayuda más adelante, cuando comencemos a realizar
#tratamineto de los datos, principalmente las primeras dos, donde debemos ir añadiendo 
#columnas dependiendo de los análisis que hagamos. 



#------¿CÓMO CARGAR UNA BASE DE DATOS A RSTUDIO?------

#Pueden cargar datos de archivos de Excel, como .csv, .xlsx, .tab, .txt, .fasta, etc. 
#usaremos un archivo denominado .tab que se trata de datos separados por tabulaciones


read.csv()
read.csv2()

#Si quiere conocer el directorio donde se esten guardando tus scripts
#graficos, etc., emplea la función "getwd()" para poder determinarlo

getwd()

#En nuestro caso, podemos cargar un archivo directamente sin complicaciones
#desde el menú, pero quiero que aprendas el cómo se hace y el por qué
#se hace o se lee un archivo como lo hace el interprete de R.


ara_prot <- read.delim("C:/Users/Windows/Desktop/Proteome analysis/Ejercicio proteoma.txt",
                       header = TRUE,
                       row.names = FALSE,
                       sep = "\t")

ara_prot <- read.delim(file.choose(), 
                       header = TRUE,
                       row.names = FALSE,
                       sep = "\t")

#Lo anterior son dos formas en las que podemos cargar un archivo en R,
#si estás iniciando o simplemente se te hace más fácil, utiliza la
#segunda opción, la primera es cuando tú debe especificar el directorio
#del archivo, solamente en el caso de que no lo tengas en el directorio
#de trabajo de R dado por la función getwd(). 


#Lo que se acaba de cargar debe aparecer en el panel de trabajo, donde se
#guardan todas la variables. El nombre que le dimos es "ara_prot", y tiene 
#39349 renglones, ¡bastante grande!, tan solo mira el tamaño del dataframe.

#Para observar las primera seis columnas de un dataframe se emplea la función head(), como
#sigue: 

head(ara_prot)
head(ara_prot$Entry, n = 10)

#De igual forma, puedes extraer ciertos elementos del dataframe creado, empleando los
#corchetes sencillos. 

ara_prot[1, 5]

ara_prot$Sequence[1] #CUIDADO AQUÍ, CUANDO TENEMOS MUCHOS DATOS, SI NO FILTRAMOS BIEN
                     #PODEMOS PROVOCAR UN ERROR EN R, POR ESO YO ESPECIFIQUÉ EL UNO, 
                     #PARA DECIRLE QUE QUIERO EL PRIMER ELEMENTO, NO LOS 39343



#Empecemos a manipular un poco la información que contienen los dataframes. Para ello,
#vamos a cargar datos que se encuentran de forma predeterminada en Rstudio, una base de
#llamada "iris"

head(iris)
View(iris)
help(iris)

#Hay dos bases datasets, uno llamado iris y otro iris3, ambos son de una clase distinta:

class(iris)
class(iris3)

#Antes de empezar, podemos visualizar la estructura de nuestros datos, en este caso,
#usando la función "str()", que nos da información de la clase dle objeto, la clase
#de los datos de las columnas, el numero de observaciones, variables, etc. 

str(iris)

#Vamos a empezar instalando una paquetería, llamada "tidyverse", esta paquetería

library(tidyverse)
library(dplyr)

#Como primer paso para que veamos la funcionalidad de esta función "dplyr" vamos a extraer
#de iris todas las columnas y renglones correspondientes a la especie virginica:

filter(.data = iris, Species == "virginica")
filter(.data = iris, Species == "setosa")
filter(.data = iris, Species == "versicolor")

#Podemos obtener el mismo output de diferentes maneras, a continuación te muestro algunas
#de ellas. El simbolo "%>%" en el tercer comando, se le conoce a menudo como "pipe", y es 
#una notación muy común en otros lenguajes de programación, por ejemplo, "bash" que es el 
#lenguaje que utiliza linux. 

filter(.data = iris, Species == "virginica")
filter(iris, iris$Species == "virginica")
iris %>% filter(iris$Species == "virginica")

#Queremos ahora del nuevo dataframe, extraer los datos de la columna petal.length 
#que sean iguales o mayore a 3.5, para hacerlo, utilizamos lo siguiente: 

min(iris$Petal.Length)
max(iris$Petal.Length)

min(iris$Sepal.Length)
max(iris$Sepal.Length)

filter(iris, iris$Species == "virginica", iris$Petal.Length > 5.5)
filter(iris, iris$Species == "virginica", iris$Petal.Length != c(5.5:6.3))

df_iris <- filter(iris, iris$Species == "virginica", iris$Petal.Length > 5.5)
df_iris
class(df_iris)

#Te voy a presentar una paquetería muy buena llamada ggplot2, la cual sirve para
#realizar gráficos de calidad e inclusive ajustar datos a modelos esatdísticos. veamos 
#cómo se vería la gráfica de nuestro data frame.

library(ggplot2)

#Primero, si no tienes cargada la paquetería o instalada, es lo primero que debes hacer, 
#para poder utilizarla. 

ggplot(df_iris)

#Si ejecutamos el comando anterior, la visualización del panel 4 cambia, se observa un 
#cuadro gris. Esto lo que hace es construir un lienzo sobre el cual se graficarán nuestros 
#datos

names(df_iris)
ggplot(df_iris, aes(x = Petal.Length, y = Petal.Width))

#Lo anterior genera los ejes de grafiación "x" y "y", y los ajusta según los datos
#que tengamos. Ahora agreguemos los datos al lienzo:

ggplot(df_iris, aes(x = Petal.Length, y = Petal.Width)) +
  geom_point()

#Si te das cuenta, ahora tenemos todos nuestros datos sobre el lienzo, mostrados como
#puntos. A partir de aquí, una vez que tienes las primeras tres capas, tú puedes 
#hacer modificaciones a tu gráfico. Para poder hacer más claro los siguientes comandos,
#usaremos toda la base de datos de "iris".


ggplot(iris, aes(x = Petal.Length, y = Petal.Width, colour = Species)) +
  geom_point(size = 2.5) + 
  theme_bw() + 
  labs(x = "Longitud del pétalo (cm)", 
       y = "Ancho del pétalo (cm)") + 
  ggtitle("Comparación de especies de la flor iris") + 
  theme(plot.title = element_text(size = 12, hjust = 0.5, face = "bold"),
        axis.title = element_text(size = 14),
        panel.grid = element_blank(),
        legend.text = element_text(size = 12),
        legend.title = element_text(size = 13, hjust = 0.5),
        legend.background = element_rect(colour = "black", 
                                         linetype = 5)) +
  scale_color_discrete(name = "Especies de\nflor iris", 
                       labels = c("Setosa", "Versicolor", "Virginica")) +
  scale_x_continuous(breaks = seq(0, 8, by = 1)) + 
  scale_y_continuous(breaks = seq(0, 3, by = 0.5)) +
  geom_vline(xintercept = 3.45, linetype = 5, size = 0.65) + 
  geom_hline(yintercept = 1.25, linetype = 5, size = 0.65)


#El código de arriba genera un gráfico que puede ser modificado dependiendo de las 
#necesidades del experimento o de quien lo esté realizand. Te recomiendo revisar 
#diferentes libros y foros para que conozcas todas las modificaciones que podmemos realizar.
#Con esto, te doy ejemplos de la importancia de manipular los datos que tienes 
#en una base de datos, como extraer ciertos valores y graficar algunos. TE VOY A DEJAR
#CÓDIGOS ESPECíFICOS PARA DIFERENTES TIPOS DE GRÁFICOS QUE PUEDAN SER DE UTILIDAD 
#EN TUS PROYECTOS. 



#------CREACIÓN DE LISTAS-------


#Una lista es otra estructura de datos que puede contener desde cero o más elementos, y 
#pueden ser de diferentes clases, es decir, puedes tener listas conteniendo datos de tipo
#numérico, lógico, caracteres, etc., la ventaja de este tipo de estructuras es que 
#no importa de que longitud sea cada objeto de la lista, eso nos facilita mucho el trabajar
#con los datos. 

lista <- list(Carrera = c("QFB", "QA", "IQ", "Q"), Regulares = FALSE, 
              sueldo = c(18300, 19500, 15600, 17700))

lista

#Cuando ejecutas la variable creada, observa que la estructura es distinta, y la longitud
#en cada elemento de la lista es diferente, eso no se hubbiera podido en un datafre, 
#recuerda que en un dataframe deben tener la misma longitud los elementos. 

#¿Cuándo se una una lista? Los datafraes, son los más empleados, pero una lista, solo
#en ciertas ocasiones, cuando queremos guardar datos de diferente clase, por ejemplo,
#hay una paquetería para bioinformática llamada "seqinr", con la cual podemos cargar
#archivos "fasta", y estos se guardan como listas, veamos:

library(seqinr)

fasta_sc <- read.fasta(file = "protein.faa.txt", seqtype = "AA", as.string = FALSE, 
                       set.attributes = FALSE)


#Podemos usar la función head() para analizar los primeros cinco valores de la lista
# y la función class() para determinar qué tipo de estructura de datos tenemos. 

head(fasta_sc, n = 5)
class(fasta_sc)

#Este formato de lista nos facilita mucho el trabajo, es por ello que la paquetería
#seqinr está creada con la finalidad de que cualquier formato .fasta lo reconozca
#como una lista, donde los objetos dentro de la misma sean caracteres individuales
#de los aminoácidos o de nucelétidos, dependiendo el caso. 



#-----CREACIÓN DE MATRICEZ Y ARREGLOS------

#Este tipo de estructura de datos son usados cuanod se tiene información específica. Por
#ejemplo, una matriz, como bien recordaremos de clases de álgebra, es un arreglo que tiene
#dos dimensiones, algo parecido a un dataframe, teniendo columnas y renglones, pero, ¿qué
#lo hace diferente del dataframe?. Bueno, los datos que deben contener las matrices son
#de la misma clase, veamos: 


m1 <- matrix(24:50)
m1

m1 <- matrix(24:50, nrow = 3, ncol = 9)
m1

m1 <- matrix(24:50, nrow = 3, ncol = 9, byrow = TRUE)
m1

#Los comando sde arriba sirven para generar matrices, se usa en este caso la función 
#matrix(), y se especifican los datos, los renglones y las columnas, los demas atributos
#dependerán de qué es lo que queremos hacer con esos datos. 

nombre <- c("Cesar", "Mariana", "Alex", "Diana")
m2 <- matrix(nombre)
m2

m2 <- matrix(c(nombre, carrera))
m2

m2 <- matrix(c(nombre, carrera), nrow = 2, ncol = 4, byrow = T, 
             dimnames = list(c("Nombre", "Carrera"), c("P1", "P2", "P3", "P4")))
m2

#Observa que agregué a la matrix dos vectores del tipo "character", si yo quisiera 
#añadir un vector de la misma longitud pero del tipo numérico, ocurre lo siguiente: 

nombre <- c("Cesar", "Mariana", "Alex", "Diana")
carrera <- c("QFB", "QA", "Q", "QFB")
edad <- c(22, 21, 21, 23)

m3 <- matrix(c(nombre, carrera, edad), nrow = 3, ncol = 4, byrow = T, 
             dimnames = list(c("Nombre", "Carrera", "Edades"), c("P1", "P2", "P3", "P4")))

m3


#El código se ejecutó sin problema, pero, ¿qué le pasó a nuestros datos numericos? 

m3[3,]

#Observa que los datos de edad se cambiaron a un objeto de tipo "character", por lo que
#si queremos obtener la media de ese renglón no podríamos hacerlo sinplemente con una 
#función, tendríamos que cambiar esos datos a valores numéricos.

mean(m3[3,])
mean(as.numeric(m3[3,]))

#PARA EXTRAER DATOS DE UNA MATRIZ, SE USAN IGUAL LOS CORCHETES Y SE APLICA LA MISMA
#LÓGICA COMO EN LOS DATAFRAMES



#------CREACIÓN DE ARREGLOS------


#Un arreglo es similar a una matriz, pero este contiene más de dos dimensione, se crean 
#con la función arraY().



arreglo_1 <- array(data = 1:24, dim = c(2, 4, 3), 
                   dimnames = list(c("A1", "A2"),
                                   c("P1", "P2", "P3", "P4"),
                                   c("M1", "M2", "M3")))
arreglo_1


#Lo anterior es una forma de crear una arreglo, observa que en este caso, yo tengo que 
#especificar tres dimensiones dadas por la función "dim =". El primer valor de ellso (2)
#corresponde a los renglones, el segundo (4) a las columnas y el tecero (3) a las matrices
#del arreglo. Para poder extraer datos de un arreglo, se usa la lógica de tres dimensiones
#[renglón, columna, matriz]

arreglo_1[2, 4, 2]
arreglo_1[1, 1, 1]




#Con este script puedes darte cuenta que R maneja diferentes estructuras de datos y cada
#una de ellas, tienes sus características, y son dependiendo de los datos que tengas
#y el cómo los vas a tratar en un futuro. 
