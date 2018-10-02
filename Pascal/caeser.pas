program Caeser;
type 
  messages = string;
  values = integer;

var 
  csrString, originalMsg: messages;
  key: values;

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

function decrypt(var csrString: string; key: integer): string;
var 
  i: integer;
begin
  for i := 1 to Length(csrString) do 
    case csrString[i] of
      'A' .. 'Z' : csrString[i] := chr(ord('A') + (ord(csrString[i]) - ord('A') - key) mod 26);
      'a' .. 'z' : csrString[i] := chr(ord('a') + (ord(csrString[i]) - ord('a') - key) mod 26);
    end;
decrypt := csrString;
end;


begin
  writeln('Type your message: ');
  readln(csrString);
 
  writeln('Enter cipher: ');
  readln(key);

  originalMsg := csrString;

  writeln('Original message: ', csrString);
  encrypt(csrString, key);
  writeln('Encrypted message: ', csrString);
  decrypt(csrString, key);
  writeln('Decrypted message: ', csrString);
end.
