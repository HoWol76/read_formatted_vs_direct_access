program read_txt
    use iso_fortran_env, only: real64
    implicit none
    include "size.h"
    real(kind=real64) :: request(3), pos(3), B(3)
    integer :: ios, u_in
    integer :: ii, jj, kk, record
    integer, parameter :: reclength = 6 * 8 ! Six 8-byte values

    open(newunit=u_in, file='data.bin', access='direct', form='unformatted', &
        status='old', action='read', recl=reclength)
    mainloop : do
        read(*, *, iostat=ios) request
        if (ios /= 0) exit mainloop
        write(*, '(A, 3F7.2)') 'searching for ', request
        ! Calculate record
        ii = int((request(1)-x_min + x_step/2)/x_step)
        jj = int((request(2)-y_min + y_step/2)/y_step)
        kk = int((request(3)-z_min + z_step/2)/z_step)
        record = kk + jj * nz + ii * nz * ny + 1
        read(u_in, rec=record, iostat=ios) pos, B
        if (ios /= 0) then
            print *, 'failure to read'
            cycle mainloop
        end if
        write(*, '(2(A, 3F7.2))') "found pos: ", pos, " Bx, By, Bz: ", B
    end do mainloop
    close(u_in)
end program read_txt


        
