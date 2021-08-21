{$C+}
{$U+}
{$R+}

var
  correct, points, order : array[1..30] of integer;
  nteams, nproblems : integer;
  time, nruns : integer;
  infile : text;
  i,j,temp : integer;

begin
  assign(infile,'contest.in');
  reset(infile);
  readln(infile,nteams,nproblems);
  for i := 1 to nteams do begin
    order[i] := i;
    correct[i] := 0;
    points[i] := 0;
    for j := 1 to nproblems do begin
      read(infile,time,nruns);
      if time > 0 then begin
        correct[i] := correct[i] + 1;
        points[i] := points[i] + time + 20*nruns;
      end;
    end;
    readln(infile);
  end;
  for i := 1 to nteams-1 do
    for j := 1 to nteams-i do
      if (correct[order[j+1]] > correct[order[j]]) or
        ((correct[order[j+1]] = correct[order[j]]) and
         (points[order[j+1]] < points[order[j]])) then begin
         temp := order[j+1];
         order[j+1] := order[j];
         order[j] := temp;
       end;
  writeln('PLACE':15,'TEAM':15,'NUMBER CORRECT':15,'PENALTY POINTS':15);
  for i := 1 to nteams do
    writeln(i:15,order[i]:15,correct[order[i]]:15,
                                     points[order[i]]:15);

end.



