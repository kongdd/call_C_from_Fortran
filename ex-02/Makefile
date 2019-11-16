CC := gcc
FC = gfortran

CFLAGS := -Wall -g -O2
FCFLAGS = -Wall -g -O2 -fcheck=all
# without FCFLAGS in fortran, it will be memory error in WSL

# -I/usr/local/include -L/usr/local/lib
#-lgomp -g

OBJS := global_params.o csub.o
SRCS := $(patsubst %o, %c, $(OBJS)) 

target=main.exe

all: main.f90 $(OBJS)
	$(FC) $^ $(FCFLAGS) -o $(target)
	./main.exe

$(OBJS): $(SRCS)
	$(CC) $(CFLAGS) -c $^

.PHONY: clean
clean:  
	@rm -f *.mod *.o *.dll *.so *.exe
