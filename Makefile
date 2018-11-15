FC=gfortran
FLAGS=-O2
targets=create convert read_txt read_bin

.SUFFIXES:
.SUFFIXES: .f90 .o .F90

$(targets) : % : %.f90
	$(FC) $(FLAGS) -o $@ $<

$(targets) : size.h
