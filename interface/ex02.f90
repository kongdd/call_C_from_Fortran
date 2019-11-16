pure elemental function add_int( x, y )
  integer, intent(in) :: x, y
  integer :: add_int
  add_int = x+y
end function add_int

program main
  implicit none

!   interface
!     pure elemental function add_int( x, y )
!       integer, intent(in) :: x, y
!       integer :: add_int
!     end function add_int
!   end interface

  print *, "add ints:", add_int( 1, 2 )                            ! yields: 3
  print *, "add arrays:", add_int( [1, 2], [2, 3] )                ! yields: 3   5

end program main
