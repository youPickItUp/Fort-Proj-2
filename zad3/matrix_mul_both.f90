module matrix_mul_both
implicit none

public mm3
private

contains

    subroutine mm3(first, second, multiply, status)
        implicit none
        real (kind = 8), intent(in) :: first(:,:) ! pierwsza macierz
        real (kind = 8), intent(in) :: second(:,:) ! druga macierz
        real (kind = 8), intent(out) :: multiply(:,:) ! macierz wynikowa
        integer (kind = 4), intent(out) :: status ! kod błędu, 0 gdy OK

        integer (kind = 4) :: i,j,jj ! zmienne incrementowane w petlach
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

        ichunk = 256
        do jj = 1, size(second, 2), ichunk

              do j = jj, min(jj + ichunk - 1, size(second, 2))
                    do i = 1, size(first, 1)
                       multiply(i,j)=dot_product(first(i,:),second(:,j))
                    end do
              end do

        end do

    end subroutine

end module matrix_mul_both
