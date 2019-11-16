MODULE int 
   IMPLICIT NONE 
END MODULE 

PROGRAM MAIN  
   USE int 
   USE iso_c_binding
   IMPLICIT NONE 

   INTERFACE  
      SUBROUTINE show_value (val) BIND(C,NAME="show_value") 
         USE iso_c_binding  
         IMPLICIT NONE
         integer(c_int), value :: val
      END SUBROUTINE  

      SUBROUTINE set_param (val)  BIND(C,NAME="set_param") 
         USE iso_c_binding  
         IMPLICIT NONE
         integer(c_int), value :: val
      END SUBROUTINE  

      SUBROUTINE show_param ()  BIND(C,NAME="show_param") 
         USE iso_c_binding  
         IMPLICIT NONE
      END SUBROUTINE        

      function add (x, y) bind(C, NAME="add")
         USE iso_c_binding  
         IMPLICIT NONE
         integer(c_int) :: add
         integer(c_int), value :: x
         integer(c_int), value :: y
      end function add

      ! C function as parameter
      SUBROUTINE csub (f, x)  BIND(C,NAME="csub") 
         USE iso_c_binding  
         IMPLICIT NONE

         INTERFACE 
            ! SUBROUTINE f(x) BIND(C)
            !    USE iso_c_binding  
            !    REAL(c_float) :: x 
            ! END SUBROUTINE f
            FUNCTION f(x) BIND(C) 
               USE iso_c_binding  
               REAL(c_float) :: f
               REAL(c_float) :: x 
            END FUNCTION f 
         END INTERFACE 
         REAL(c_float) :: x 
      END SUBROUTINE  

   END INTERFACE

   integer :: res
   ! REAL(c_float) :: res2
   REAL :: scale = 1.0
   
   ! gloabl parameters (extern in C) works
   CALL show_value(99)  ! check whether passed value is correct
   CALL set_param(9999)    
   CALL show_param()        ! check whether external variable works
   res = add(2, 3)          ! call C function in fortran
   write(*, *) res
   ! csub(float (*func)(float *), float *x)
   CALL csub( func_f, scale) ! call C function in fortran, and pass fortran function to C
   ! CALL csub( func, scale) ! call C function in fortran, and pass fortran function to C
   
CONTAINS 
   ! SUBROUTINE func(x)  
   !    REAL(c_float) :: x
   !    write(*, *) "x = ", x
   !    ! func = 10.0*x  
   ! SUBROUTINE
   ! FUNCTION func2(x) BIND(C) 
   !    REAL(c_float) :: x
   !    REAL(c_float) :: func2

   !    func2 = x
   !    write(*, *) "x = ", x, " func2 = ", func2
   !    ! x = -999.0
   !    ! func = 10.0*x  
   ! END FUNCTION

   FUNCTION func_f(x) 
      REAL :: x
      REAL :: func_f
      func_f = 10.0*x
      write(*, *) "x = ", x, " func_f = ", func_f
      ! x = -999.0
      ! func = 10.0*x  
   END FUNCTION
END PROGRAM 
