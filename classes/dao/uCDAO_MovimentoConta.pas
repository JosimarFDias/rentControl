unit uCDAO_MovimentoConta;

interface
uses
  Classes, SysUtils, uC_MovimentoConta, SqlExpr, StrUtils;
type
  TDAO_MovimentoConta=class
  private
    class function GetNextID:Integer;
  public
    class function Create(pMovimento:TMovimentoConta; pControlaTransacao:Boolean = True):Boolean;
    class function Read(pCodigo:Integer):TMovimentoConta;overload;
    class function Read(pDataInicial, pDataFinal:TDate; pCodigoConta:Integer):TList;overload;
    class function Update(pMovimento:TMovimentoConta):Boolean;
    class function Delete(pMovimento:TMovimentoConta; pControlaTransacao:Boolean = True):Boolean;
  end;
implementation

{ TDAO_Conta }

uses uDM, uC_Conta, uCDAO_Conta;

class function TDAO_MovimentoConta.Create(pMovimento: TMovimentoConta;
  pControlaTransacao: Boolean): Boolean;
var
  vQry:TSQLQuery;
  vTransacao:TTransactionDesc;
  vConta:TConta;
  vSaldoFinal:Currency;
begin
  Result := False;
  vConta := TConta.Create;
  try
    vConta := TDAO_Conta.Read(pMovimento.CodConta);
    if pMovimento.Tipo = 'D'  then
      vSaldoFinal := vConta.SaldoAtual - pMovimento.ValorMovimento
    else
      vSaldoFinal := vConta.SaldoAtual + pMovimento.ValorMovimento;
    vConta.SaldoAnterior := vConta.SaldoAtual;
    vConta.SaldoAtual := vSaldoFinal;

    vQry := TSQLQuery.Create(nil);
    try
      vQry.SQLConnection := DM.Connect;
      vQry.SQL.Text := 'insert into movimento_conta (cmv_cd_movimento, cmv_dt_data, cmv_cd_conta, cmv_fl_tipo, ' +
                        'cmv_ds_historico, cmv_vl_valor, cmv_vl_saldofinal, cmv_fl_origem, cmv_cd_movorigem) ' +
                        'values (:codigo, :data, :conta, :tipo, :historico, :valor, :saldo, :origem, :movorigem) ';
      if pControlaTransacao then
      begin
        vTransacao.TransactionID := 301;
        vTransacao.IsolationLevel := xilREADCOMMITTED;
        DM.Connect.StartTransaction(vTransacao);
      end;
      if pMovimento.Codigo = 0 then
        pMovimento.Codigo := GetNextID;
      vQry.Params[0].AsInteger := pMovimento.Codigo;
      vQry.Params[1].AsDate := pMovimento.Data;
      vQry.Params[2].AsInteger := pMovimento.CodConta;
      vQry.Params[3].AsString := pMovimento.Tipo;
      vQry.Params[4].AsString := pMovimento.Historico;
      vQry.Params[5].AsFloat := pMovimento.ValorMovimento;
      vQry.Params[6].AsFloat := vSaldoFinal;
      vQry.Params[7].AsString := pMovimento.MovimentoOrigem;
      vQry.Params[8].AsInteger := pMovimento.CodigoMovimentoOrigem;
      try
        vQry.ExecSQL();
        Result := True;
      except
      end;
      if Result then
        Result := TDAO_Conta.Update(vConta);
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
  finally
    vConta.Free;
  end;
end;

class function TDAO_MovimentoConta.Delete(pMovimento: TMovimentoConta;
  pControlaTransacao: Boolean): Boolean;
var
  vQry:TSQLQuery;
  vTransacao:TTransactionDesc;
begin
  Result := False;
  vQry := TSQLQuery.Create(nil);
  try
    vQry.SQLConnection := DM.Connect;
    vQry.SQL.Text := 'delete from movimento_conta where cmv_cd_movimento = :codigo';
    vQry.Params[0].AsInteger := pMovimento.Codigo;
    if pControlaTransacao then
    begin
      vTransacao.IsolationLevel := xilREADCOMMITTED;
      vTransacao.TransactionID := 304;
      DM.Connect.StartTransaction(vTransacao);
    end;
    try
      vQry.ExecSQL();
      Result := True;
    except
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

class function TDAO_MovimentoConta.GetNextID: Integer;
var
  vProc:TSQLStoredProc;
