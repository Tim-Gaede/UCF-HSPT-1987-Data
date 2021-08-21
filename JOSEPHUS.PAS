{$C+}
{$U+}
{$R+}

var
  infile : text;
  current : integer;
  n,m : integer;
  i,j : integer;
  dead : array[1..10] of boolean;

procedure advance;
begin
  current := current + 1;
  if current > n then current := 1;
end;

procedure next;
begin
  advance;
  while dead[current] do advance;
end;

begin

  assign(infile,'josephus.in');
  reset(infile);

  while not eof(infile) do begin
    current := 0;
    readln(infile,n,m);
    for i := 1 to n do dead[i] := false;
    for i := 1 to n do begin
      for j := 1 to m do next;
      write(current:5);
      dead[current] := true;
    end;
    writeln;
  end;

end.
