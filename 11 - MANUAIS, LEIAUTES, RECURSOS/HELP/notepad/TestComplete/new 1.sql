 hem.emp_codigo = '0003' and hem.data = '20
delete from hem where hem.emp_codigo = '0003' and hem.data = '2015-05-01'

procedure InsereHES([E: array(3) of string);
begin

  Query := QueryOpen('select Codigo from EST where EMP_Codigo = ''0003''');
  while not Query.Eof do
  begin
    insert into HES (arrayCampos) values (arrayValores)
    Query.Next;
  end;
END;

