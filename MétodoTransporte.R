#CFE dispone de cuatro plantas de generación para satisfacer la
#demanda diaria eléctrica en cuatro ciudades: Coyuca de Catalán,
#Cd. Altamirano, Tlapehuala y Cutzamala. Las plantas 1, 2, 3 y 4
#pueden satisfacer 180, 230, 160 y 245 millones de KW al día 
#respectivamente. Las necesidades de las ciudades de Coyuca de Catalán, 
#Cd. Altamirano, Tlapehuala y Cutzamala son de 170, 240, 235 y 170 
#millones de Kw al día respectivamente. Los costos asociados al envío 
#de suministro energético por cada millón de KW entre cada planta y 
#cada ciudad son los registrados en la siguiente tabla.

#Suministra a: Coyuca de Catalán  Cd. Altamirano  Tlapehuala  Cutzamala
#Planta 1              15                 12          17          13
#Planta 2              23                 26          26          21
#Planta 3              16                 21          12          24
#Planta 4              25                 13          26          16

#Formule un modelo de programación lineal que permita satisfacer las
#necesidades de todas las ciudades al tiempo que minimice los costos
#asociados al transporte.

library(lpSolve)

# matriz de flete
costos<-matrix(c(15,23,16,24,12,26,21,13,17,26,12,26,13,21,24,16), nrow = 4) 
costos

#Símbolo de restricción de salida
row.signs <-rep ("<=", 4) 
row.signs

# Vector de restricción de salida
row.rhs <-c (180,230,160,245) 
row.rhs

#Símbolo de restricción de ventas
col.signs <-rep ("=", 4) 
col.signs

# Vector de restricción de ventas
col.rhs <-c (170,240,235,170) 
col.rhs

# Ejecutamos la función y se guarda el resultado en res
res<-lp.transport(costos,"min",row.signs,row.rhs,col.signs, col.rhs)

# Se muestra el resultado de la función 
# objetivo o el costo total mínimo
res

# Se muestra la tabla con los totales de envío
res$solution
