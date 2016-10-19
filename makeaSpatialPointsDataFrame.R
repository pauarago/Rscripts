#install de package in  R , just if you don't have it already
install.packages("sp")
#load the library
library('sp')
#------------------------------------
#Create a matrix with the coordinates
#------------------------------------

#coordinates as vector
coor1=c(48,0)
coor2=c(48.5,0)

#coordinate as matrix
coordinates=rbind(coor1, coor2)

#------------------------------
# data for each coordinate
#-----------------------------
mydata=as.data.frame(rbind("point1", "point1"))

#----------------------------
#Corrdinate referenc system
#----------------------------
#There are to options todefine de CRS
#visit http://spatialreference.org/ref/epsg/wgs-84/

#just with the epsg code
myCRS=CRS("+init=epsg:4326")
#proj4 (recomended)
myCRS=CRS("+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs")

#--------------------------------------
#built my SpatialPointsDataFrame
#--------------------------------------

mypoints=SpatialPointsDataFrame(coords=coordinates,data=mydata, proj4string = myCRS)

plot(mypoints, axes=TRUE)
