# Paqueterías----
library(ggplot2)
library(remotes)
remotes::install_github("R-CoderDotCom/ggcats@main")
library(ggcats)



# Generar datos----

#Secuencia de datos en forma de dataframe
dat <- data.frame(t = seq(0, 2*pi, by = 0.01))
dat1 <- data.frame(t1 = 20, t2 = -55)
#Crear funciones "x" y "y" para graficar
x <-  function(t) {
  
  #Parámetros a evaluar
  16 * sin(t)^3
}

y <- function(t) {
  
  #Parámetros a evaluar
  13*cos(t) - 5*cos(2*t) - 2*cos(3*t) - cos(4*t)
}

#Evaluar el parámetro "t" en cada función
dat$y <- y(dat$t)
dat$x <- x(dat$t)


#Graficar datos
p <- ggplot(dat, aes(x, y)) +
  geom_cat(data = dat1, aes(x = t1, y = t2), 
           cat = "bongo", size = 25) + 
  geom_polygon(fill = "#EE0000", col = "#030303", 
               size = 1.5) +
  theme_dark() +
  labs(x = NULL, y = NULL) +
  theme(axis.text = element_blank(),
        axis.ticks = element_blank(),
        panel.grid = element_blank()) +
  coord_cartesian(xlim = c(-100, 20), 
                  ylim = c(-67.5, 22.5)) + 
  annotate(geom = "text", x = -50, y = 0, 
           label = "Love", size = 30/1.5,
           color = "#FFFFFF") +
  annotate(geom = "text", x = 0, y = 0, 
           label = "u", size = 30/1.6, 
           color = "#FFFFFF") +
  annotate(geom = "text", x = -65, y = -35, 
           label = "Cons" , size = 30/1.5,
           color = "#FE9300")
  

#Guardar gráfico
ggsave(filename = "PLOTS/love.pdf", device = "pdf", 
       height = 3.5, width = 4, units = "in", dpi = 600)







