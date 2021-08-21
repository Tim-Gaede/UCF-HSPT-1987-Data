{$C+}
{$U+}
{$R+}

var
  x,y : real;
  x1,x2,x3,y1,y2,y3 : real;
  m1,m2,b1,b2,xmid,ymid : real;
  d1,d2,d,temp : real;
  infile : text;

begin

  assign(infile,'circle.in');
  reset(infile);

  while not eof(infile) do begin
    readln(infile,x1,y1,x2,y2,x3,y3);

    if y1 = y2 then begin
      temp := x1;
      x1 := x3;
      x3 := temp;
      temp := y1;
      y1 := y3;
      y3 := temp;
    end;
    if y1 = y3 then begin
      temp := x1;
      x1 := x2;
      x2 := temp;
      temp := y1;
      y1 := y2;
      y2 := temp;
    end;

    m1 := (x1 - x2) / (y2 - y1);
    xmid := (x1 + x2) / 2.0;
    ymid := (y1 + y2) / 2.0;
    b1 := ymid - m1 * xmid;

    m2 := (x1 - x3) / (y3 - y1);
    xmid := (x1 + x3) / 2.0;
    ymid := (y1 + y3) / 2.0;
    b2 := ymid - m2 * xmid;

    x := (b2 - b1) / (m1 - m2);
    y := (m1 * b2 - m2 * b1) / (m1 - m2);

    d1 := x - x1;
    d2 := y - y1;
    d := sqrt(d1 * d1 + d2 * d2);

    writeln('Center: (',x:7:2,',',y:7:2,') Radius: ',d:7:2);

  end;

end.
