{$C+}
{$U+}
{$R+}

var
  arr, long : array[1..30] of integer;
  maxsofar, max : integer;
  i,j,n : integer;
  infile : text;

begin
  assign(infile,'monotone.in');
  reset(infile);
  while not eof(infile) do begin
    n := 0;
    while not eoln(infile) do begin
      n := n + 1;
      read(infile,arr[n]);
      write(arr[n]:5);
    end;
    readln(infile);
    writeln;
    max := 1;
    for i := 1 to n do begin
      maxsofar := 1;
      for j := 1 to i-1 do if arr[i] > arr[j] then
        if long[j]+1 > maxsofar then maxsofar := long[j]+1;
      long[i] := maxsofar;
      if maxsofar > max then max := maxsofar;
    end;
   writeln('THE LENGTH OF THE LONGEST INCREASING SUBSEQUENCE IS ',max);
   writeln;
  end;
end.



