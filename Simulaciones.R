# Tarea de Simulaciones en R
# Simulaciones de variables aleatorias en R

# Integrantes:
# Alan Ernesto Arteaga Vázquez
# Raúl Llamosas Alvarado
# Edgar Quiroz Castañeda
# Jean Paul Ruiz Melo
# Sandra Del Mar Soto Corderi
#

library(gridExtra)
library(R2HTML)


#declarar un vector
y<-c(1,2,3,4)
x<-c("a,b,c,d")
#vector vacio
x<-c()

# HiperGeo(N, m, n)

# BinNeg(n, p)

simula_BinNeg<-function(m, n, p){
  x = rnbinom(m, n, p)
  return(x)
}

#Ejemplo
#simula_BinNeg(5, 6, 0.5)

#Gráfica de la simulacion

# Poisson(λ)

# Gamma(n, λ)
simula_Gamma <- function(n, lambda){
    u = prod(runif(n, 0, 1))
    x = -(1/(lambda)) * log(u)
    return(x)
}

#Main
#Revisando el valor de M
args = commandArgs(trailingOnly=TRUE)
if(length(args)==0){
    stop("Uso: simulación.R M")
}
m = as.integer(args[1])
if(is.na(m)){
    stop("Valor no numérico")
}
if(m < 0) {
    stop("Valor negativo inválidos")
}

#Generando Gamma
n = 5
lambda = 1
randX = numeric(m)

for(i in 1:m){
    g = simula_Gamma(n, lambda)
    randX[i] = g
}
title = sprintf("Gamma with n=%1.1f, lambda=%1.1f", n, lambda)
hist(randX, main=title, breaks=m/5)
