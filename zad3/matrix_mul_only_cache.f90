module matrix_mul_only_cache
implicit none

public mm1
private

contains

    subroutine mm1(first, second, multiply, status)
        implicit none
        real (kind = 8), intent(in) :: first(:,:) ! pierwsza macierz
        real (kind = 8), intent(in) :: second(:,:) ! druga macierz
        real (kind = 8), intent(out) :: multiply(:,:) ! macierz wynikowa
        integer (kind = 4), intent(out) :: status ! kod błędu, 0 gdy OK

        integer(kind = 4) :: i, j, k, jj, kk ! zmienne incrementowane w petlach
        integer (kind = 4) :: ichunk

        ! jezeli wymiary sie nie zgadzaja mnozenie nie ma sensu
        if(size(first, 2) .NE. size(second, 1)) then
            status = 1
            return
        else
            status = 0
        end if

        ! jezeli macierz wynikowa nie pasuje do multiply zwracam blad
        if((size(multiply, 1) .NE. size(first, 1)) .OR. &
           (size(multiply, 2) .NE. size(second, 2))) then
            status = 2
            return
        end if

        multiply = 0


        ! use -funroll-loops
        ichunk = 256
        do jj = 1, size(second, 2), ichunk
           do kk = 1,size(second, 1), ichunk

              do j = jj, min(jj + ichunk - 1, size(second, 2))
                 do k = kk, min(kk + ichunk - 1, size(second, 1))
                    do i = 1, size(first, 1)
                       multiply(i, j) = multiply(i, j) + first(i, k) * second(k, j)
                    end do
                 end do
              end do

           end do
        end do

    end subroutine mm1

end module matrix_mul_only_cache
