unit uCDAO_Conta;

interface
uses
  Classes, SysUtils, uC_Conta, SqlExpr, StrUtils;
type
  TDAO_Conta=class
  private
    class function GetNextID:Integer;
  public
    class function Create(pConta:TConta):Boolean;
    class function Read(pCodigo:Integer):TConta;overload;
    class function Read(pNome:string):TList;overload;
    class function Update(pConta:TConta):Boolean;
    class function Delete(pConta:TConta):Boolean;

    class function ExisteMovimento(pCodigo:Integer):Boolean;
  end;
implementation

{ TDAO_Conta }

uses uDM;

class function TDAO_Conta.Create(pConta: TConta): Boolean;
var
  vQry:TSQLQuery;
  vTransacao:TTransactionDesc;
begin
  Result := False;
  vQry := TSQLQuery.Create(nil);
  try
    vQry.SQLConnection := DM.Connect;
    vQry.SQL.Text := 'insert into conta (con_cd_conta, con_ds_descricao, con_vl_saldo, con_fl_administrador) '+
                     'values (:codigo, :descricao, :saldo, :administrador)';
    vTransacao.TransactionID := 301;
    vTransacao.IsolationLevel := xilREADCOMMITTED;
    DM.Connect.StartTransaction(vTransacao);
    if pConta.Codigo = 0 then
      pConta.Codigo := GetNextID;
    vQry.Params[0].AsInteger := pConta.Codigo;
    vQry.Params[1].AsString := pConta.Descricao;
    vQry.Params[2].AsFloat := pConta.SaldoAtual;
    vQry.Params[3].AsString := IfThen(pConta.Administrador, 'S', 'N');
    try
      vQry.ExecSQL();
      Result := True;
    except
    end;
    if Result then
      DM.Connect.Commit(vTransacao)
    else
      DM.Connect.Rollback(vTransacao);
  finally
    vQry.Free;
  end;
end;

class function TDAO_Conta.Delete(pConta: TConta): Boolean;
var
  vQry:TSQLQuery;
  vTransacao:TTransactionDesc;
begin
  Result := False;
  vQry := TSQLQuery.Create(nil);
  try
    vQry.SQLConnection := DM.Connect;
    vQry.SQL.Text := 'delete from conta where con_cd_conta = :codigo';
    vQry.Params[0].AsInteger := pConta.Codigo;
    vTransacao.IsolationLevel := xilREADCOMMITTED;
    vTransacao.TransactionID := 304;
    DM.Connect.StartTransaction(vTransacao);
    try
      vQry.ExecSQL();
      Result := True;
    except
    end;
    if Result then
      DM.Connect.Commit(vTransacao)
    else
      DM.Connect.Rollback(vTransacao);
  finally
    vQry.Free;
  end;
end;

class function TDAO_Conta.ExisteMovimento(pCodigo: Integer): Boolean;
var
  vQry:TSQLQuery;
begin
  Result := False;
  vQry := TSQLQuery.Create(nil);
  try
    vQry.SQLConnection := DM.Connect;
    vQry.SQL.Text := 'select count(*) from movimento_conta where cmv_cd_conta = :codigo';
    vQry.Params[0].AsInteger := pCodigo;
    vQry.Open;
    Result := vQry.Fields[0].AsInteger > 0;
  finally
    vQry.Free;
  end;
end;

class function TDAO_Conta.GetNextID: Integer;
var
  vProc:TSQLStoredProc;
begin
  Result := 0;
  vProc := TSQLStoredProc.Create(nil);
  try
    vProc.SQLConnection := DM.Connect;
    vProc.StoredProcName := 'SP_GEN_CONTA_ID';
    vProc.ExecProc;
    Result := vProc.Params[0].AsInteger;
  finally
    vProc.Free;
  end;
end;

class function TDAO_Conta.Read(pNome: string): TList;
var
  vQry:TSQLQuery;
  vConta:TConta;
begin
  Result := nil;
  vQry := TSQLQuery.Create(nil);
  try
    vQry.SQLConnection := DM.Connect;
    vQry.SQL.Text := 'select * from conta where con_ds_descricao like :nome';
    vQry.Params[0].AsString := '%'+pNome;
    vQry.Open;
    if not vQry.IsEmpty then
    begin
      Result := TFieldList.Create;
      vQry.First;
      while not vQry.Eof do
      begin
        vConta := TConta.Create;
        vConta.Codigo := vQry.FieldByName('con_cd_conta').AsInteger;
        vConta.Descricao := vQry.FieldByName('con_ds_descricao').AsString;
        vConta.SaldoAtual := vQry.FieldByName('con_vl_saldo').AsFloat;
        vConta.SaldoAnterior := vQry.FieldByName('con_vl_saldoanterior').AsFloat;
        vConta.Administrador := vQry.FieldByName('con_fl_administrador').AsString = 'S';
        Result.Add(vConta);
        vQry.Next;
      end;
    end;
  finally
    vQry.Free;
  end;
end;

class function TDAO_Conta.Read(pCodigo: Integer): TConta;
var
  vQry:TSQLQuery;
begin
  Result := nil;
  vQry := TSQLQuery.Create(nil);
  try
    vQry.SQLConnection := DM.Connect;
    vQry.SQL.Text := 'select * from conta where con_cd_conta = :codigo';
    vQry.Params[0].AsInteger := pCodigo;
    vQry.Open;
    if not vQry.IsEmpty then
    begin
      Result := TConta.Create;
      Result.Codigo := vQry.FieldByName('con_cd_conta').AsInteger;
      Result.Descricao := vQry.FieldByName('con_ds_descricao').AsString;
      Result.SaldoAtual := vQry.FieldByName('con_vl_saldo').AsFloat;
      Result.SaldoAnterior := vQry.FieldByName('con_vl_saldoanterior').AsFloat;
      Result.Administrador := vQry.FieldByName('con_fl_administrador').AsString = 'S';
    end;
  finally
    vQry.Free;
  end;
end;

class function TDAO_Conta.Update(pConta: TConta): Boolean;
var
  vQry:TSQLQuery;
  vTransacao:TTransactionDesc;
begin
  Result := True;
  vQry := TSQLQuery.Create(nil);
  try
    vQry.SQLConnection := DM.Connect;
    vQry.SQL.Text := 'update conta set con_ds_descricao = :descricao, '+
                     'con_vl_saldo = :saldo, con_vl_saldoanterior = :anterior, '+
                     'con_fl_administrador = :administrador '+
                     'where con_cd_conta = :codigo ';
    vQry.Params[0].AsString  := pConta.Descricao;
    vQry.Params[1].AsFloat   := pConta.SaldoAtual;
    vQry.Params[2].AsFloat   := pConta.SaldoAnterior;
    vQry.Params[3].AsString  := IfThen(pConta.Administrador, 'S', 'N');
    vQry.Params[4].AsInteger := pConta.Codigo;
    vTransacao.TransactionID := 302;
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
