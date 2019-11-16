#include <stdio.h>

// void csub(float (*func)(float *), float *x)
void csub(float (*func)(float *), float *x) {
    printf("x = %f\n", *x);
    *x = func(x);
    printf("x = %f\n", *x);
}

void show_value(int x_)
{
    printf("x = %d\n", x_);
}

void set_param(int x_) {
    extern int x;
    x = x_;
}

void show_param() {
    extern int x;
    printf("x = %d\n", x);
}

int add (int x, int y) {
    return x + y;
}

// extern works
// int main (){
//     extern int x;
//     // x = 1;
//     set_params(99);
//     hello();
//     // printf("x = %d\n", x);
//     return 0;
// }
