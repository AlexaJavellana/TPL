program Solve_Caeser
  implicit none 

character(70) :: csrString 
integer :: key 
character :: originalMsg
integer :: s
character :: x

print *, "Welcome to the program to solve a ceaser cipher. First, put in the original message: "
read(*,'(A)') csrString
print *, "Max shift value: "
read(*,*) key

originalMsg = csrString

print *, "Solving... "

print *, "Solved. Caeser shifts are: "
  do s = 1, key  
    csrString = originalMsg
    x = solve(csrString, s)
    print *, "Ceaser ", s, ": ", x 
  end do
  

contains 

CHARACTER FUNCTION solve(message, key) 
  IMPLICIT NONE
  integer :: key
  character(*), intent(inout) :: message
  character :: ltr
  integer :: i

  do i = 1, LEN_TRIM(message)
    ltr = message(i:i)
    if (ltr >= 'A' .and. ltr <= 'Z') then  
      ltr = achar(modulo(iachar(message(i:i)) - 65 + key, 26) + 65)
      message(i:i) = ltr
    else if (ltr >= 'a' .and. ltr <= 'z') then
      ltr = achar(modulo(iachar(message(i:i)) - 97 + key, 26) + 97)
      message(i:i) = ltr
    end if
  end do
  solve = message
end FUNCTION solve

end program Solve_Caeser