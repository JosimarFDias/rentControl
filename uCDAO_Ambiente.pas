unit uCDAO_Ambiente;

interface
uses
  Classes, SysUtils, SQLExpr, uC_Ambiente;
type
  TDAOAmbiente=class
  private
    class function GetNextID:Integer;
  public
    class function Create(pAmbiente:TAmbiente; pControlaTransacao:Boolean=True):Boolean;
    class function Read(pCodAmbiente:Integer):TAmbiente;overload;
    class function Read(pDescricao:string):TList;overload;
    class function Update(pAmbiente:TAmbiente):Boolean;
    class function Delete(pAmbiente:TAmbiente; pControlaTransacao:Boolean=True):Boolean;
  end;
implementation

{ TDAOAmbiente }

uses uDM;

class function TDAOAmbiente.Create(pAmbiente: TAmbiente;
  pControlaTransacao: Boolean): Boolean;
var
  vQry:TSQLQuery;
  vTransacao:TTransactionDesc;
begin
  Result := True;
  vQry := TSQLQuery.Create(nil);
  try
    vQry.SQLConnection := DM.Connect;
    vQry.SQL.Text := 'insert into ambiente (amb_cd_ambiente, amb_ds_ambiente, ' +
                     'amb_vl_valorpadrao, amb_vl_descontopacote, amb_vl_valornoite) '+
                     'values (:id, :nome, :valor, :desconto, :valornoite)';
    if pAmbiente.Codigo = 0 then
      pAmbiente.Codigo := GetNextID;
    vQry.ParamByName('id').AsInteger := pAmbiente.Codigo;
    vQry.ParamByName('nome').AsString := pAmbiente.Descricao;
    vQry.ParamByName('valor').AsFloat := pAmbiente.ValorPadrao;
    vQry.ParamByName('desconto').AsFloat := pAmbiente.DescontoPacote;
    vQry.ParamByName('valornoite').AsFloat := pAmbiente.ValorNoite;
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

class function TDAOAmbiente.Delete(pAmbiente: TAmbiente;
  pControlaTransacao: Boolean): Boolean;
var
  vQry:TSQLQuery;
  vTransacao:TTransactionDesc;
begin
  Result := True;
  vQry := TSQLQuery.Create(nil);
  try
    vQry.SQLConnection := DM.Connect;
    vQry.SQL.Text := 'delete from ambiente where amb_cd_ambiente = :id';
    vQry.ParamByName('id').AsInteger := pAmbiente.Codigo;

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

class function TDAOAmbiente.GetNextID: Integer;
var
  vProc:TSQLStoredProc;
begin
  vProc := TSQLStoredProc.Create(nil);
  try
    vProc.SQLConnection := DM.Connect;
    vProc.StoredProcName := 'SP_GEN_AMBIENTE_ID';
    try
      vProc.ExecProc;
    except
    end;
    Result := vProc.Params[0].Value;
  finally
    vProc.Free;
  end;
end;

class function TDAOAmbiente.Read(pDescricao: string): TList;
var
  vQry:TSQLQuery;
  vAmbiente:TAmbiente;
begin
  Result := nil;
  vQry := TSQLQuery.Create(nil);
  try
    vQry.SQLConnection := DM.Connect;
    vQry.SQL.Text := 'select * from ambiente where amb_ds_ambiente like :descricao';
    vQry.ParamByName('descricao').AsString := '%'+pDescricao;
    vQry.Open;
    if not vQry.IsEmpty then
    begin
      Result := TList.Create;
      vQry.First;
      while not vQry.Eof do
      begin
        vAmbiente := TAmbiente.Create;
        vAmbiente.Codigo := vQry.FieldByName('amb_cd_ambiente').AsInteger;
        vAmbiente.Descricao := vQry.FieldByName('amb_ds_ambiente').AsString;
        vAmbiente.ValorPadrao := vQry.FieldByName('amb_vl_valorpadrao').AsFloat;
        vAmbiente.DescontoPacote := vQry.FieldByName('amb_vl_descontopacote').AsFloat;
        vAmbiente.ValorNoite := vQry.FieldByName('amb_vl_valornoite').AsFloat;
        Result.Add(vAmbiente);
        vQry.Next;
      end;
    end;
  finally
    vQry.Free;
  end;
end;

class function TDAOAmbiente.Read(pCodAmbiente: Integer): TAmbiente;
var
  vQry:TSQLQuery;
begin
  vQry := TSQLQuery.Create(nil);
  try
    vQry.SQLConnection := DM.Connect;
    vQry.SQL.Text := 'select * from ambiente where amb_cd_ambiente = :id';
    vQry.ParamByName('id').AsInteger := pCodAmbiente;
    vQry.Open;
    if not vQry.IsEmpty then
    begin
      Result := TAmbiente.Create;
      Result.Codigo := vQry.FieldByName('amb_cd_ambiente').AsInteger;
      Result.Descricao := vQry.FieldByName('amb_ds_ambiente').AsString;
      Result.ValorPadrao := vQry.FieldByName('amb_vl_valorpadrao').AsFloat;
      Result.DescontoPacote := vQry.FieldByName('amb_vl_descontopacote').AsFloat;
      Result.ValorNoite := vQry.FieldByName('amb_vl_valornoite').AsFloat;
    end;
  finally
    vQry.Free;
  end;
end;

class function TDAOAmbiente.Update(pAmbiente: TAmbiente): Boolean;
var
  vTransacao:TTransactionDesc;
begin
  Result := True;
  vTransacao.TransactionID := 2;
  vTransacao.IsolationLevel := xilREADCOMMITTED;

  DM.Connect.StartTransaction(vTransacao);

  if Delete(pAmbiente, False) then
    Result := Create(pAmbiente, False);

  if Result then
    DM.Connect.Commit(vTransacao)
  else
    DM.Connect.Rollback(vTransacao);
end;

end.

