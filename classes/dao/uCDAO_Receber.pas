unit uCDAO_Receber;

interface
uses
  Classes, SysUtils, uC_Receber, SqlExpr, Data.DB;
type
  TDAOReceber=class
  private
    class function GetNextID:Integer;
  public
    class function Create(pReceber:TReceber):Boolean;
    class function Read(pCodigo:Integer):TReceber;overload;
    class function ReadDataTitulo(pStatus:string; pDataInicio, pDataFim:TDate; pCodCliente:Integer=0):TList;
    class function ReadDataVencimento(pStatus:string; pDataInicio, pDataFim:TDate; pCodCliente:Integer=0):TList;
    class function ReadDataPagamento(pStatus:string; pDataInicio, pDataFim:TDate; pCodCliente:Integer=0):TList;
    class function ReadAbertas:TList;
    class function ReadTodas:TList;
    class function Update(pReceber:TReceber):Boolean;
    class function Delete(pReceber:TReceber):Boolean;
  end;
implementation

{ TDAOReceber }

uses uDM;

class function TDAOReceber.Create(pReceber: TReceber): Boolean;
var
  vQry:TSQLQuery;
  vTransacao:TTransactionDesc;
begin
  Result := True;
  vQry := TSQLQuery.Create(nil);
  try
    vQry.SQLConnection := DM.Connect;
    vQry.SQL.Text := 'insert into receber (rec_cd_receber, rec_dt_titulo, rec_cd_cliente, ' +
                      'rec_dt_vencimento, rec_vl_valor, rec_fl_status, rec_dt_pagamento, rec_vl_pago, ' +
                      'rec_cd_contaorigem, rec_ds_historico) values (:id, :data, :cliente, :vencimento, :valor, :status, ' +
                      ':pagamento, :valorpago, :origem, :historico)';
    if pReceber.Codigo = 0 then
      pReceber.Codigo := GetNextID;
    vQry.ParamByName('id').AsInteger := pReceber.Codigo;
    vQry.ParamByName('data').AsDate := pReceber.DataTitulo;
    vQry.ParamByName('cliente').AsInteger := pReceber.Cliente.Codigo;
    vQry.ParamByName('vencimento').AsDate := pReceber.Vencimento;
    vQry.ParamByName('valor').AsFloat := pReceber.Valor;
    vQry.ParamByName('status').AsString := pReceber.Status;
    if pReceber.Status = 'A' then
    begin
      with vQry.ParamByName('pagamento') do
      begin
        DataType := ftDate;
        Clear;
        Bound := True;
      end;
      vQry.ParamByName('valorpago').AsFloat := 0;;
    end
    else
    begin
      vQry.ParamByName('pagamento').AsDate := pReceber.DataPagamento;
      vQry.ParamByName('valorpago').AsFloat := pReceber.ValorPago;
    end;
    vQry.ParamByName('origem').AsInteger := pReceber.CodigoContaOrigem;
    vQry.ParamByName('historico').AsString := pReceber.Historico;

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

class function TDAOReceber.Delete(pReceber: TReceber): Boolean;
var
  vQry:TSQLQuery;
  vTransacao:TTransactionDesc;
begin
  Result := True;
  vQry := TSQLQuery.Create(nil);
  try
    vQry.SQLConnection := DM.Connect;
    vQry.SQL.Text := 'delete from receber where rec_cd_receber = :codigo';
    vQry.ParamByName('codigo').AsInteger := pReceber.Codigo;
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

class function TDAOReceber.GetNextID: Integer;
var
  vProc:TSQLStoredProc;
begin
  vProc := TSQLStoredProc.Create(nil);
  try
    vProc.SQLConnection := DM.Connect;
    vProc.StoredProcName := 'SP_GEN_RECEBER_ID';
    try
      vProc.ExecProc;
    except
    end;
    Result := vProc.Params[0].Value;
  finally
    vProc.Free;
  end;
end;

class function TDAOReceber.ReadDataPagamento(pStatus: string; pDataInicio,
  pDataFim: TDate; pCodCliente:Integer): TList;
var
  vQry:TSQLQuery;
  vReceber:TReceber;
