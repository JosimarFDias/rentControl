unit uCDAO_Cliente;

interface
uses
  Classes, SysUtils, SQLExpr, uC_Cliente;
type
  TDAOCliente=class
  private
    class function GetNextID:Integer;
  public
    class function Create(pCliente:TCliente; pControlaTransacao:Boolean=True):Boolean;
    class function Read(pCodCliente:Integer):TCliente;overload;
    class function Read(pNomePesquisa:string; pFiltraAlunos:Boolean=False):TList;overload;
    class function Update(pCliente:TCliente):Boolean;
    class function Delete(pCliente:TCliente; pControlaTransacao:Boolean=True):Boolean;
  end;
implementation

{ TDAOCliente }

uses uDM, StrUtils;

class function TDAOCliente.Create(pCliente: TCliente;
  pControlaTransacao: Boolean): Boolean;
var
  vQry:TSQLQuery;
  vTransacao:TTransactionDesc;
begin
  Result := True;
  vQry := TSQLQuery.Create(nil);
  try
    vQry.SQLConnection := DM.Connect;
    vQry.SQL.Text := 'insert into cliente (cli_cd_cliente, cli_ds_cliente, '+
                     'cli_ds_telefone, cli_ds_email, cli_ds_logradouro, ' +
                     'cli_ds_complemento, cli_ds_numero, cli_ds_cep, '+
                     'cli_ds_municipio, cli_ds_uf, cli_ds_bairro, cli_ds_cpf, '+
                     'cli_ds_cnpj, cli_dt_nascimento, cli_fl_aluno, ' +
                     'cli_ds_responsavel, cli_vl_mensalidadeescolinha) ' +
                     'values (:id, :nome, ' +
                     ':telefone, :email, :log, :comp, :num, :cep, :muni, :uf, ' +
                     ':bairro, :cpf, :cnpj, :nascimento, :aluno, :responsavel, :mensalidade)';
    if pCliente.Codigo = 0 then
      pCliente.Codigo := GetNextID;
    vQry.ParamByName('id').AsInteger := pCliente.Codigo;
    vQry.ParamByName('nome').AsString := pCliente.Nome;
    vQry.ParamByName('telefone').AsString := pCliente.Telefone;
    vQry.ParamByName('email').AsString := pCliente.Email;
    vQry.ParamByName('log').AsString := pCliente.Endereco.Logradouro;
    vQry.ParamByName('comp').AsString := pCliente.Endereco.Complemento;
    vQry.ParamByName('num').AsString := pCliente.Endereco.Numero;
    vQry.ParamByName('cep').AsString := pCliente.Endereco.CEP;
    vQry.ParamByName('muni').AsString := pCliente.Endereco.Municipio;
    vQry.ParamByName('uf').AsString := pCliente.Endereco.UF;
    vQry.ParamByName('bairro').AsString := pCliente.Endereco.Bairro;
    vQry.ParamByName('cpf').AsString := pCliente.CPF;
    vQry.ParamByName('cnpj').AsString := pCliente.CNPJ;
    vQry.ParamByName('nascimento').AsDate := pCliente.Nascimento;
    vQry.ParamByName('aluno').AsString := IfThen(pCliente.Aluno, 'S', 'N');
    vQry.ParamByName('responsavel').AsString := pCliente.Responsavel;
    vQry.ParamByName('mensalidade').AsCurrency := pCliente.ValorMensalidade;
    if pControlaTransacao then
    begin
      vTransacao.TransactionID := 1;
      vTransacao.IsolationLevel := xilREADCOMMITTED;
      DM.Connect.StartTransaction(vTransacao);
    end;
    try
      vQry.ExecSQL();
    except
      Result := False;
    end;
    if pControlaTransacao then
    begin
      if Result then
        DM.Connect.Commit(vTransacao)
      else
        DM.Connect.Rollback(vTransacao);
    end;
  finally
    vQry.Free;
  end;
end;

class function TDAOCliente.Delete(pCliente: TCliente;
  pControlaTransacao: Boolean): Boolean;
var
  vQry:TSQLQuery;
  vTransacao:TTransactionDesc;
begin
  Result := True;
  vQry := TSQLQuery.Create(nil);
  try
    vQry.SQLConnection := DM.Connect;
    vQry.SQL.Text := 'delete from cliente where cli_cd_cliente = :id';
    vQry.ParamByName('id').AsInteger := pCliente.Codigo;

    if pControlaTransacao then
    begin
      vTransacao.TransactionID := 1;
      vTransacao.IsolationLevel := xilREADCOMMITTED;
      DM.Connect.StartTransaction(vTransacao);
    end;
    try
      vQry.ExecSQL();
    except
      Result := False;
    end;
    if pControlaTransacao then
    begin
      if Result then
        DM.Connect.Commit(vTransacao)
      else
        DM.Connect.Rollback(vTransacao);
    end;
  finally
    vQry.Free;
  end;
