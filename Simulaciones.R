## Tarea de Simulaciones en R

## Integrantes:
## Alan Ernesto Arteaga Vázquez
## Raúl Llamosas Alvarado
## Edgar Quiroz Castañeda
## Jean Paul Ruiz Melo
## Sandra Del Mar Soto Corderi
##

##1. Realice un programa que simule M valores de la distribución:

##declarar un vector
y<-c(1,2,3,4)
x<-c("a,b,c,d") 
##vector vacio
x<-c()

##a) HiperGeo(N, m, n)

##b) BinNeg(n, p)

simula_BinNeg<-function(m, n, p){
  x = rnbinom(m, n, p)
  return(x)
}

#Ejemplo
simula_BinNeg(5, 6, 0.5)

#Gráfica de la simulacion

##c) Poisson(λ)

##d) Gamma(n, λ)