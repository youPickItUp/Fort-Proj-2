subroutine stop_clock(dtime, iclock)
    real (kind = 8), intent(inout) :: dtime
    real (kind = 8), intent(in) :: iclock
    real (kind = 8) :: iclock2

    call CPU_TIME(iclock2)

    dtime = iclock2 - iclock
end subroutine stop_clock

program time_matmul
use matrix_mul_both, only: mm3
   implicit none
   integer(kind = 4) :: i
   real (kind=8), dimension(:,:), allocatable :: first
   real (kind=8), dimension(:,:), allocatable :: second
   real (kind=8), dimension(:,:), allocatable :: multiply
   integer (kind=4) :: status

   integer (kind=4) :: allocate_status

   real (kind = 8) :: dtime
   real (kind = 8) :: iclock

   do i = 1, 1000
       allocate(first(i, i), stat = allocate_status)
       if(allocate_status .NE. 0) stop "Allocation error11"

       allocate(second(i, i), stat = allocate_status)
       if(allocate_status .NE. 0) stop "Allocation error11"

       allocate(multiply(i, i), stat = allocate_status)
       if(allocate_status .NE. 0) stop "Allocation error11"

       first = 0
       second = 0

       call CPU_TIME(iclock)

       call mm3(first, second, multiply, status)

       call stop_clock(dtime, iclock)
       write(*, *) i, ': dtime : ', dtime

       deallocate(first)
       deallocate(second)
       deallocate(multiply)
   end do

end program time_matmul
