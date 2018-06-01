FF= gfortran
FFLAGS=-ffree-form -std=f2008 -fimplicit-none -funroll-loops -Wall -O2

.PHONY: all
all: t_matmul t_dotp t_cache t_both

t_matmul: time_matmul.f90
	$(FF) -o $@ $^ $(FFLAGS)

t_dotp: matrix_mul_only_dotp.f90 time_dotp_only.f90
		$(FF) -o $@ $^ $(FFLAGS)

t_cache: matrix_mul_only_cache.f90 time_cache_only.f90
		$(FF) -o $@ $^ $(FFLAGS)

t_both: matrix_mul_both.f90 time_both.f90
		$(FF) -o $@ $^ $(FFLAGS)


.PHONY: clean
clean:
	rm -f *.mod t_matmul t_dotp t_cache t_both
