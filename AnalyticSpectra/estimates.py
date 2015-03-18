from math import *
M_halo =1E10
H_fraction = 0.2
gas_fraction = 0.75
cosmic_fraction = 0.18
M = M_halo * cosmic_fraction * gas_fraction * H_fraction
m_H=1.6E-27
M_sun_in_kg = 1.9E30
radius = 15000
pc_to_m = 3.8E16
m_to_cm = 100
n_H = (M * M_sun_in_kg/m_H)/((4.0*pi/3.0)*(radius*pc_to_m*m_to_cm)**3)
sigma = 1.0E-14
print "gas mass", M/1.0E8
print "number density", n_H
tau = n_H * radius * pc_to_m * m_to_cm * sigma 
print "optical depth", tau
