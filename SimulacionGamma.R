# Tarea de Simulaciones en R
# Simulaciones de variables aleatorias en R
#Simulacion de Gamma

# Integrantes:
# Alan Ernesto Arteaga Vázquez
# Raúl Llamosas Alvarado
# Edgar Quiroz Castañeda
# Jean Paul Ruiz Melo
# Sandra Del Mar Soto Corderi

# Gamma(n, λ)
#Se obtuvo con la suma de n simulaciones exponenciales
simula_Gamma <- function(n, lambda){
    u = prod(runif(n, 0, 1))
    x = -(1/(lambda)) * log(u)
    return(x)
}

#Main
#Revisando el valor de n, lambda y m
args = commandArgs(trailingOnly=TRUE)
if(length(args)==0){
    stop("Uso: simulación.R M")
}

n = as.integer(args[1])
if(is.na(n)){
    stop("Valor no numérico en n")
}
if(n < 0) {
    stop("Valor negativo inválido en n")
}

lambda = as.numeric(args[2])
if(is.na(lambda)){
    stop("Valor no numérico en lambda")
}
if(lambda < 0) {
    stop("Valor negativo inválido en lambda")
}

m = as.integer(args[3])
if(is.na(m)){
    stop("Valor no numérico en m")
}
if(m < 0) {
    stop("Valor negativo inválido en m")
}

# Generando Gamma
randX = numeric(m)

for(i in 1:m){
    randX[i] = simula_Gamma(n, lambda)
}
print("Números aleatorios con distribución gamma generados")
print(randX)
title = sprintf("Gamma con n=%1.1f, lambda=%1.1f", n, lambda)
hist(randX, main=title, breaks = m/5)
