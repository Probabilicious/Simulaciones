# Tarea de Simulaciones en R
# Simulaciones de variables aleatorias en R
# Simulacion de Hipergeométrica

# Integrantes:
# Alan Ernesto Arteaga Vázquez
# Raúl Llamosas Alvarado
# Edgar Quiroz Castañeda
# Jean Paul Ruiz Melo
# Sandra Del Mar Soto Corderi

# HiperGeo(N, m, n)
#Se obtuvo con el método discreto de intervalos
simula_Hiper<-function(N, n, A){
    B = N - A
    commonComb = dim(combn(N,n))[2]
    u = runif(1, 0, 1)
    pointsVector = vector(mode = "numeric", length = n)
    for (i in 0:n){
        if (i > A || (n - i) > B){
            pointsVector[i + 1] = 0
        } else {
            pointsVector[i + 1] = (dim(combn(A,i))[2] * dim(combn(B,n - i))[2]) / commonComb
        }
        if (i != 0){
            pointsVector[i + 1] = pointsVector[i + 1] + pointsVector[i]
        }
    }
    if(u < pointsVector[1]){
        return(0)
    }
    for (j in seq_along(pointsVector)){
        if (u > pointsVector[j] && u < pointsVector[j + 1] ){
            return(j)
        }
    }

}

#Main
#Revisando el valor de N, n, A y m
args = commandArgs(trailingOnly=TRUE)
if(length(args)==0){
    stop("Uso: SimulacionHiperGeo.R N n A m")
}

N = as.integer(args[1])
if(is.na(N)){
    stop("Valor no numérico en N")
}
if(N < 0) {
    stop("Valor negativo inválido en N")
}

n = as.integer(args[2])
if(is.na(n)){
    stop("Valor no numérico en n")
}
if(n < 0) {
    stop("Valor negativo inválido en n")
}

A = as.integer(args[3])
if(is.na(A)){
    stop("Valor no numérico en p")
}
if(A < 0) {
    stop("Valor negativo inválido en p")
}

m = as.integer(args[4])
if(is.na(m)){
    stop("Valor no numérico en m")
}
if(m < 0) {
    stop("Valor negativo inválido en m")
}

# Generando Hipergeométrica
randX = numeric(m)

for(i in 1:m){
    hyper = simula_Hiper(N, n, A)
    randX[i] = hyper
}
print("Números aleatorios con distribución hipergeométrica generados")
print(randX)
title = sprintf("Hipergeométrica con N=%1.1f, n=%1.2f, m=%1.2f ", N, n, m)
hist(randX, main=title, breaks = m/n, freq=F)
