unit uCDAO_Pagar;

interface
uses
  Classes, SysUtils, uC_Pagar, SqlExpr, Data.DB;
type
  TDAOPagar=class
  private
    class function GetNextID:Integer;
  public
    class function Create(pPagar:TPagar):Boolean;
    class function Read(pCodigo:Integer):TPagar;overload;
    class function ReadDataTitulo(pStatus:string; pDataInicio, pDataFim:TDate; pCodFornecedor:Integer=0):TList;
    class function ReadDataVencimento(pStatus:string; pDataInicio, pDataFim:TDate; pCodFornecedor:Integer=0):TList;
    class function ReadDataPagamento(pStatus:string; pDataInicio, pDataFim:TDate; pCodFornecedor:Integer=0):TList;
    class function ReadAbertas:TList;
    class function ReadTodas:TList;
    class function Update(pPagar:TPagar):Boolean;
    class function Delete(pPagar:TPagar):Boolean;
  end;
implementation

{ TDAOReceber }

uses uDM;

class function TDAOPagar.Create(pPagar: TPagar): Boolean;
var
  vQry:TSQLQuery;
  vTransacao:TTransactionDesc;
begin
  Result := True;
  vQry := TSQLQuery.Create(nil);
  try
    vQry.SQLConnection := DM.Connect;
    vQry.SQL.Text := 'insert into pagar (pag_cd_pagar, pag_dt_titulo, pag_cd_fornecedor, ' +
                      'pag_dt_vencimento, pag_vl_valor, pag_fl_status, pag_dt_pagamento, pag_vl_pago, ' +
                      'pag_ds_historico) values (:id, :data, :fornecedor, :vencimento, :valor, :status, ' +
                      ':pagamento, :valorpago, :historico)';
    if pPagar.Codigo = 0 then
      pPagar.Codigo := GetNextID;
    vQry.ParamByName('id').AsInteger := pPagar.Codigo;
    vQry.ParamByName('data').AsDate := pPagar.DataTitulo;
    vQry.ParamByName('fornecedor').AsInteger := pPagar.Fornecedor.Codigo;
    vQry.ParamByName('vencimento').AsDate := pPagar.Vencimento;
    vQry.ParamByName('valor').AsFloat := pPagar.Valor;
    vQry.ParamByName('status').AsString := pPagar.Status;
    if pPagar.Status = 'A' then
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
      vQry.ParamByName('pagamento').AsDate := pPagar.DataPagamento;
      vQry.ParamByName('valorpago').AsFloat := pPagar.ValorPago;
    end;
    vQry.ParamByName('historico').AsString := pPagar.Historico;

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

class function TDAOPagar.Delete(pPagar: TPagar): Boolean;
var
  vQry:TSQLQuery;
  vTransacao:TTransactionDesc;
begin
  Result := True;
  vQry := TSQLQuery.Create(nil);
  try
    vQry.SQLConnection := DM.Connect;
    vQry.SQL.Text := 'delete from pagar where pag_cd_pagar = :codigo';
    vQry.ParamByName('codigo').AsInteger := pPagar.Codigo;
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

class function TDAOPagar.GetNextID: Integer;
var
  vProc:TSQLStoredProc;
begin
  vProc := TSQLStoredProc.Create(nil);
  try
    vProc.SQLConnection := DM.Connect;
    vProc.StoredProcName := 'SP_GEN_PAGAR_ID';
    try
      vProc.ExecProc;
    except
    end;
    Result := vProc.Params[0].Value;
  finally
    vProc.Free;
  end;
end;

class function TDAOPagar.Read(pCodigo: Integer): TPagar;
var
  vQry:TSQLQuery;
begin
  Result := nil;
  vQry := TSQLQuery.Create(nil);
  try
    vQry.SQLConnection := DM.Connect;
    vQry.SQL.Text := 'select * from pagar where pag_cd_pagar = :codigo';
    vQry.Params[0].AsInteger := pCodigo;
    vQry.Open;
    if not vQry.IsEmpty then
    begin
      Result := TPagar.Create;
      Result.Codigo := vQry.FieldByName('pag_cd_pagar').AsInteger;
      Result.DataTitulo := vQry.FieldByName('pag_dt_titulo').AsDateTime;
      Result.Fornecedor.GetValues(vQry.FieldByName('pag_cd_fornecedor').AsInteger);
      Result.Vencimento := vQry.FieldByName('pag_dt_vencimento').AsDateTime;
      Result.Valor := vQry.FieldByName('pag_vl_valor').AsFloat;
      Result.Status := vQry.FieldByName('pag_fl_status').AsString;
      Result.DataPagamento := vQry.FieldByName('pag_dt_pagamento').AsDateTime;
      Result.ValorPago := vQry.FieldByName('pag_vl_pago').AsFloat;
      Result.Historico := vQry.FieldByName('pag_ds_historico').AsString;
    end;
  finally
    vQry.Free;
  end;
end;

