function func(a)
  real, intent(in) :: a
  real :: func
  func = 0
!   if ( present(a) ) then
!     func = a
!   else
!     func = 0.
!   end if
end function func

program main
!   interface
!     function func(a)
!       real, intent(in), optional :: a
!       real :: func
!     end function func
!   end interface

!   print *, "[no args] func():", func()       ! yields: 0.0
  print *, "[args] func(1.0):", func(1.0)    ! yields: 1.0
end program main
