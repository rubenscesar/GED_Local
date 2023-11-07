var
  Query: OleVariant;

				
  Query := QueryOpen('select Codigo from EST where EMP_Codigo = ''0003''');
	while not Query.Eof do
	begin
	  QueryExec('insert into HES (EMP_CODIGO, EST_CODIGO, DATA, INFITENSDOCS) values (''0003'',''' + Query.FieldByName('Codigo').AsString + ''',''2012-04-01'', 1)');
	  Query.Next;
	end;
				
	QueryExec('update hem set hem.atividadeimobiliaria = 1 where hem.emp_codigo = ''0003'' and hem.data = ''2008-07-01'' ');
				
	QueryExec('delete from hem where hem.emp_codigo = ''0003'' and hem.data = ''2012-04-01'' ');
	QueryExec('delete from hes where hes.emp_codigo = ''0003'' and hes.est_codigo = ''0001'' and hes.data = ''2014-02-01'' ');