class function TDAOPagar.ReadAbertas: TList;
var
  vQry:TSQLQuery;
  vPagar:TPagar;
begin
  Result := nil;
  vQry := TSQLQuery.Create(nil);
  try
    vQry.SQLConnection := DM.Connect;
    vQry.SQL.Text := 'select * from pagar where pag_fl_status = ''A''';
    vQry.Open;
    if not vQry.IsEmpty then
    begin
      vQry.First;
      Result := TList.Create;
      while not vQry.Eof do
      begin
        vPagar := TPagar.Create;
        vPagar.Codigo := vQry.FieldByName('pag_cd_pagar').AsInteger;
        vPagar.DataTitulo := vQry.FieldByName('pag_dt_titulo').AsDateTime;
        vPagar.Fornecedor.GetValues(vQry.FieldByName('pag_cd_fornecedor').AsInteger);
        vPagar.Vencimento := vQry.FieldByName('pag_dt_vencimento').AsDateTime;
        vPagar.Valor := vQry.FieldByName('pag_vl_valor').AsFloat;
        vPagar.Status := vQry.FieldByName('pag_fl_status').AsString;
        vPagar.DataPagamento := vQry.FieldByName('pag_dt_pagamento').AsDateTime;
        vPagar.ValorPago := vQry.FieldByName('pag_vl_pago').AsFloat;
        vPagar.Historico := vQry.FieldByName('pag_ds_historico').AsString;
        Result.Add(vPagar);
        vQry.Next;
      end;
    end;
  finally
    vQry.Free;
  end;
end;

class function TDAOPagar.ReadDataPagamento(pStatus: string; pDataInicio,
  pDataFim: TDate; pCodFornecedor:Integer): TList;
var
  vQry:TSQLQuery;
  vPagar:TPagar;
begin
  Result := nil;
  vQry := TSQLQuery.Create(nil);
  try
    vQry.SQLConnection := DM.Connect;
    if pCodFornecedor > 0 then
      vQry.SQL.Text := 'select * from pagar where pag_fl_status = :status and ' +
                       'pag_dt_pagamento between :d1 and :d2 and pag_cd_fornecedor  = '+IntToStr(pCodFornecedor)
    else
      vQry.SQL.Text := 'select * from pagar where pag_fl_status = :status and ' +
                       'pag_dt_pagamento between :d1 and :d2';
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
        vPagar := TPagar.Create;
        vPagar.Codigo := vQry.FieldByName('pag_cd_pagar').AsInteger;
        vPagar.DataTitulo := vQry.FieldByName('pag_dt_titulo').AsDateTime;
        vPagar.Fornecedor.GetValues(vQry.FieldByName('pag_cd_fornecedor').AsInteger);
        vPagar.Vencimento := vQry.FieldByName('pag_dt_vencimento').AsDateTime;
        vPagar.Valor := vQry.FieldByName('pag_vl_valor').AsFloat;
        vPagar.Status := vQry.FieldByName('pag_fl_status').AsString;
        vPagar.DataPagamento := vQry.FieldByName('pag_dt_pagamento').AsDateTime;
        vPagar.ValorPago := vQry.FieldByName('pag_vl_pago').AsFloat;
        vPagar.Historico := vQry.FieldByName('pag_ds_historico').AsString;
        Result.Add(vPagar);
        vQry.Next;
      end;
    end;
  finally
    vQry.Free;
  end;
end;

class function TDAOPagar.ReadDataTitulo(pStatus: string; pDataInicio,
  pDataFim: TDate; pCodFornecedor:Integer): TList;
var
  vQry:TSQLQuery;
  vPagar:TPagar;
begin
  Result := nil;
  vQry := TSQLQuery.Create(nil);
  try
    vQry.SQLConnection := DM.Connect;
    if pCodFornecedor > 0 then
      vQry.SQL.Text := 'select * from pagar where pag_fl_status = :status and ' +
                       'pag_dt_titulo between :d1 and :d2 and pag_cd_fornecedor  = '+IntToStr(pCodFornecedor)
    else
      vQry.SQL.Text := 'select * from pagar where pag_fl_status = :status and ' +
                       'pag_dt_titulo between :d1 and :d2';
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
        vPagar := TPagar.Create;
        vPagar.Codigo := vQry.FieldByName('pag_cd_pagar').AsInteger;
        vPagar.DataTitulo := vQry.FieldByName('pag_dt_titulo').AsDateTime;
        vPagar.Fornecedor.GetValues(vQry.FieldByName('pag_cd_fornecedor').AsInteger);
        vPagar.Vencimento := vQry.FieldByName('pag_dt_vencimento').AsDateTime;
        vPagar.Valor := vQry.FieldByName('pag_vl_valor').AsFloat;
        vPagar.Status := vQry.FieldByName('pag_fl_status').AsString;
        vPagar.DataPagamento := vQry.FieldByName('pag_dt_pagamento').AsDateTime;
        vPagar.ValorPago := vQry.FieldByName('pag_vl_pago').AsFloat;
        vPagar.Historico := vQry.FieldByName('pag_ds_historico').AsString;
        Result.Add(vPagar);
        vQry.Next;
      end;
    end;
  finally
    vQry.Free;
  end;