begin
  Result := nil;
  vQry := TSQLQuery.Create(nil);
  try
    vQry.SQLConnection := DM.Connect;
    if pCodCliente > 0 then
      vQry.SQL.Text := 'select * from receber where rec_fl_status = :status and ' +
                       'rec_dt_pagamento between :d1 and :d2 where rec_cd_cliente = '+IntToStr(pCodCliente)
    else
      vQry.SQL.Text := 'select * from receber where rec_fl_status = :status and ' +
                       'rec_dt_pagamento between :d1 and :d2';
    vQry.Params[0].AsString := pStatus;
    vQry.Params[1].AsDate := pDataInicio;
    vQry.Params[2].AsDate := pDataFim;
    vQry.Open;
    if not vQry.IsEmpty then
    begin
      vQry.First;
      Result := TList.Create;
      while not vQry.Eof do
      begin
        vReceber := TReceber.Create;
        vReceber.Codigo := vQry.FieldByName('rec_cd_receber').AsInteger;
        vReceber.DataTitulo := vQry.FieldByName('rec_dt_titulo').AsDateTime;
        vReceber.Cliente.GetValues(vQry.FieldByName('rec_cd_cliente').AsInteger);
        vReceber.Vencimento := vQry.FieldByName('rec_dt_vencimento').AsDateTime;
        vReceber.Valor := vQry.FieldByName('rec_vl_valor').AsFloat;
        vReceber.Status := vQry.FieldByName('rec_fl_status').AsString;
        vReceber.DataPagamento := vQry.FieldByName('rec_dt_pagamento').AsDateTime;
        vReceber.ValorPago := vQry.FieldByName('rec_vl_pago').AsFloat;
        vReceber.CodigoContaOrigem := vQry.FieldByName('rec_cd_contaorigem').AsInteger;
        vReceber.Historico := vQry.FieldByName('rec_ds_historico').AsString;
        Result.Add(vReceber);
        vQry.Next;
      end;
    end;
  finally
    vQry.Free;
  end;
end;

class function TDAOReceber.ReadDataTitulo(pStatus: string; pDataInicio,
  pDataFim: TDate; pCodCliente:Integer): TList;
var
  vQry:TSQLQuery;
  vReceber:TReceber;
begin
  Result := nil;
  vQry := TSQLQuery.Create(nil);
  try
    vQry.SQLConnection := DM.Connect;
    if pCodCliente > 0 then
      vQry.SQL.Text := 'select * from receber where rec_fl_status = :status and ' +
                       'rec_dt_titulo between :d1 and :d2 and rec_cd_cliente  = '+IntToStr(pCodCliente)
    else
      vQry.SQL.Text := 'select * from receber where rec_fl_status = :status and ' +
                       'rec_dt_titulo between :d1 and :d2';
    vQry.Params[0].AsString := pStatus;
    vQry.Params[1].AsDate := pDataInicio;
    vQry.Params[2].AsDate := pDataFim;
    vQry.Open;
    if not vQry.IsEmpty then
    begin
      vQry.First;
      Result := TList.Create;
      while not vQry.Eof do
      begin
        vReceber := TReceber.Create;
        vReceber.Codigo := vQry.FieldByName('rec_cd_receber').AsInteger;
        vReceber.DataTitulo := vQry.FieldByName('rec_dt_titulo').AsDateTime;
        vReceber.Cliente.GetValues(vQry.FieldByName('rec_cd_cliente').AsInteger);
        vReceber.Vencimento := vQry.FieldByName('rec_dt_vencimento').AsDateTime;
        vReceber.Valor := vQry.FieldByName('rec_vl_valor').AsFloat;
        vReceber.Status := vQry.FieldByName('rec_fl_status').AsString;
        vReceber.DataPagamento := vQry.FieldByName('rec_dt_pagamento').AsDateTime;
        vReceber.ValorPago := vQry.FieldByName('rec_vl_pago').AsFloat;
        vReceber.CodigoContaOrigem := vQry.FieldByName('rec_cd_contaorigem').AsInteger;
        vReceber.Historico := vQry.FieldByName('rec_ds_historico').AsString;
        Result.Add(vReceber);
        vQry.Next;
      end;
    end;
  finally
    vQry.Free;
  end;
end;

class function TDAOReceber.ReadDataVencimento(pStatus: string; pDataInicio,
  pDataFim: TDate; pCodCliente:Integer): TList;
