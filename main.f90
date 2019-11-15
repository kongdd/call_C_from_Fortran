MODULE int 
   IMPLICIT NONE 
END MODULE 

PROGRAM MAIN  
   USE int 
   USE iso_c_binding
   IMPLICIT NONE 

   INTERFACE  
      SUBROUTINE hello ()  BIND(C,NAME="hello") 
         USE iso_c_binding  
         IMPLICIT NONE
      END SUBROUTINE  

      SUBROUTINE set_params (val)  BIND(C,NAME="set_params") 
         USE iso_c_binding  
         IMPLICIT NONE
         integer(c_int), value :: val
      END SUBROUTINE  

      SUBROUTINE set_params2 (val) BIND(C,NAME="set_params2") 
         USE iso_c_binding  
         IMPLICIT NONE
         integer(c_int), value :: val
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
            SUBROUTINE f(x) BIND(C)
               USE iso_c_binding  
               REAL(c_float), value :: x 
            END SUBROUTINE f
            ! FUNCTION f( x )  BIND(C) 
            !    USE iso_c_binding  
            !    REAL(c_float) :: f
            !    REAL(c_float) :: x 
            ! END FUNCTION f 
         END INTERFACE 
         REAL(c_float) :: x  
      END SUBROUTINE  
     
   END INTERFACE

   integer :: value_ = 99
   integer :: res
   REAL(c_float) :: res2
   REAL(c_float) :: scale = 1.0
   
   ! gloabl parameters works at here
   CALL set_params2(value_)
   CALL set_params(9999)
   CALL hello()
   res = add(2, 3)
   ! csub(float (*func)(float *), float *x)
   CALL csub( func2, scale)  
   write(*, *) res2
   
CONTAINS 
   ! REAL FUNCTION func( x )  
   !    REAL :: x  
   !    func = 10.0*x  
   ! END FUNCTION 
   SUBROUTINE func2( x )  
      REAL(c_float), value :: x
      x = -999.0
      ! func = 10.0*x  
   END SUBROUTINE

END PROGRAM 
