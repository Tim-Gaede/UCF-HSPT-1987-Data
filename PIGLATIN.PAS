{$C+}
{$U+}
{$R+}

var
  infile,outfile : text;
  ch : char;
  i : integer;
  capital : boolean;
  word : packed array[1..100] of char;

const
  Caps : set of char = ['A' .. 'Z'];
  Letters : set of char = ['a' .. 'z'];
  Vowels : set of char = ['a','e','i','o','u'];

function toupper(c : char) : char;
begin
  case c of
    'a' : toupper := 'A';
    'b' : toupper := 'B';
    'c' : toupper := 'C';
    'd' : toupper := 'D';
    'e' : toupper := 'E';
    'f' : toupper := 'F';
    'g' : toupper := 'G';
    'h' : toupper := 'H';
    'i' : toupper := 'I';
    'j' : toupper := 'J';
    'k' : toupper := 'K';
    'l' : toupper := 'L';
    'm' : toupper := 'M';
    'n' : toupper := 'N';
    'o' : toupper := 'O';
    'p' : toupper := 'P';
    'q' : toupper := 'Q';
    'r' : toupper := 'R';
    's' : toupper := 'S';
    't' : toupper := 'T';
    'u' : toupper := 'U';
    'v' : toupper := 'V';
    'w' : toupper := 'W';
    'x' : toupper := 'X';
    'y' : toupper := 'Y';
    'z' : toupper := 'Z';
  end;
end;

function tolower(c : char) : char;
begin
  case c of
    'A' : tolower := 'a';
    'B' : tolower := 'b';
    'C' : tolower := 'c';
    'D' : tolower := 'd';
    'E' : tolower := 'e';
    'F' : tolower := 'f';
    'G' : tolower := 'g';
    'H' : tolower := 'h';
    'I' : tolower := 'i';
    'J' : tolower := 'j';
    'K' : tolower := 'k';
    'L' : tolower := 'l';
    'M' : tolower := 'm';
    'N' : tolower := 'n';
    'O' : tolower := 'o';
    'P' : tolower := 'p';
    'Q' : tolower := 'q';
    'R' : tolower := 'r';
    'S' : tolower := 's';
    'T' : tolower := 't';
    'U' : tolower := 'u';
    'V' : tolower := 'v';
    'W' : tolower := 'w';
    'X' : tolower := 'x';
    'Y' : tolower := 'y';
    'Z' : tolower := 'z';
  end;
end;

procedure getword;
begin
  capital := false;
  if ch in Caps then begin
    capital := true;
    ch := tolower(ch);
  end;
  i := 0;
  while (ch in Letters) and not eoln(infile) do begin
    i := i + 1;
    word[i] := ch;
    read(infile,ch);
  end;
  if eoln(infile) and (ch in Letters) then begin
    i := i + 1;
    word[i] := ch;
  end;
end;

procedure topig;
var j,k : integer;
begin
  j := 1;
  while not (word[j] in Vowels) do j := j + 1;
  if capital then write(toupper(word[j])) else write(word[j]);
  for k := j+1 to i do write(word[k]);
  for k := 1 to j-1 do write(word[k]);
  if word[1] in Vowels then write('h');
  write('ay');
  if eoln(infile) then begin
    writeln;
    readln(infile);
    read(infile,ch);
  end;
end;

procedure advance;
begin
  while (ch in [' ','.']) and not eoln(infile) do begin
    write(ch);
    read(infile,ch);
  end;
  if ch = '.' then write('.');
end;

begin

  assign(infile,'piglatin.in');
  reset(infile);

  read(infile,ch);

  while not eof(infile) do begin
    getword;
    topig;
    advance;
  end;

end.

