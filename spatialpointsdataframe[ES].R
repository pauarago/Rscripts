#instalar rgdal, solo se hace una vez
install.packages("rgdal")
 
#cargar librería rgdal una vez instalada. 
#Se debe hacer cada vez que necesitamos ejecutar la librería rgdal, 
#es decir al principio de nuestro código
library(rgdal)

#-------------------------------------------------
#cargamos la capa shape que contiene las ciudades
#-------------------------------------------------

#directorio donde se encuenntra la capa
#sutituye la ruta de ejemplo por la tuya
wd<-"/home/user/Downloads/ne_110m_populated_places_simple"

#nombre del archivo shape sin la extensión
shpname<-"ne_110m_populated_places_simple"

#cargamos la capa
cities<-readOGR(dsn=wd, layer=shpname)

#--------------------------------------------------------
#accedemos a los elementos que conforman el objeto cities
#--------------------------------------------------------

# como esta formado este objeto
str(cities)

# coordenadas de la extensión de la capa
cities@bbox

#coordenadas de los puntos
cities@coords

#sitema de coordenadas de la capa
cities@proj4string

#accedemos a los datos que contiene la capa
cities@data

#nombres de las columna
names(cities@data)

#visualización de la copa con R
plot(cities, axes=TRUE)

#escribir cities como un shp de salida
writeOGR(obj=cities, dsn=wd ,layer="cities", driver="ESRI Shapefile")

#Listado de todos los drivers y sus nombres
ogrDrivers()