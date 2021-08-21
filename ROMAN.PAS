{$C+}
{$U+}
{$R+}

var
  thousands, hundreds, tens, ones : array[0..9] of string[20];
  infile : text;
  a,b : integer;

function getnumber : integer;
var total, value, lastvalue : integer;
    ch : char;
begin
  total := 0;
  lastvalue := 2000;
  while not eoln(infile) do begin
    read(infile,ch);
    case ch of
      'M' : value := 1000;
      'D' : value := 500;
      'C' : value := 100;
      'L' : value := 50;
      'X' : value := 10;
      'V' : value := 5;
      'I' : value := 1;
    end;
    total := total + value;
    if value > lastvalue then total := total - 2*lastvalue;
    lastvalue := value;
  end;
  readln(infile);
  getnumber := total;
end;

procedure putnumber(n : integer);
var a,b,c,d : integer;
begin
  a := n div 1000;
  n := n - a*1000;
  b := n div 100;
  n := n - b*100;
  c := n div 10;
  n := n - c * 10;
  d := n;
  writeln(thousands[a],hundreds[b],tens[c],ones[d]);
end;

begin
  thousands[0] := '';
  thousands[1] := 'M';
  thousands[2] := 'MM';
  thousands[3] := 'MMM';
  thousands[4] := 'MMMM';
  thousands[5] := 'MMMMM';
  thousands[6] := 'MMMMMM';
  thousands[7] := 'MMMMMMM';
  thousands[8] := 'MMMMMMMM';
  thousands[9] := 'MMMMMMMMM';

  hundreds[0] := '';
  hundreds[1] := 'C';
  hundreds[2] := 'CC';
  hundreds[3] := 'CCC';
  hundreds[4] := 'CD';
  hundreds[5] := 'D';
  hundreds[6] := 'DC';
  hundreds[7] := 'DCC';
  hundreds[8] := 'DCCC';
  hundreds[9] := 'CM';

  tens[0] := '';
  tens[1] := 'X';
  tens[2] := 'XX';
  tens[3] := 'XXX';
  tens[4] := 'XL';
  tens[5] := 'L';
  tens[6] := 'LX';
  tens[7] := 'LXX';
  tens[8] := 'LXXX';
  tens[9] := 'XC';

  ones[0] := '';
  ones[1] := 'I';
  ones[2] := 'II';
  ones[3] := 'III';
  ones[4] := 'IV';
  ones[5] := 'V';
  ones[6] := 'VI';
  ones[7] := 'VII';
  ones[8] := 'VIII';
  ones[9] := 'IX';

  assign(infile,'roman.in');
  reset(infile);

  while not eof(infile) do begin
    a := getnumber;
    b := getnumber;
    putnumber(a+b);
  end;

end.

