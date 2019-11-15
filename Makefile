CC := /usr/bin/gcc
FC = /usr/bin/gfortran

CFLAGS := -Wall -g
FCFLAGS = -Wall -g -I/usr/local/include -L/usr/local/lib
#-lgomp -g

OBJS := global_params.o csub.o
# hello.o
# OBJS := cpp_pointer.o
SRCS := $(patsubst %o, %c, $(OBJS)) 

target=main.exe

all: main.f90 $(OBJS)
	$(FC) $^ $(FCFLAGS) -o $(target)
	# ./main
# 	# gcc -c hello.c
# 	# gcc hello.o main.f90 -o main.exe

$(OBJS): $(SRCS)
	$(CC) $(CFLAGS) -c $^

.PHONY: clean
clean:  
	@rm -f *.mod *.o *.dll *.so *.exe
