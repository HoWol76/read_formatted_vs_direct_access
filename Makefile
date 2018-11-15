FC=gfortran
FLAGS=-O2

.SUFFIXES:
.SUFFIXES: .f90 .o .F90

create : create.f90 
	$(FC) $(FLAGS) -o $@ $<

convert : convert.f90
	$(FC) $(FLAGS) -o $@ $<

create convert : size.h
