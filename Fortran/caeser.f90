program Caeser
  implicit none 

character(70) :: csrString 
character(70) :: originalMsg
integer :: s

print *, "Type your message: "
read(*,'(A)') csrString
print *, "Enter cipher: "
read(*,'(A)') s

originalMsg = csrString

print *, "Message: ", originalMsg
call encrypt(csrString)
print *, "Encrypted Message: ", csrString
call decrypt(csrString)
print *, "Decrypted Message: ", csrString

contains

subroutine encrypt(message) 
  integer :: i 
  character(*), intent(inout) :: message
  character :: ltr

  do i = 1, LEN_TRIM(message)
    ltr = message(i:i)
    if (ltr >= 'A' .and. ltr <= 'Z') then  
      ltr = achar(modulo(iachar(message(i:i)) - 65 + s, 26) + 65)
      message(i:i) = ltr
    else if (ltr >= 'a' .and. ltr <= 'z') then
      ltr = achar(modulo(iachar(message(i:i)) - 97 + s, 26) + 97)
      message(i:i) = ltr
    end if
  end do
end subroutine 

subroutine decrypt(message) 
  integer :: i 
  character(*), intent(inout) :: message
  character :: ltr

  do i = 1, LEN_TRIM(message)
    ltr = message(i:i)
    if (ltr >= 'A' .and. ltr <= 'Z') then  
      ltr = achar(modulo(iachar(message(i:i)) - 65 - s, 26) + 65)
      message(i:i) = ltr
    else if (ltr >= 'a' .and. ltr <= 'z') then
      ltr = achar(modulo(iachar(message(i:i)) - 97 - s, 26) + 97)
      message(i:i) = ltr
    end if
  end do
end subroutine 
end program Caeser
