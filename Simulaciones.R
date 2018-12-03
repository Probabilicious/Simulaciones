# Tarea de Simulaciones en R
# Simulaciones de variables aleatorias en R

# Integrantes:
# Alan Ernesto Arteaga Vázquez
# Raúl Llamosas Alvarado
# Edgar Quiroz Castañeda
# Jean Paul Ruiz Melo
# Sandra Del Mar Soto Corderi

# HiperGeo(N, m, n)
simula_Hiper<-function(N, n, m){
    A = m
    B = N - m
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

# BinNeg(n, p)
simula_BinNeg<-function(n, p){
    u = runif(n, 0, 1)
    ker = sapply(u, function(k) floor(log(k)/log(1-p)) )
    x = sum(ker)
    return(x)
}
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
    stop("Valor negativo inválido")
}

# Generando Hipergeométrica
N = 13
n = 4
A = 7

randX = numeric(m)

for(i in 1:m){
    hyper = simula_Hiper(N, n, A)
    randX[i] = hyper
}
print("Números aleatorios con distribución hipergeométrica generados")
print(randX)
title = sprintf("Hipergeométrica con N=%1.1f, n=%1.2f, m=%1.2f ", N, n, m)
hist(randX, main=title, breaks = m/n)

# Generando Binomial Negativa
n = 20
p = 0.75
randX = numeric(m)

for(i in 1:m){
    bn = simula_BinNeg(n, p)
    randX[i] = bn
}
print("Números aleatorios con distribución binomial negativa generados")
print(randX)
title = sprintf("Binomial negativa con n=%1.1f, p=%1.2f", n, p)
hist(randX, main=title, breaks = m/5)


# Generando Gamma
n = 5
lambda = 1
randX = numeric(m)

for(i in 1:m){
    randX[i] = simula_Gamma(n, lambda)
}
print("Números aleatorios con distribución gamma generados")
print(randX)
title = sprintf("Gamma con n=%1.1f, lambda=%1.1f", n, lambda)
hist(randX, main=title, breaks = m/5)
