# Simulaciones
* Curso de Probabilidad I
* Grupo 9015
* Profesor Jaime Vázquez Alamilla
* Ayudantes César Augusto Pérez Rosas, Daniela Portillo del Valle y Luis Gerardo Gage Ruíz

### Integrantes:
 * Alan Ernesto Arteaga Vázquez
 * Raúl Llamosas Alvarado
 * Edgar Quiroz Castañeda
 * Jean Paul Ruiz Melo
 * Sandra Del Mar Soto Corderi

### Indicaciones
Realice un programa que simule M valores de la distribución:
* HiperGeo(N, m, n)
* BinNeg(n, p)
* Poisson(lambda)
* Gamma(N,lambda)

### Dependencias
Sólo se usó los paquetes estándar de [R][1]
### Uso
Hay 4 archivos, donde cada archivo representa una simulacion, para correrlos hay que ejecutar los siguientes comandos en la terminal, dependiendo de la simulacion que se quiera hacer:

*Para simulaciones de la distribucion HiperGeo(N, m, n)
        $Rscript SimulacionHiperGeo N m n M
Donde M es la cantidad de valores a generar y N, m, n son los parámetros propios de la distribucion

*Para simulaciones de la distribucion BinNeg(n, p)
        $Rscript SimulacionBinNeg n p M
Donde M es la cantidad de valores a generar y n, p son los parámetros propios de la distribucion

*Para simulaciones de la distribucion Poisson(lambda)
        $Rscript SimulacionPoisson lambda M
Donde M es la cantidad de valores a generar y lambda es el parámetro propio de la distribucion

*Para simulaciones de la distribucion Gamma(N,lambda)
        $Rscript SimulacionGamma N lambda M
Donde M es la cantidad de valores a generar y N, lambda son los parámetros propios de la distribucion

Se imprimen los M valores generados y se genera un histograma en PDF por
distribución con histogramas de los valores generados.

[1]: https://www.r-project.org/
