#load libraries
library(rgdal)
library(sp)


#-------------------------------------------------
#Loading csv file repeat it for all your files
#-------------------------------------------------

#set your working directory to your csv file path
setwd("/Point_Patterns")

#Load csv files, your number decimal separator is ","
tornados<-read.csv("Tornado_Point.csv", header=TRUE,sep=";", dec=",")

#get coordinates from tornados
coorx=tornados$x
coory=tornados$y

#coordinate as matrix
coordinates=cbind(coorx, coory)

#build a SpatialPointsDataFrame
tornadoLayer=SpatialPointsDataFrame(coords=coordinates,data=tornados,
				    proj4string=CRS("+init=epsg:4326"))

				    
plot(tornadoLayer, axes=TRUE)

#transform to nad83 reference system
tornadoLayerNAD83=spTransform(tornadoLayer, CRS("+init=epsg:5070"))

plot(tornadoLayerNAD83,axes=TRUE)

#you can try an albert equal area transformation 
tornadoLayerAlbert=spTransform(tornadoLayer, CRS("+init=esri:102003"))

plot(tornadoLayerAlbert, ,axes=TRUE)
#-------------------------------------------------
#Loading shp file repeat it for all your files
#------------------------------------------------

#set your working directory to your csv file path
setwd("/Shapes_Lattice")

#load a shapefile
tornado_pol=readOGR(dsn=getwd(), layer="Tornado")

#transform to nad83 reference system
tornadoLPolNAD83=spTransform(tornado_pol, CRS("+init=epsg:5070"))



#you can try an albert equal area transformation 
tornadoPolAlbert=spTransform(tornado_pol, CRS("+init=esri:102003"))

plot(tornadoPolAlbert, axes=TRUE)
plot(tornadoLayerAlbert, ,axes=TRUE, add=TRUE)

