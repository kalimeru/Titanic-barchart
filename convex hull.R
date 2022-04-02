# Input
library(datasets)
data(iris)

# Funció embolcall convex
Plot_ConvexHull<-function(xcoord, ycoord, lcolor){
  hpts <- chull(x = xcoord, y = ycoord)
  hpts <- c(hpts, hpts[1])
  lines(xcoord[hpts], ycoord[hpts], col = lcolor)
} 

# Busquem coordenada i ordenada per a cada espècie
sepal <- iris$Sepal.Length[iris$Species==levels(iris$Species)[1]]
petal <- iris$Petal.Length[iris$Species==levels(iris$Species)[1]]

sepal2 <- iris$Sepal.Length[iris$Species==levels(iris$Species)[2]]
petal2 <- iris$Petal.Length[iris$Species==levels(iris$Species)[2]]

sepal3 <- iris$Sepal.Length[iris$Species==levels(iris$Species)[3]]
petal3 <- iris$Petal.Length[iris$Species==levels(iris$Species)[3]]

# rang per al plot
xrange <- range(c(sepal, sepal2, sepal3))
yrange <- range(c(petal, petal2, petal3))

# Pintem embolcall convex de cada espècie
par(tck = 0.02, mgp = c(1.7, 0.3, 0))
plot(sepal, petal, type = "p", pch = 1, col = "black", xlim = c(xrange), ylim = c(yrange))
Plot_ConvexHull(xcoord = sepal, ycoord = petal, lcolor = "black")
points(sepal2, petal2, type = "p", pch = 1, col = "green")
Plot_ConvexHull(xcoord = sepal2, ycoord = petal2, lcolor = "green")
points(sepal3, petal3, type = "p", pch = 1, col = "magenta")
Plot_ConvexHull(xcoord = sepal3, ycoord = petal3, lcolor = "magenta")

