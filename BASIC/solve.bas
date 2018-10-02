Function Solve(csrString As String, key As Integer) as String 
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

Dim csrString as String * 70
Dim originalMsg as String * 70 
Dim maxShift as Integer
Dim x as String * 70 

Input "Welcome to the program to solve a ceaser cipher. First, put in the original message: ", csrString
Print 
'Print csrString
Input "Max shift value: ", maxShift 
Print 
'Print key 
'Declare originalMsg now as csrString, just to keep primary input
originalMsg = csrString
Print "Solving..."
Print "Solved. Caeser shifts are: "

' loops for solve caeser 
FOR start As Integer = 0 to maxShift:
    csrString = originalMsg
    x = solve(csrString, start)
    Print "Caeser ", start, ": ", x 
NEXT 
End