var
  vQry:TSQLQuery;
  vReceber:TReceber;
begin
  Result := nil;
  vQry := TSQLQuery.Create(nil);
  try
    vQry.SQLConnection := DM.Connect;
    if pCodCliente > 0 then
      vQry.SQL.Text := 'select * from receber where rec_fl_status = :status and ' +
                       'rec_dt_vencimento between :d1 and :d2 and rec_cd_cliente  = '+IntToStr(pCodCliente)
    else
      vQry.SQL.Text := 'select * from receber where rec_fl_status = :status and ' +
                       'rec_dt_vencimento between :d1 and :d2';
    vQry.Params[0].AsString := pStatus;
    vQry.Params[1].AsDate := pDataInicio;
    vQry.Params[2].AsDate := pDataFim;
    vQry.Open;
    if not vQry.IsEmpty then
    begin
      vQry.First;
      Result := TList.Create;
      while not vQry.Eof do
      begin
        vReceber := TReceber.Create;
        vReceber.Codigo := vQry.FieldByName('rec_cd_receber').AsInteger;
        vReceber.DataTitulo := vQry.FieldByName('rec_dt_titulo').AsDateTime;
        vReceber.Cliente.GetValues(vQry.FieldByName('rec_cd_cliente').AsInteger);
        vReceber.Vencimento := vQry.FieldByName('rec_dt_vencimento').AsDateTime;
        vReceber.Valor := vQry.FieldByName('rec_vl_valor').AsFloat;
        vReceber.Status := vQry.FieldByName('rec_fl_status').AsString;
        vReceber.DataPagamento := vQry.FieldByName('rec_dt_pagamento').AsDateTime;
        vReceber.ValorPago := vQry.FieldByName('rec_vl_pago').AsFloat;
        vReceber.CodigoContaOrigem := vQry.FieldByName('rec_cd_contaorigem').AsInteger;
        vReceber.Historico := vQry.FieldByName('rec_ds_historico').AsString;
        Result.Add(vReceber);
        vQry.Next;
      end;
    end;
  finally
    vQry.Free;
  end;
end;

class function TDAOReceber.ReadTodas: TList;
var
  vQry:TSQLQuery;
  vReceber:TReceber;
begin
  Result := nil;
  vQry := TSQLQuery.Create(nil);
  try
    vQry.SQLConnection := DM.Connect;
    vQry.SQL.Text := 'select * from receber';
    vQry.Open;
    if not vQry.IsEmpty then
    begin
      vQry.First;
      Result := TList.Create;
      while not vQry.Eof do
      begin
        vReceber := TReceber.Create;
        vReceber.Codigo := vQry.FieldByName('rec_cd_receber').AsInteger;
        vReceber.DataTitulo := vQry.FieldByName('rec_dt_titulo').AsDateTime;
        vReceber.Cliente.GetValues(vQry.FieldByName('rec_cd_cliente').AsInteger);
        vReceber.Vencimento := vQry.FieldByName('rec_dt_vencimento').AsDateTime;
        vReceber.Valor := vQry.FieldByName('rec_vl_valor').AsFloat;
        vReceber.Status := vQry.FieldByName('rec_fl_status').AsString;
        vReceber.DataPagamento := vQry.FieldByName('rec_dt_pagamento').AsDateTime;
        vReceber.ValorPago := vQry.FieldByName('rec_vl_pago').AsFloat;
        vReceber.CodigoContaOrigem := vQry.FieldByName('rec_cd_contaorigem').AsInteger;
        vReceber.Historico := vQry.FieldByName('rec_ds_historico').AsString;
        Result.Add(vReceber);
        vQry.Next;
      end;
    end;
  finally
    vQry.Free;
  end;
end;

class function TDAOReceber.Read(pCodigo: Integer): TReceber;
var
  vQry:TSQLQuery;
