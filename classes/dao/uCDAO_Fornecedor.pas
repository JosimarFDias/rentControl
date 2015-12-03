unit uCDAO_Fornecedor;

interface
uses
  Classes, SysUtils, SQLExpr, uC_Fornecedor;
type
  TDAOFornecedor=class
  private
    class function GetNextID:Integer;
  public
    class function Create(pFornecedor:TFornecedor; pControlaTransacao:Boolean=True):Boolean;
    class function Read(pCodFornecedor:Integer):TFornecedor;overload;
    class function Read(pNomePesquisa:string):TList;overload;
    class function Update(pFornecedor:TFornecedor):Boolean;
    class function Delete(pFornecedor:TFornecedor; pControlaTransacao:Boolean=True):Boolean;
  end;
implementation

{ TDAOFornecedor }

uses uDM;

class function TDAOFornecedor.Create(pFornecedor: TFornecedor;
  pControlaTransacao: Boolean): Boolean;
var
  vQry:TSQLQuery;
  vTransacao:TTransactionDesc;
begin
  Result := True;
  vQry := TSQLQuery.Create(nil);
  try
    vQry.SQLConnection := DM.Connect;
    vQry.SQL.Text := 'insert into fornecedor (for_cd_fornecedor, for_ds_fornecedor, for_ds_telefone, for_ds_email, for_ds_logradouro, ' +
                     'for_ds_complemento, for_ds_numero, for_ds_cep, for_ds_municipio, for_ds_uf, for_ds_bairro ) values (:id, :nome, :telefone, ' +
                     ':email, :log, :comp, :num, :cep, :muni, :uf, :bairro)';
    if pFornecedor.Codigo = 0 then
      pFornecedor.Codigo := GetNextID;
    vQry.ParamByName('id').AsInteger := pFornecedor.Codigo;
    vQry.ParamByName('nome').AsString := pFornecedor.Nome;
    vQry.ParamByName('telefone').AsString := pFornecedor.Telefone;
    vQry.ParamByName('email').AsString := pFornecedor.Email;
    vQry.ParamByName('log').AsString := pFornecedor.Endereco.Logradouro;
    vQry.ParamByName('comp').AsString := pFornecedor.Endereco.Complemento;
    vQry.ParamByName('num').AsString := pFornecedor.Endereco.Numero;
    vQry.ParamByName('cep').AsString := pFornecedor.Endereco.CEP;
    vQry.ParamByName('muni').AsString := pFornecedor.Endereco.Municipio;
    vQry.ParamByName('uf').AsString := pFornecedor.Endereco.UF;
    vQry.ParamByName('bairro').AsString := pFornecedor.Endereco.Bairro;

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

class function TDAOFornecedor.Delete(pFornecedor: TFornecedor;
  pControlaTransacao: Boolean): Boolean;
var
  vQry:TSQLQuery;
  vTransacao:TTransactionDesc;
begin
  Result := True;
  vQry := TSQLQuery.Create(nil);
  try
    vQry.SQLConnection := DM.Connect;
    vQry.SQL.Text := 'delete from fornecedor where for_cd_fornecedor = :id';
    vQry.ParamByName('id').AsInteger := pFornecedor.Codigo;

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

class function TDAOFornecedor.GetNextID: Integer;
var
  vProc:TSQLStoredProc;
begin
  vProc := TSQLStoredProc.Create(nil);
  try
    vProc.SQLConnection := DM.Connect;
    vProc.StoredProcName := 'SP_GEN_FORNECEDOR_ID';
    try
      vProc.ExecProc;
    except
    end;
    Result := vProc.Params[0].Value;
  finally
    vProc.Free;
  end;
end;

class function TDAOFornecedor.Read(pNomePesquisa: string): TList;
var
  vQry:TSQLQuery;
  vFornecedor:TFornecedor;
begin
  Result := nil;
  vQry := TSQLQuery.Create(nil);
  try
    vQry.SQLConnection := DM.Connect;
    vQry.SQL.Text := 'select * from fornecedor where for_ds_fornecedor like :nome';
    vQry.ParamByName('nome').AsString := pNomePesquisa+'%';
    vQry.Open;
    if not vQry.IsEmpty then
    begin
      Result := TList.Create;
      vQry.First;
      while not vQry.Eof do
      begin
        vFornecedor := TFornecedor.Create;
        vFornecedor.Codigo := vQry.FieldByName('for_cd_fornecedor').AsInteger;
        vFornecedor.Nome := vQry.FieldByName('for_ds_fornecedor').AsString;
        vFornecedor.Telefone := vQry.FieldByName('for_ds_telefone').AsString;
        vFornecedor.Email := vQry.FieldByName('for_ds_email').AsString;
        Result.Add(vFornecedor);
        vQry.Next;
      end;
    end;
  finally
    vQry.Free;
  end;
end;

class function TDAOFornecedor.Read(pCodFornecedor: Integer): TFornecedor;
var
  vQry:TSQLQuery;
begin
  vQry := TSQLQuery.Create(nil);
  try
    vQry.SQLConnection := DM.Connect;
    vQry.SQL.Text := 'select * from fornecedor where for_cd_fornecedor = :id';
    vQry.ParamByName('id').AsInteger := pCodFornecedor;
    vQry.Open;
    if not vQry.IsEmpty then
    begin
      Result := TFornecedor.Create;
      Result.Codigo               := vQry.FieldByName('for_cd_fornecedor').AsInteger;
      Result.Nome                 := vQry.FieldByName('for_ds_fornecedor').AsString;
      Result.Telefone             := vQry.FieldByName('for_ds_telefone').AsString;
      Result.Email                := vQry.FieldByName('for_ds_email').AsString;
      Result.Endereco.Logradouro  := vQry.FieldByName('for_DS_LOGRADOURO').AsString;
      Result.Endereco.Complemento := vQry.FieldByName('for_DS_COMPLEMENTO').AsString;
      Result.Endereco.Numero      := vQry.FieldByName('for_DS_NUMERO').AsString;
      Result.Endereco.CEP         := vQry.FieldByName('for_DS_CEP').AsString;
      Result.Endereco.Bairro      := vQry.FieldByName('for_DS_BAIRRO').AsString;
      Result.Endereco.Municipio   := vQry.FieldByName('for_DS_MUNICIPIO').AsString;
      Result.Endereco.UF          := vQry.FieldByName('for_DS_UF').AsString;
    end;
  finally
    vQry.Free;
  end;
end;

class function TDAOFornecedor.Update(pFornecedor: TFornecedor): Boolean;
var
  vTransacao:TTransactionDesc;
begin
  Result := True;
  vTransacao.TransactionID := 2;
  vTransacao.IsolationLevel := xilREADCOMMITTED;

  DM.Connect.StartTransaction(vTransacao);

  if Delete(pFornecedor, False) then
    Result := Create(pFornecedor, False);

  if Result then
    DM.Connect.Commit(vTransacao)
  else
    DM.Connect.Rollback(vTransacao);
end;

end.
