#Those are the steps to check a package under development befor publish it

#install packages if are not installed
install.packages(c("pack1", "pack2"))

#load library form folder
install.packages("path to your local folder", repos = NULL, type="source")

#set work espace to package location
setwd("path to your local folder")

#create import packages and export fucntions in NAMESPACE FILE
devtools::document()

library(yourackage)

#check functions
ls(package:yourackage)

ls(getNamespace("yourackage"), all.names=TRUE)

search("package:tyourackage")

#Bifore run check, all dependencies are in namespaces and in Description file
#in de section Depends:  or Import: (preferible)


#check the package before publish
devtools::check()

#Check on terminal no in R consol or R studio also build de pdf
 R CMD build yourpackage
 R CMD INSTALL  yourpackage.tar.gz
 R CMD check  yourpackage.tar.gz

