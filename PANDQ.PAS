{$C+}
{$U+}
{$R+}

var
  infile : text;
  p,q : integer;
  c : char;

begin

  assign(infile,'pandq.in');
  reset(infile);

  while not eof(infile) do begin

    p := 0;
    q := 0;

    while not eoln(infile) do begin

      read(infile,c);
      if c = 'P' then p := p + 1;
      if c = 'Q' then q := q + 1;

    end;
    readln(infile);

    writeln(p:5,'  P''S,',q:5,'  Q''S');

  end;

end.
