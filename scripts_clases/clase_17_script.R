##########################################################################################
#
# Script Clase 17: crear funciones
#
##########################################################################################

# primera versión: sin argumentos
lanzar_dado <- function (){
  val_lanz <- sample(1:6,1)
  
  # la última línea es el "retorno" del llamado a la función
  paste('salió la cara',
        val_lanz
  )
}
## hacer llamado a la función lanzar_dado
lanzar_dado()
lanzar_dado()
lanzar_dado()

# retorno pueden ser los valores, u objetos, obtenidos al llamar a una función
# en este caso, la frase que indica el valor obtenido al lanzar el dado una vez

lanzar_dados<- function(cdad){
  # Argumentos:
  # cdad: cantidad de dados a lanzar simultaneamente
  
  val_lanztos<- sample(1:6, cdad, replace =TRUE)
  
  # valor(es) que retorna la función
  paste('salió la cara',
        val_lanztos
  )
}

#llamamos a la función varias veces cambiando el argumento que es la cantidad de dados

lanzar_dados(cdad =2)
lanzar_dados(cdad= 4)
lanzar_dados(cdad =1)