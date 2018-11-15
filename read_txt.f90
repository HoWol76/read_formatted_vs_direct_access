program read_txt
    use iso_fortran_env, only: real64
    implicit none
    include "size.h"
    real(kind=real64) :: request(3), pos(3), B(3)
    integer :: ios, u_in

    open(newunit=u_in, file='data.txt', access='sequential', form='formatted', &
        status='old', action='read')
    mainloop : do
        read(*, *, iostat=ios) request
        if (ios /= 0) exit mainloop
        write(*, '(A, 3F7.2)') 'searching for ', request
        rewind(u_in)
        searchloop : do
            read(u_in, *, iostat=ios) pos, B
            if (ios /= 0) then
                print *, "not found"
                exit searchloop
            end if
            if (maxval(abs(pos-request)) < 0.1) then
                write(*, '(2(A, 3F7.2))') "found pos: ", pos, " Bx, By, Bz: ", B
                exit searchloop
            end if
        end do searchloop
    end do mainloop
    close(u_in)
end program read_txt


        
