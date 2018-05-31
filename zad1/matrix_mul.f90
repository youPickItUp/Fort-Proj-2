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

        integer (kind = 4) :: i,j ! zmienne incrementowane w petlach

        ! jezeli wymiary sie nie zgadzaja mnozenie nie ma sensu
        if(size(first, 2) .NE. size(second, 1)) then
            status = 1
            return
        end if

        multiply = 0

        multiply_columns: do i=1, size(first, 1)
            multiply_rows: do j=1, size(second, 2)
                elems: do k=1, size(first, 2)
                    multiply(i,j) = multiply(i,j) + first(i,k) * second(k,j)
                end do elems
            end do multiply_rows
        end do multiply_columns
        
    end subroutine

end module matrix_mul
