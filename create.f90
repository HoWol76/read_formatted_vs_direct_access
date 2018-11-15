program create_square
    use iso_fortran_env, only: real64
    implicit none
    include "size.h"
    real(kind=real64) :: x(nx), y(ny), z(nz)
    real(kind=real64) :: B(3)
    integer :: ii, jj, kk, outunit

    x = [(x_min + ii * x_step, ii=0, nx-1)]
    y = [(y_min + jj * y_step, jj=0, ny-1)]
    z = [(z_min + kk * z_step, kk=0, nz-1)]

    open(newunit=outunit, file='data.txt', action='write', status='new')

    do ii = 1, nx
        do jj = 1, ny
            do kk=1, nz
                call random_number(B)
                write(outunit, '(6(F15.5))') x(ii), y(jj), z(kk), B
            end do
        end do
    end do
    
    close(outunit)

end program create_square
