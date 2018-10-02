'Start program caeser.bas
Function Encrypt(csrString As String, key As Integer) as String 
  Dim ltr as Integer

  FOR i As Integer = 0 to Len(csrString)
    if(csrString[i] >= 65 AND csrString[i] <= 90) THEN
      'uppercase encrypt
      ltr = ((csrString[i] - 65 + key) Mod 26) + 65
      csrString[i] = ltr 
    elseif(csrString[i] >= 97 AND csrString[i] <= 122) THEN
      'lowercase encrypt
      ltr = ((csrString[i] - 97 + key) Mod 26) + 97
      csrString[i] = ltr 
    end if
  NEXT
  return csrString
End Function

Function Decrypt(csrString As String, key As Integer) as String 
  Dim ltr as Integer

  FOR i As Integer = 0 to Len(csrString)
    if(csrString[i] >= 65 AND csrString[i] <= 90) THEN
      'uppercase encrypt
      ltr = ((csrString[i] - 65 - key) Mod 26) + 65
      csrString[i] = ltr 
    elseif(csrString[i] >= 97 AND csrString[i] <= 122) THEN
      'lowercase encrypt
      ltr = ((csrString[i] - 97 - key) Mod 26) + 97
      csrString[i] = ltr 
    end if
  NEXT
  return csrString
End Function

Dim csrString as String * 70
Dim originalMsg as String * 70 
Dim key as Integer

Input "Type your message: ", csrString
Print 
'Print csrString
Input "Enter cipher: ", key 
Print 
'Print key 
'Declare originalMsg now as csrString, just to keep primary input
originalMsg = csrString
Print "Message: ", originalMsg 
Print "Encrypted Message: ", Encrypt(csrString, key)
Print "Decrypted Message: ", Decrypt(csrString, key)
End

