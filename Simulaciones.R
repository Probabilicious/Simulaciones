## Tarea de Simulaciones en R

## Integrantes:
## Alan Ernesto Arteaga Vázquez
## Raúl Llamosas Alvarado
## Edgar Quiroz Castañeda
## Jean Paul Ruiz Melo
## Sandra Del Mar Soto Corderi
##

##1. Realice un programa que simule M valores de la distribución:

##a) HiperGeo(N, m, n)

##b) BinNeg(n, p)

#Para simular esta función tomamos el método de la transformación inversa de n variables
#geometricas,
simula_BinNeg<-function(m, n, p){
  x<-c()
  u<-runif(m + n)
  for(i in 1:m){
    for(j in 1:n){
      x[i]= log(u[i])/log(1-p)
    }
  }
  return(x)
}

#Ejemplo
s <- simula_BinNeg (6, 5, 0.5)
rnbinom(6, 5, 0.5)

#Gráfica de la simulacion
hist(s)

##c) Poisson(λ)

##d) Gamma(n, λ)