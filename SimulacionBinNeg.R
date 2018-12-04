# Tarea de Simulaciones en R
# Simulaciones de variables aleatorias en R
# Simulacion de Binomial Negativa

# Integrantes:
# Alan Ernesto Arteaga Vázquez
# Raúl Llamosas Alvarado
# Edgar Quiroz Castañeda
# Jean Paul Ruiz Melo
# Sandra Del Mar Soto Corderi

# BinNeg(n, p)
# Se obtuvo con la suma de n simulaciones geometricas
simula_BinNeg<-function(n, p){
    u = runif(n, 0, 1)
    ker = sapply(u, function(k) floor(log(k)/log(1-p)) )
    x = sum(ker)
    return(x)
}

#Main
#Revisando el valor de n, p y m
args = commandArgs(trailingOnly=TRUE)
if(length(args)==0){
    stop("Uso: SimulacionBinNeg.R n p m")
}
n = as.integer(args[1])
if(is.na(n)){
    stop("Valor no numérico en n")
}
if(n < 0) {
    stop("Valor negativo inválido en n")
}

p = as.numeric(args[2])
if(is.na(p)){
    stop("Valor no numérico en p")
}
if(p < 0) {
    stop("Valor negativo inválido en p")
}

m = as.integer(args[3])
if(is.na(m)){
    stop("Valor no numérico en m")
}
if(m < 0) {
    stop("Valor negativo inválido en m")
}

# Generando Binomial Negativa
randX = numeric(m)

for(i in 1:m){
    bn = simula_BinNeg(n, p)
    randX[i] = bn
}
print("Números aleatorios con distribución binomial negativa generados")
print(randX)
title = sprintf("Binomial negativa con n=%1.1f, p=%1.2f", n, p)
hist(randX, main=title, breaks = m/5, freq=F)
