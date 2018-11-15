program create_square
    use iso_fortran_env, only: real64
    implicit none
    include "size.h"
    real(kind=real64) :: x(nx), y(ny), z(nz)
    real(kind=real64) :: B(3)
    integer :: ii, jj, kk, outunit

    x = [((ii-real(nx/2, kind=real64)), ii=0, nx-1)]
    y = [((ii-real(ny/2, kind=real64)), ii=0, ny-1)]
    z = [((ii-real(nz/2, kind=real64)), ii=0, nz-1)]

    open(newunit=outunit, file='data.txt', action='write', status='new')

    do kk=1, nz
        do jj = 1, ny
            do ii = 1, nx
                call random_number(B)
                write(outunit, '(6(F15.5))') x(ii), y(jj), z(kk), B
            end do
        end do
    end do
    
    close(outunit)

end program create_square
