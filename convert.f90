program convert
    use iso_fortran_env, only: real64
    implicit none
    include "size.h"
    integer :: ii, ios
    integer :: u_in, u_out
    real(kind=real64) :: pos(3), B(3)

    open(newunit=u_in, file='data.txt', form='formatted', &
        status='old', action='read', access='sequential')
    open(newunit=u_out, file='data.bin', form='unformatted', &
        status='new', action='write', access='direct', recl=6*8)
    ii = 0
    do
        ii = ii + 1
        read(u_in, *, iostat=ios) pos, B
        if (ios /= 0) exit
        write(u_out, rec=ii) pos, B
    end do

    close(u_out)
    close(u_in)
end program convert
