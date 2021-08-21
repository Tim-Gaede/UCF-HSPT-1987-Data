{$C+}
{$U+}
{$R+}

type poly = record
              order : integer;
              coef : array[0..10] of integer;
            end;

var infile : text;
    a,b,c : poly;
    i : integer;

procedure writepoly(p : poly);
var i : integer;
    prev : boolean;
begin
  prev := false;
  for i := p.order downto 0 do begin
    if p.coef[i] <> 0 then begin
      if prev then write(' + ');
      prev := true;
      if i = 0 then write(p.coef[i]) else begin
        if p.coef[i] <> 1 then write(p.coef[i],' ');
        write('X');
        if i > 1 then write(' ^ ',i);
      end;
    end;
  end;
  writeln;
end;

begin

  assign(infile,'poly.in');
  reset(infile);

  while not eof(infile) do begin

    readln(infile,a.order);
    for i := a.order downto 0 do read(infile,a.coef[i]);
    readln(infile);
    readln(infile,b.order);
    for i := b.order downto 0 do read(infile,b.coef[i]);
    readln(infile);

    if a.order > b.order then c.order := a.order
                         else c.order := b.order;

    for i := c.order downto 0 do begin
      if i > a.order then c.coef[i] := b.coef[i]
      else if i > b.order then c.coef[i] := a.coef[i]
      else c.coef[i] := a.coef[i] + b.coef[i];
    end;

    write('P(X) = '); writepoly(a);
    write('Q(X) = '); writepoly(b);
    write('P(X) + Q(X) = '); writepoly(c);
    writeln;

  end;

end.