begin
  Result := 0;
  vProc := TSQLStoredProc.Create(nil);
  try
    vProc.SQLConnection := DM.Connect;
    vProc.StoredProcName := 'SP_GEN_MOVIMENTO_CONTA_ID';
    vProc.ExecProc;
    Result := vProc.Params[0].AsInteger;
  finally
    vProc.Free;
  end;
end;

class function TDAO_MovimentoConta.Read(pDataInicial, pDataFinal: TDate;
  pCodigoConta: Integer): TList;
var
  vQry:TSQLQuery;
  vMovimento:TMovimentoConta;
begin
  Result := nil;
  vQry := TSQLQuery.Create(nil);
  try
    vQry.SQLConnection := DM.Connect;
    vQry.SQL.Text := 'select * from movimento_conta where (cmv_dt_data between :d1 and :d2) and cmv_cd_conta = :conta order by cmv_cd_movimento';
    vQry.Params[0].AsDate := pDataInicial;
    vQry.Params[1].AsDate := pDataFinal;
    vQry.Params[2].AsInteger := pCodigoConta;
    vQry.Open;
    if not vQry.IsEmpty then
    begin
      Result := TFieldList.Create;
      vQry.First;
      while not vQry.Eof do
      begin
        vMovimento := TMovimentoConta.Create;
        vMovimento.Codigo := vQry.FieldByName('cmv_cd_movimento').AsInteger;
        vMovimento.Data := vQry.FieldByName('cmv_dt_data').AsDateTime;
        vMovimento.CodConta := vQry.FieldByName('cmv_cd_conta').AsInteger;
        vMovimento.Tipo := vQry.FieldByName('cmv_fl_tipo').AsString;
        vMovimento.Historico := vQry.FieldByName('cmv_ds_historico').AsString;
        vMovimento.ValorMovimento := vQry.FieldByName('cmv_vl_valor').AsFloat;
        vMovimento.SaldoFinal := vQry.FieldByName('cmv_vl_saldofinal').AsFloat;
        vMovimento.MovimentoOrigem := vQry.FieldByName('cmv_fl_origem').AsString;
        vMovimento.CodigoMovimentoOrigem := vQry.FieldByName('cmv_cd_movorigem').AsInteger;
        Result.Add(vMovimento);
        vQry.Next;
      end;
    end;
  finally
    vQry.Free;
  end;
end;

class function TDAO_MovimentoConta.Read(pCodigo: Integer): TMovimentoConta;
var
  vQry:TSQLQuery;
begin
  Result := nil;
  vQry := TSQLQuery.Create(nil);
  try
    vQry.SQLConnection := DM.Connect;
    vQry.SQL.Text := 'select * from movimento_conta where cmv_cd_movimento = :codigo';
    vQry.Params[0].AsInteger := pCodigo;
    vQry.Open;
    if not vQry.IsEmpty then
    begin
      Result := TMovimentoConta.Create;
      Result.Codigo := vQry.FieldByName('cmv_cd_movimento').AsInteger;
      Result.Data := vQry.FieldByName('cmv_dt_data').AsDateTime;
      Result.CodConta := vQry.FieldByName('cmv_cd_conta').AsInteger;
      Result.Tipo := vQry.FieldByName('cmv_fl_tipo').AsString;
      Result.Historico := vQry.FieldByName('cmv_fl_historico').AsString;
      Result.ValorMovimento := vQry.FieldByName('cmv_vl_valor').AsFloat;
      Result.SaldoFinal := vQry.FieldByName('cmv_vl_saldofinal').AsFloat;
      Result.MovimentoOrigem := vQry.FieldByName('cmv_fl_origem').AsString;
      Result.CodigoMovimentoOrigem := vQry.FieldByName('cmv_cd_movorigem').AsInteger;
    end;
  finally
    vQry.Free;
  end;
end;

class function TDAO_MovimentoConta.Update(pMovimento: TMovimentoConta): Boolean;
var
  vTransacao:TTransactionDesc;
begin
  vTransacao.TransactionID := 302;
  vTransacao.IsolationLevel := xilREADCOMMITTED;
  DM.Connect.StartTransaction(vTransacao);
  Result := Delete(pMovimento, False);
  if Result then
    Result := Create(pMovimento, False);
  if Result then
    DM.Connect.Commit(vTransacao)
  else
    DM.Connect.Rollback(vTransacao);
end;

end.