begin
  Result := nil;
  vQry := TSQLQuery.Create(nil);
  try
    vQry.SQLConnection := DM.Connect;
    vQry.SQL.Text := 'select * from receber where rec_cd_receber = :codigo';
    vQry.Params[0].AsInteger := pCodigo;
    vQry.Open;
    if not vQry.IsEmpty then
    begin
      Result := TReceber.Create;
      Result.Codigo := vQry.FieldByName('rec_cd_receber').AsInteger;
      Result.DataTitulo := vQry.FieldByName('rec_dt_titulo').AsDateTime;
      Result.Cliente.GetValues(vQry.FieldByName('rec_cd_cliente').AsInteger);
      Result.Vencimento := vQry.FieldByName('rec_dt_vencimento').AsDateTime;
      Result.Valor := vQry.FieldByName('rec_vl_valor').AsFloat;
      Result.Status := vQry.FieldByName('rec_fl_status').AsString;
      Result.DataPagamento := vQry.FieldByName('rec_dt_pagamento').AsDateTime;
      Result.ValorPago := vQry.FieldByName('rec_vl_pago').AsFloat;
      Result.CodigoContaOrigem := vQry.FieldByName('rec_cd_contaorigem').AsInteger;
      Result.Historico := vQry.FieldByName('rec_ds_historico').AsString;
    end;
  finally
    vQry.Free;
  end;
end;

class function TDAOReceber.ReadAbertas: TList;
var
  vQry:TSQLQuery;
  vReceber:TReceber;
begin
  Result := nil;
  vQry := TSQLQuery.Create(nil);
  try
    vQry.SQLConnection := DM.Connect;
    vQry.SQL.Text := 'select * from receber where rec_fl_status = ''A''';
    vQry.Open;
    if not vQry.IsEmpty then
    begin
      vQry.First;
      Result := TList.Create;
      while not vQry.Eof do
      begin
        vReceber := TReceber.Create;
        vReceber.Codigo := vQry.FieldByName('rec_cd_receber').AsInteger;
        vReceber.DataTitulo := vQry.FieldByName('rec_dt_titulo').AsDateTime;
        vReceber.Cliente.GetValues(vQry.FieldByName('rec_cd_cliente').AsInteger);
        vReceber.Vencimento := vQry.FieldByName('rec_dt_vencimento').AsDateTime;
        vReceber.Valor := vQry.FieldByName('rec_vl_valor').AsFloat;
        vReceber.Status := vQry.FieldByName('rec_fl_status').AsString;
        vReceber.DataPagamento := vQry.FieldByName('rec_dt_pagamento').AsDateTime;
        vReceber.ValorPago := vQry.FieldByName('rec_vl_pago').AsFloat;
        vReceber.CodigoContaOrigem := vQry.FieldByName('rec_cd_contaorigem').AsInteger;
        vReceber.Historico := vQry.FieldByName('rec_ds_historico').AsString;
        Result.Add(vReceber);
        vQry.Next;
      end;
    end;
  finally
    vQry.Free;
  end;
end;

class function TDAOReceber.Update(pReceber: TReceber): Boolean;
var
  vQry:TSQLQuery;
  vTransacao:TTransactionDesc;
begin
  Result := True;
  vQry := TSQLQuery.Create(nil);
  try
    vQry.SQLConnection := DM.Connect;
    vQry.SQL.Text := 'update receber set rec_dt_titulo = :data, rec_cd_cliente = :cliente, ' +
                      'rec_dt_vencimento = :vencimento, rec_vl_valor = :valor, rec_fl_status = :status, ' +
                      'rec_dt_pagamento = :pagamento, rec_vl_pago = :valorpago, ' +
                      'rec_cd_contaorigem = :origem, rec_ds_historico = :historico where rec_cd_receber = :codigo';
    vQry.ParamByName('codigo').AsInteger := pReceber.Codigo;
    vQry.ParamByName('data').AsDate := pReceber.DataTitulo;
    vQry.ParamByName('cliente').AsInteger := pReceber.Cliente.Codigo;
    vQry.ParamByName('vencimento').AsDate := pReceber.Vencimento;
    vQry.ParamByName('valor').AsFloat := pReceber.Valor;
    vQry.ParamByName('status').AsString := pReceber.Status;
    vQry.ParamByName('pagamento').AsDate := pReceber.DataPagamento;
    vQry.ParamByName('valorpago').AsFloat := pReceber.ValorPago;
    vQry.ParamByName('origem').AsInteger := pReceber.CodigoContaOrigem;
    vQry.ParamByName('historico').AsString := pReceber.Historico;
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
