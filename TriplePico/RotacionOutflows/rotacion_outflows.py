from numpy import *
from scipy.interpolate import interp1d
import read_LyaRT

#Importo datos del triple pico
datos=loadtxt("./V150OC075.dat")
#Importo wl_in, wl_out
wl_in, wl_out = read_LyaRT.wls()

#Defino la interpolacion lineal
velocidades=datos[:,0]
intensidades=datos[:,1]
interpolacion = interp1d(velocidades, intensidades)

#Se hace la interpolacion para tener la misma cantidad de datos que con wl
velocidades_interpoladas = linspace(velocidades[0], velocidades[len(velocidades)-1], len(wl_in))
intensidades_interpoladas = interpolacion(velocidades_interpoladas)

#Entrada wl_in
print shape(intensidades_interpoladas)
print shape(wl_in)
peso_entrada_codigo=histogram(wl_in, bins=20,normed=False, weights=intensidades_interpoladas)

#Salida wl_out
espectro_final=histogram(wl_out, bins=20, normed=False, weights=peso_entrada_codigo)

#Guardar en archivo
datos[:,0]=velocidades_interpoladas
datos[:,1]=espectro_final
filename="prueba.dat"
savetxt(filename,datos) 
