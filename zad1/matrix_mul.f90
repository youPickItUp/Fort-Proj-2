module matrix_mul
implicit none

public mm
private

contains

    subroutine mm(first, second, multiply, status)
        implicit none
        real (kind = 8), intent(in) :: first(:,:) ! pierwsza macierz
        real (kind = 8), intent(in) :: second(:,:) ! druga macierz
        real (kind = 8), intent(out) :: multiply(:,:) ! macierz wynikowa
        integer (kind = 4), intent(out) :: status ! kod błędu, 0 gdy OK

        integer (kind = 4) :: i,j,k ! zmienne incrementowane w petlach

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

        multiply_rows: do j=1, size(second, 2)
            elems: do k=1, size(first, 2)
                multiply_columns: do i=1, size(first, 1)
                    multiply(i,j) = multiply(i,j) + first(i,k) * second(k,j)
                end do multiply_columns
            end do elems
        end do multiply_rows

    end subroutine

end module matrix_mul
