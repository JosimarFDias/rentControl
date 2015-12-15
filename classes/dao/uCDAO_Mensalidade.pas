unit uCDAO_Mensalidade;

interface
uses
  Classes, SysUtils, uC_Mensalidade, SqlExpr, Data.DB, Contnrs;
type
  TDAOMensalidade=class
  private
    class function GetNextID:Integer;
  public
    class function Create(pMensalidade:TMensalidade):Boolean;
    class function Read(pCodigo:Integer):TMensalidade;overload;
    class function Read:TObjectList;overload;
    class function Update(pMensalidade:TMensalidade):Boolean;
    class function Delete(pMensalidade:TMensalidade):Boolean;
  end;
implementation

{ TDAOMensalidade }

uses uDM;

class function TDAOMensalidade.Create(pMensalidade: TMensalidade): Boolean;
var
  vQry:TSQLQuery;
  vTransacao:TTransactionDesc;
begin
  Result := True;
  vQry := TSQLQuery.Create(nil);
  try
    vQry.SQLConnection := DM.Connect;
    vQry.SQL.Text := 'insert into mensalidade (men_cd_mensalidade, men_cd_cliente, men_cd_mes, ' +
                      'men_cd_ano, men_cd_titulo) values (:id, :cliente, :mes, :ano, :titulo)';
    if pMensalidade.Codigo = 0 then
      pMensalidade.Codigo := GetNextID;
    vQry.ParamByName('id').AsInteger := pMensalidade.Codigo;
    vQry.ParamByName('cliente').AsInteger := pMensalidade.Cliente.Codigo;
    vQry.ParamByName('mes').AsInteger := pMensalidade.Mes;
    vQry.ParamByName('ano').AsDate := pMensalidade.Ano;
    vQry.ParamByName('titulo').AsInteger := pMensalidade.Titulo.Codigo;

    vTransacao.TransactionID := 1;
    vTransacao.IsolationLevel := xilREADCOMMITTED;
    DM.Connect.StartTransaction(vTransacao);
    try
      vQry.ExecSQL();
    except
      Result := False;
    end;
    if Result then
      DM.Connect.Commit(vTransacao)
    else
      DM.Connect.Rollback(vTransacao);
  finally
    vQry.Free;
  end;
end;

class function TDAOMensalidade.Delete(pMensalidade: TMensalidade): Boolean;
var
  vQry:TSQLQuery;
  vTransacao:TTransactionDesc;
begin
  Result := True;
  vQry := TSQLQuery.Create(nil);
  try
    vQry.SQLConnection := DM.Connect;
    vQry.SQL.Text := 'delete from mensalidade where men_cd_mensalidade = :codigo';
    vQry.ParamByName('codigo').AsInteger := pMensalidade.Codigo;
    vTransacao.TransactionID := 3;
    vTransacao.IsolationLevel := xilREADCOMMITTED;
    DM.Connect.StartTransaction(vTransacao);
    try
      vQry.ExecSQL();
    except
      Result := False;
    end;
    if Result then
      DM.Connect.Commit(vTransacao)
    else
      DM.Connect.Rollback(vTransacao);
  finally
    vQry.Free;
  end;
end;

class function TDAOMensalidade.GetNextID: Integer;
var
  vProc:TSQLStoredProc;
begin
  vProc := TSQLStoredProc.Create(nil);
  try
    vProc.SQLConnection := DM.Connect;
    vProc.StoredProcName := 'SP_GEN_MENSALIDADE_ID';
    try
      vProc.ExecProc;
    except
    end;
    Result := vProc.Params[0].Value;
  finally
    vProc.Free;
  end;
end;

class function TDAOMensalidade.Read: TObjectList;
var
  vQry:TSQLQuery;
  vMensalidade:TMensalidade;
begin
  Result := nil;
  vQry := TSQLQuery.Create(nil);
  try
    vQry.SQLConnection := DM.Connect;
    vQry.SQL.Text := 'select * from mensalidade';
    vQry.Open;
    if not vQry.IsEmpty then
    begin
      vQry.First;
      Result := TObjectList.Create;
      while not vQry.Eof do
      begin
        vMensalidade := TMensalidade.Create;
        vMensalidade.Codigo := vQry.FieldByName('men_cd_mensalidade').AsInteger;
        vMensalidade.Cliente.GetValues(vQry.FieldByName('men_cd_cliente').AsInteger);
        vMensalidade.Mes := vQry.FieldByName('men_cd_mes').AsInteger;
        vMensalidade.Ano := vQry.FieldByName('men_cd_ano').AsInteger;
        vMensalidade.Titulo.GetValues(vQry.FieldByName('men_cd_titulo').AsInteger);
        Result.Add(vMensalidade);
        vQry.Next;
      end;
    end;
  finally
    vQry.Free;
  end;
end;

class function TDAOMensalidade.Read(pCodigo: Integer): TMensalidade;
var
  vQry:TSQLQuery;
begin
  Result := nil;
  vQry := TSQLQuery.Create(nil);
  try
    vQry.SQLConnection := DM.Connect;
    vQry.SQL.Text := 'select * from mensalidade where men_cd_mensalidade = :codigo';
    vQry.Params[0].AsInteger := pCodigo;
    vQry.Open;
    if not vQry.IsEmpty then
    begin
      Result := TMensalidade.Create;
      Result.Codigo := vQry.FieldByName('men_cd_mensalidader').AsInteger;
      Result.Cliente.GetValues(vQry.FieldByName('men_cd_cliente').AsInteger);
      Result.Mes := vQry.FieldByName('men_cd_mes').AsInteger;
      Result.Ano := vQry.FieldByName('men_cd_ano').AsInteger;
      Result.Titulo.GetValues(vQry.FieldByName('men_cd_titulo').AsInteger);
    end;
  finally
    vQry.Free;
  end;
end;

class function TDAOMensalidade.Update(pMensalidade: TMensalidade): Boolean;
var
  vQry:TSQLQuery;
  vTransacao:TTransactionDesc;
begin
  Result := True;
  vQry := TSQLQuery.Create(nil);
  try
    vQry.SQLConnection := DM.Connect;
    vQry.SQL.Text := 'update mensalidade set men_cd_cliente = :cliente, men_cd_mes = :mes, ' +
                      'men_cd_ano = :ano, men_cd_titulo = :titulo where men_cd_mensalidade = :codigo';
    vQry.ParamByName('codigo').AsInteger := pMensalidade.Codigo;
    vQry.ParamByName('cliente').AsInteger := pMensalidade.Cliente.Codigo;
    vQry.ParamByName('mes').AsInteger := pMensalidade.Mes;
    vQry.ParamByName('ano').AsInteger := pMensalidade.Ano;
    vQry.ParamByName('titulo').AsInteger := pMensalidade.Titulo.Codigo;
    vTransacao.TransactionID := 2;
    vTransacao.IsolationLevel := xilREADCOMMITTED;
    DM.Connect.StartTransaction(vTransacao);
    try
      vQry.ExecSQL();
    except
      Result := False;
    end;
    if Result then
      DM.Connect.Commit(vTransacao)
    else
      DM.Connect.Rollback(vTransacao);
  finally
    vQry.Free;
  end;
end;

end.
