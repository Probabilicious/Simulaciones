# Tarea de Simulaciones en R
# Simulaciones de variables aleatorias en R
# Simulacion de Poisson

# Integrantes:
# Alan Ernesto Arteaga Vázquez
# Raúl Llamosas Alvarado
# Edgar Quiroz Castañeda
# Jean Paul Ruiz Melo
# Sandra Del Mar Soto Corderi

# Poisson(λ)
# Se obtuvo con el método de discreto de invervalos
# Para λ <= 4, se tiene que el factorial crece más
# rápido que λ^x, por lo que, para fines numéricos,
# esos valores llegan a cero antes de que la
# distribución converga a 1. Por esto, al usar esos
# valores de lambda, se entra en un loop infinito.
# Alrededor de λ = 150, debido a los exponentes
# negativos y a las divisiones entre factoriales,
# deja de generar resultados válidos.
simula_Poisson <- function(l){
    u = runif(1, 0, 1)
    x = 1
    fac = 1
    p = 0
    repeat{
        fac = x * fac
        p = p + ((l^(x)) * exp(-l))/(fac)
        if((u-p) < 0.01){
            return(x+1)
        }
        x = x+1
        #print("loop")
    }
}

# Poisson(λ)
# Se obtuvo de https://www.win.tue.nl/~marko/2WB05/lecture8.pdf
# como un ejemplo de una mejora a nuestra implementación.
# Alrededor de λ = 500, debido a los exponentes
# negativos deja de generar resultados válidos.
simula_Poisson2 <- function(l){
    u = runif(1, 0, 1)
    i = 0
    repeat{
        if(u >= exp(-l)){
            u = u * runif(1, 0, 1)
            i = i+1
        }else {
            return(i)
        }
    }
}

#Main
#Revisando el valor de lambda y m
args = commandArgs(trailingOnly=TRUE)
if(length(args)==0){
    stop("Uso: SimulacionPoisson.R lambda m")
}

lambda = as.numeric(args[1])
if(is.na(lambda)){
    stop("Valor no numérico en lambda")
}
if(lambda < 0) {
    stop("Valor negativo inválido en lambda")
}

m = as.integer(args[2])
if(is.na(m)){
    stop("Valor no numérico en m")
}
if(m < 0) {
    stop("Valor negativo inválido en m")
}

# Generando Poisson
randX = numeric(m)

for(i in 1:m){
    randX[i] = simula_Poisson(lambda)
}
print("Números aleatorios con distribución Poisson generados")
print(randX)
title = sprintf("Poisson con lambda=%1.1f, m=%d ", lambda, m)
hist(randX, main=title, breaks = m , freq=F)
