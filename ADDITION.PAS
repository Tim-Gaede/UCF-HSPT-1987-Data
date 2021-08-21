{$C+}
{$U+}
{$R+}

var
  infile : text;
  p,q,r : integer;

begin

  assign(infile,'addition.in');
  reset(infile);

  while not eof(infile) do begin

    readln(infile,p,q);
    r := p + q;
    writeln('THE SUM OF ',p,' AND ',q,' IS ',r);

  end;

end.
