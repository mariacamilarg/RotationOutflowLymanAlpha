#include <stdio.h>
#include <math.h>
#include <stdlib.h>
#define NPOINTS 1000
#define NPOINTSX 100
#define TEMP 10000.0
#define R 1.0
#define PI 3.141592653589793238462643383279502884197169
#define USAGE "analytic_solution.x tau velocity(km/s) viewing_angle(degrees)"

/*
  This codes computes an analytic solutions for the Lya radiation 
  transfer problem of a rotating sphere.

  The solution was computed by Mark Dijsktra and is published in the 
  paper: Garavito-Camargo, Forero-Romero, Dijkstra, ApJ ....

  Author: Jaime E. Forero-Romero (Uniandes)
  Creation date: 14-Jun-2014

  Modifications:
*/

double J_surface(double x, double b, double phi, double i_angle, double tau0, double v_rot);
int main(int argc, char **argv){
  int i, j, k;
  double *x;
  double *j_int;
  double min_x=-50.0;
  double max_x= 50.0;
  double delta_x = (max_x-min_x)/NPOINTSX;
  double delta_phi = 2.0*PI/NPOINTS;
  double delta_b = 0.9999/NPOINTS;
  double tau, v_rot, i_angle;
  double b, phi;

  if(argc!=4){
    fprintf(stderr, "USAGE: %s\n", USAGE);
    exit(1);
  }

  tau = atof(argv[1]);
  v_rot = atof(argv[2]);
  i_angle = atof(argv[3]);
  i_angle = i_angle*PI/180.0;
  
  fprintf(stderr, "%f %f %f\n", tau, v_rot, i_angle);

  if(!(x=malloc(sizeof(double)*NPOINTSX))){
    fprintf(stderr, "Problem with memory allocation");
    exit(1);
  }

  if(!(j_int=malloc(sizeof(double)*NPOINTS))){
    fprintf(stderr, "Problem with memory allocation");
    exit(1);
  }

  for(i=0;i<NPOINTSX;i++){
    x[i] = min_x + delta_x*i;    

    j_int[i] = 0.0;
    for(j=0;j<NPOINTS;j++){
      for(k=0;k<NPOINTS;k++){
	phi = delta_phi*j;
	b = delta_b*k;
	j_int[i] += 
	  J_surface(x[i], b, phi, i_angle, tau, v_rot) * b * delta_phi * delta_b;
      }
    }
  }

  for(i=0;i<NPOINTSX;i++){
    fprintf(stdout, "%f %f\n", x[i], j_int[i]);
  }
  
  return 0;
}


double J_surface(double x, double b, double phi, double i_angle, double tau0, double v_rot){
  double final, v_thermal, a;
  double beta, x_b, arg_in, s;
  
  v_thermal = 12.85*sqrt(TEMP/10000.0);
  a = 4.7E-4*(12.85/v_thermal);
  
  beta = atan(b*sin(phi)/sqrt(R*R - b*b));

  s = -(sin(i_angle) * sqrt(R*R - b*b)) + (b * cos(phi) * cos(i_angle));  

  x_b = (v_rot/v_thermal) * sqrt(1.0- (s/R)*(s/R)) * cos(i_angle) * sin(beta);  


  arg_in = pow(fabs(x-x_b),3.0)/(a*tau0);
  arg_in = arg_in * sqrt((2.0*PI*PI*PI)/27.0);
  final = pow((x-x_b),2)/(1.0+cosh(arg_in)) * (sqrt(PI)/(sqrt(24.0)*a*tau0));
  return final;
}