end;

class function TDAOCliente.GetNextID: Integer;
var
  vProc:TSQLStoredProc;
begin
  vProc := TSQLStoredProc.Create(nil);
  try
    vProc.SQLConnection := DM.Connect;
    vProc.StoredProcName := 'SP_GEN_CLIENTE_ID';
    try
      vProc.ExecProc;
    except
    end;
    Result := vProc.Params[0].Value;
  finally
    vProc.Free;
  end;
end;

class function TDAOCliente.Read(pNomePesquisa: string;
  pFiltraAlunos:Boolean=False): TList;
var
  vQry:TSQLQuery;
  vCliente:TCliente;
begin
  Result := nil;
  vQry := TSQLQuery.Create(nil);
  try
    vQry.SQLConnection := DM.Connect;
    if pFiltraAlunos then
      vQry.SQL.Text := 'select * from cliente where cli_ds_cliente like :nome ' +
                       'and cli_fl_aluno = ''S'' order by cli_ds_cliente'
    else
      vQry.SQL.Text := 'select * from cliente where cli_ds_cliente like :nome ' +
                       'order by cli_ds_cliente';
    vQry.ParamByName('nome').AsString := pNomePesquisa+'%';
    vQry.Open;
    if not vQry.IsEmpty then
    begin
      Result := TList.Create;
      vQry.First;
      while not vQry.Eof do
      begin
        vCliente := TCliente.Create;
        vCliente.Codigo := vQry.FieldByName('cli_cd_cliente').AsInteger;
        vCliente.Nome := vQry.FieldByName('cli_ds_cliente').AsString;
        vCliente.Telefone := vQry.FieldByName('cli_ds_telefone').AsString;
        vCliente.Email := vQry.FieldByName('cli_ds_email').AsString;
        Result.Add(vCliente);
        vQry.Next;
      end;
    end;
  finally
    vQry.Free;
  end;
end;

class function TDAOCliente.Read(pCodCliente: Integer): TCliente;
var
  vQry:TSQLQuery;
begin
  vQry := TSQLQuery.Create(nil);
  try
    vQry.SQLConnection := DM.Connect;
    vQry.SQL.Text := 'select * from cliente where cli_cd_cliente = :id';
    vQry.ParamByName('id').AsInteger := pCodCliente;
    vQry.Open;
    if not vQry.IsEmpty then
    begin
      Result := TCliente.Create;
      Result.Codigo               := vQry.FieldByName('cli_cd_cliente').AsInteger;
      Result.Nome                 := vQry.FieldByName('cli_ds_cliente').AsString;
      Result.Telefone             := vQry.FieldByName('cli_ds_telefone').AsString;
      Result.Email                := vQry.FieldByName('cli_ds_email').AsString;
      Result.Endereco.Logradouro  := vQry.FieldByName('CLI_DS_LOGRADOURO').AsString;
      Result.Endereco.Complemento := vQry.FieldByName('CLI_DS_COMPLEMENTO').AsString;
      Result.Endereco.Numero      := vQry.FieldByName('CLI_DS_NUMERO').AsString;
      Result.Endereco.CEP         := vQry.FieldByName('CLI_DS_CEP').AsString;
      Result.Endereco.Bairro      := vQry.FieldByName('CLI_DS_BAIRRO').AsString;
      Result.Endereco.Municipio   := vQry.FieldByName('CLI_DS_MUNICIPIO').AsString;
      Result.Endereco.UF          := vQry.FieldByName('CLI_DS_UF').AsString;
      Result.CPF                  := vQry.FieldByName('CLI_DS_cpf').AsString;
      Result.CNPJ                 := vQry.FieldByName('CLI_DS_cnpj').AsString;
      Result.Nascimento           := vQry.FieldByName('cli_dt_nascimento').AsDateTime;
      Result.Aluno                := vQry.FieldByName('cli_fl_aluno').AsString='S';
      Result.Responsavel          := vQry.FieldByName('cli_ds_responsavel').AsString;
      Result.ValorMensalidade     := vQry.FieldByName('cli_vl_mensalidadeescolinha').AsCurrency;
    end;
  finally
    vQry.Free;
  end;
end;

class function TDAOCliente.Update(pCliente: TCliente): Boolean;
var
  vTransacao:TTransactionDesc;
begin
  Result := True;
  vTransacao.TransactionID := 2;
  vTransacao.IsolationLevel := xilREADCOMMITTED;

  DM.Connect.StartTransaction(vTransacao);

  if Delete(pCliente, False) then
    Result := Create(pCliente, False);

  if Result then
    DM.Connect.Commit(vTransacao)
  else
    DM.Connect.Rollback(vTransacao);
end;

end.
