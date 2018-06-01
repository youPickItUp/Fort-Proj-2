FF=gfortran
include $(PFUNIT)/include/base.mk

FFLAGS += -ffree-form -std=f2008 -cpp -Wall -I$(PFUNIT)/mod
LIBS = $(PFUNIT)/lib/libpfunit$(LIB_EXT)

PFS = $(wildcard *.pf)
OBJS = $(PFS:.pf=.o)

matrix_mul: matrix_mul.f90
	$(FF) $(FFLAGS) $<

%.f90: %.pf
	$(PFUNIT)/bin/pFUnitParser.py $< $@

%.o: %.f90
	$(FF) $(FFLAGS) -c $<

test: testSuites.inc matrix_mul.o $(OBJS)
	$(FF) -o $@ -I. -I$(PFUNIT)/mod -I$(PFUNIT)/include \
		$(PFUNIT)/include/driver.F90 \
		./*$(OBJ_EXT) $(LIBS) $(FFLAGS)