end;

class function TDAOPagar.ReadDataVencimento(pStatus: string; pDataInicio,
  pDataFim: TDate; pCodFornecedor:Integer): TList;
var
  vQry:TSQLQuery;
  vPagar:TPagar;
begin
  Result := nil;
  vQry := TSQLQuery.Create(nil);
  try
    vQry.SQLConnection := DM.Connect;
    if pCodFornecedor > 0 then
      vQry.SQL.Text := 'select * from pagar where pag_fl_status = :status and ' +
                       'pag_dt_vencimento between :d1 and :d2 and pag_cd_fornecedor  = '+IntToStr(pCodFornecedor)
    else
      vQry.SQL.Text := 'select * from pagar where pag_fl_status = :status and ' +
                       'pag_dt_vencimento between :d1 and :d2';
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
        vPagar := TPagar.Create;
        vPagar.Codigo := vQry.FieldByName('pag_cd_pagar').AsInteger;
        vPagar.DataTitulo := vQry.FieldByName('pag_dt_titulo').AsDateTime;
        vPagar.Fornecedor.GetValues(vQry.FieldByName('pag_cd_fornecedor').AsInteger);
        vPagar.Vencimento := vQry.FieldByName('pag_dt_vencimento').AsDateTime;
        vPagar.Valor := vQry.FieldByName('pag_vl_valor').AsFloat;
        vPagar.Status := vQry.FieldByName('pag_fl_status').AsString;
        vPagar.DataPagamento := vQry.FieldByName('pag_dt_pagamento').AsDateTime;
        vPagar.ValorPago := vQry.FieldByName('pag_vl_pago').AsFloat;
        vPagar.Historico := vQry.FieldByName('pag_ds_historico').AsString;
        Result.Add(vPagar);
        vQry.Next;
      end;
    end;
  finally
    vQry.Free;
  end;
end;

class function TDAOPagar.ReadTodas: TList;
var
  vQry:TSQLQuery;
  vPagar:TPagar;
begin
  Result := nil;
  vQry := TSQLQuery.Create(nil);
  try
    vQry.SQLConnection := DM.Connect;
    vQry.SQL.Text := 'select * from pagar';
    vQry.Open;
    if not vQry.IsEmpty then
    begin
      vQry.First;
      Result := TList.Create;
      while not vQry.Eof do
      begin
        vPagar := TPagar.Create;
        vPagar.Codigo := vQry.FieldByName('pag_cd_pagar').AsInteger;
        vPagar.DataTitulo := vQry.FieldByName('pag_dt_titulo').AsDateTime;
        vPagar.Fornecedor.GetValues(vQry.FieldByName('pag_cd_fornecedor').AsInteger);
        vPagar.Vencimento := vQry.FieldByName('pag_dt_vencimento').AsDateTime;
        vPagar.Valor := vQry.FieldByName('pag_vl_valor').AsFloat;
        vPagar.Status := vQry.FieldByName('pag_fl_status').AsString;
        vPagar.DataPagamento := vQry.FieldByName('pag_dt_pagamento').AsDateTime;
        vPagar.ValorPago := vQry.FieldByName('pag_vl_pago').AsFloat;
        vPagar.Historico := vQry.FieldByName('pag_ds_historico').AsString;
        Result.Add(vPagar);
        vQry.Next;
      end;
    end;
  finally
    vQry.Free;
  end;
end;

class function TDAOPagar.Update(pPagar: TPagar): Boolean;
var
  vQry:TSQLQuery;
  vTransacao:TTransactionDesc;
begin
  Result := True;
  vQry := TSQLQuery.Create(nil);
  try
    vQry.SQLConnection := DM.Connect;
    vQry.SQL.Text := 'update pagar set pag_dt_titulo = :data, pag_cd_fornecedor = :fornecedor, ' +
                      'pag_dt_vencimento = :vencimento, pag_vl_valor = :valor, pag_fl_status = :status, ' +
                      'pag_dt_pagamento = :pagamento, pag_vl_pago = :valorpago, ' +
                      'pag_ds_historico = :historico where pag_cd_pagar = :codigo';
    vQry.ParamByName('codigo').AsInteger := pPagar.Codigo;
    vQry.ParamByName('data').AsDate := pPagar.DataTitulo;
    vQry.ParamByName('fornecedor').AsInteger := pPagar.Fornecedor.Codigo;
    vQry.ParamByName('vencimento').AsDate := pPagar.Vencimento;
    vQry.ParamByName('valor').AsFloat := pPagar.Valor;
    vQry.ParamByName('status').AsString := pPagar.Status;
    vQry.ParamByName('pagamento').AsDate := pPagar.DataPagamento;
    vQry.ParamByName('valorpago').AsFloat := pPagar.ValorPago;
    vQry.ParamByName('historico').AsString := pPagar.Historico;
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
