program Solve;

function encrypt(var csrString: string; key: integer): string;
var 
  i: integer;
begin
  for i := 1 to Length(csrString) do 
    case csrString[i] of
      'A' .. 'Z' : csrString[i] := chr(ord('A') + (ord(csrString[i]) - ord('A') + key) mod 26);
      'a' .. 'z' : csrString[i] := chr(ord('a') + (ord(csrString[i]) - ord('a') + key) mod 26);
    end;
encrypt := csrString;
end;

type 
  messages = string;
  values = integer;

var 
  csrString, originalMsg, currentCaesar: messages;
  maxShift: values;
  y: values;

begin
  writeln('Welcome to the program to solve a ceaser cipher. First, put in the original message: ');
  readln(csrString);
 
  writeln('Max shift value: ');
  readln(maxShift);

  originalMsg := csrString;

  for y := 0 to maxShift do 
  begin
    csrString := originalMsg;
    currentCaesar := encrypt(csrString, y);
    writeln('Caesar ', y, ': ', currentCaesar);
  end;
end.