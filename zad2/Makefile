FF=gfortran
F90_VENDOR=GNU
include $(PFUNIT)/include/base.mk

FFLAGS += -ffree-form -std=f2008 -funroll-loops -cpp -Wall -I$(PFUNIT)/mod
LIBS = $(PFUNIT)/lib/libpfunit$(LIB_EXT)

PFS = $(wildcard *.pf)
OBJS = $(PFS:.pf=.o)

%.f90: %.pf
	$(PFUNIT)/bin/pFUnitParser.py $< $@

%.o: %.f90
	$(FF) $(FFLAGS) -c $<

test: testSuites.inc matrix_mul_both.o matrix_mul_only_cache.o \
	matrix_mul_only_dotp.o $(OBJS)
	$(FF) -o $@ -I. -I$(PFUNIT)/mod -I$(PFUNIT)/include \
		$(PFUNIT)/include/driver.F90 \
		./*$(OBJ_EXT) $(LIBS) $(FFLAGS)

clean:
	rm -f test
