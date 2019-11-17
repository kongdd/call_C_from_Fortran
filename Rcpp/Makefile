dir_rpkg=/home/kong/R/x86_64-pc-linux-gnu-library/3.6

CFLAG =-Wall -g -O2 -std=gnu++11 -DNDEBUG \
	-I"/usr/share/R/include" \
	-I"${dir_rpkg}/Rcpp/include" \
	-I"${dir_rpkg}/RInside/include" \
	-L"/usr/lib/R/lib" \
	-L"${dir_rpkg}/RInside/lib" \
	-L"${dir_rpkg}/Rcpp/libs" \
	-lR -lRInside \
	-Wl,-rpath,${dir_rpkg}/RInside/lib

all:
	g++ helloR.cpp $(CFLAG) -o main.exe
	./main.exe

.PHONY: clean
clean:  
	@rm -f *.mod *.o *.dll *.so *.exe *.out main helloR
