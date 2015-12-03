unit uCDAO_Agenda;

interface
uses
  Classes, SysUtils, SQLExpr, uC_Agenda, StrUtils;
type
  TDAOAgenda=class
  private
    class function GetNextID:Integer;
  public
    class function Create(pAgenda:TAgenda; pControlaTransacao:Boolean=True):Boolean;
    class function Read(pCodAgenda:Integer):TAgenda;overload;
    class function Read(pCodAmbiente:string):TList;overload;
    class function Read(pCodAmbiente:string; pData:TDate):TList;overload;
    class function Read(pCodAmbiente:string; pDataInicial, pDataFinal:TDateTime):TList;overload;
    class function Update(pAgenda:TAgenda):Boolean;
    class function Delete(pAgenda:TAgenda; pControlaTransacao:Boolean=True):Boolean;

    class function VerificaHorarioDisponivel(pDataInicio, pDataFim:TDateTime;
      pIDAmbiente:Integer):Boolean;
  end;
implementation

{ TDAOAgenda }

uses uDM;

class function TDAOAgenda.Create(pAgenda: TAgenda;
  pControlaTransacao: Boolean): Boolean;
var
  vQry:TSQLQuery;
  vTransacao:TTransactionDesc;
begin
  Result := True;
  vQry := TSQLQuery.Create(nil);
  try
    vQry.SQLConnection := DM.Connect;
    vQry.SQL.Text := 'insert into agenda (age_cd_agenda, age_cd_ambiente, age_cd_cliente, age_ts_inicio, ' +
                     'age_ts_fim, age_dt_agendamento, age_ds_observacoes, age_fl_status, age_fl_pacote, '+
                     'age_vl_valor) values (:id, :ambiente, :cliente, :inicio, :fim, :agendamento, :obs, '+
                     ':status, :pacote, :valor)';
    if pAgenda.Codigo = 0 then
      pAgenda.Codigo := GetNextID;
    vQry.ParamByName('id').AsInteger := pAgenda.Codigo;
    vQry.ParamByName('ambiente').AsInteger := pAgenda.Ambiente.Codigo;
    vQry.ParamByName('cliente').AsInteger := pAgenda.Cliente.Codigo;
    vQry.ParamByName('inicio').AsDateTime := pAgenda.DataHoraInicio;
    vQry.ParamByName('fim').AsDateTime := pAgenda.DataHoraFim;
    vQry.ParamByName('agendamento').AsDate := pAgenda.DataAgendamento;
    vQry.ParamByName('obs').AsString := pAgenda.Observacoes;
    vQry.ParamByName('status').AsString := pAgenda.Status;
    vQry.ParamByName('pacote').AsString := IfThen(pAgenda.Pacote, 'S', 'N');
    vQry.ParamByName('valor').AsFloat := pAgenda.Valor;
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

class function TDAOAgenda.Delete(pAgenda: TAgenda;
  pControlaTransacao: Boolean): Boolean;
var
  vQry:TSQLQuery;
  vTransacao:TTransactionDesc;
begin
  Result := True;
  vQry := TSQLQuery.Create(nil);
  try
    vQry.SQLConnection := DM.Connect;
    vQry.SQL.Text := 'delete from agenda where age_cd_agenda = :id';
    vQry.ParamByName('id').AsInteger := pAgenda.Codigo;

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

class function TDAOAgenda.GetNextID: Integer;
var
  vProc:TSQLStoredProc;
begin
  vProc := TSQLStoredProc.Create(nil);
  try
    vProc.SQLConnection := DM.Connect;
    vProc.StoredProcName := 'SP_GEN_AGENDA_ID';
    try
      vProc.ExecProc;
    except
    end;
    Result := vProc.Params[0].Value;
  finally
    vProc.Free;
  end;
end;

class function TDAOAgenda.Read(pCodAmbiente: string; pData: TDate): TList;
var
  vQry:TSQLQuery;
  vAgenda:TAgenda;
begin
  Result := nil;
  vQry := TSQLQuery.Create(nil);
  try
    vQry.SQLConnection := DM.Connect;
    vQry.SQL.Text := 'select * from agenda where age_cd_ambiente = :ambiente and cast(age_ts_inicio as date) = :d1';
    vQry.ParamByName('ambiente').AsInteger := StrToIntDef(pCodAmbiente, 0);
    vQry.ParamByName('d1').AsDate := pData;
    vQry.Open;
    if not vQry.IsEmpty then
    begin
      Result := TList.Create;
      vQry.First;
      while not vQry.Eof do
      begin
        vAgenda := TAgenda.Create;
        vAgenda.Codigo := vQry.FieldByName('age_cd_agenda').AsInteger;
        vAgenda.Ambiente.GetValues(vQry.FieldByName('age_cd_ambiente').AsInteger);
        vAgenda.Cliente.GetValues(vQry.FieldByName('age_cd_cliente').AsInteger);
        vAgenda.DataHoraInicio := vQry.FieldByName('age_ts_inicio').AsDateTime;
        vAgenda.DataHoraFim := vQry.FieldByName('age_ts_fim').AsDateTime;
        vAgenda.DataAgendamento := vQry.FieldByName('age_dt_agendamento').AsDateTime;
        vAgenda.Observacoes := vQry.FieldByName('age_ds_observacoes').AsString;
        vAgenda.Status := vQry.FieldByName('age_fl_status').AsString;
        vAgenda.Valor := vQry.FieldByName('age_vl_valor').AsFloat;
        Result.Add(vAgenda);
        vQry.Next;
      end;
    end;
  finally
    vQry.Free;
  end;
end;

class function TDAOAgenda.Read(pCodAmbiente: string): TList;
var
  vQry:TSQLQuery;
  vAgenda:TAgenda;
begin
  Result := nil;
  vQry := TSQLQuery.Create(nil);
  try
    vQry.SQLConnection := DM.Connect;
    vQry.SQL.Text := 'select * from agenda where age_cd_ambiente = :ambiente';
    vQry.ParamByName('ambiente').AsInteger := StrToIntDef(pCodAmbiente, 0);
    vQry.Open;
    if not vQry.IsEmpty then
    begin
      Result := TList.Create;
      vQry.First;
      while not vQry.Eof do
      begin
        vAgenda := TAgenda.Create;
        vAgenda.Codigo := vQry.FieldByName('age_cd_agenda').AsInteger;
        vAgenda.Ambiente.GetValues(vQry.FieldByName('age_cd_ambiente').AsInteger);
        vAgenda.Cliente.GetValues(vQry.FieldByName('age_cd_cliente').AsInteger);
        vAgenda.DataHoraInicio := vQry.FieldByName('age_ts_inicio').AsDateTime;
        vAgenda.DataHoraFim := vQry.FieldByName('age_ts_fim').AsDateTime;
        vAgenda.DataAgendamento := vQry.FieldByName('age_dt_agendamento').AsDateTime;
        vAgenda.Observacoes := vQry.FieldByName('age_ds_observacoes').AsString;
        vAgenda.Status := vQry.FieldByName('age_fl_status').AsString;
        vAgenda.Pacote := vQry.FieldByName('age_fl_pacote').AsString='S';
        vAgenda.Valor := vQry.FieldByName('age_vl_valor').AsFloat;
        Result.Add(vAgenda);
        vQry.Next;
      end;
    end;
  finally
    vQry.Free;
  end;
end;

class function TDAOAgenda.Read(pCodAgenda: Integer): TAgenda;
var
  vQry:TSQLQuery;
begin
  vQry := TSQLQuery.Create(nil);
  try
    vQry.SQLConnection := DM.Connect;
    vQry.SQL.Text := 'select * from agenda where age_cd_agenda = :id';
    vQry.ParamByName('id').AsInteger := pCodAgenda;
    vQry.Open;
    if not vQry.IsEmpty then
    begin
      Result := TAgenda.Create;
      Result.Codigo := vQry.FieldByName('age_cd_agenda').AsInteger;
      Result.Ambiente.GetValues(vQry.FieldByName('age_cd_ambiente').AsInteger);
      Result.Cliente.GetValues(vQry.FieldByName('age_cd_cliente').AsInteger);
      Result.DataHoraInicio := vQry.FieldByName('age_ts_inicio').AsDateTime;
      Result.DataHoraFim := vQry.FieldByName('age_ts_fim').AsDateTime;
      Result.DataAgendamento := vQry.FieldByName('age_dt_agendamento').AsDateTime;
      Result.Observacoes := vQry.FieldByName('age_ds_observacoes').AsString;
      Result.Status := vQry.FieldByName('age_fl_status').AsString;
      Result.Pacote := vQry.FieldByName('age_fl_pacote').AsString='S';
      Result.Valor := vQry.FieldByName('age_vl_valor').AsFloat;
    end;
  finally
    vQry.Free;
  end;
end;

class function TDAOAgenda.Update(pAgenda: TAgenda): Boolean;
var
  vTransacao:TTransactionDesc;
begin
  Result := True;
  vTransacao.TransactionID := 2;
  vTransacao.IsolationLevel := xilREADCOMMITTED;

  DM.Connect.StartTransaction(vTransacao);

  if Delete(pAgenda, False) then
    Result := Create(pAgenda, False);

  if Result then
    DM.Connect.Commit(vTransacao)
  else
    DM.Connect.Rollback(vTransacao);
end;

class function TDAOAgenda.VerificaHorarioDisponivel(pDataInicio,
  pDataFim: TDateTime; pIDAmbiente:Integer): Boolean;
var
  vQry:TSQLQuery;
begin
  Result := False;
  vQry := TSQLQuery.Create(nil);
  try
    vQry.SQLConnection := DM.Connect;
    vQry.SQL.Text := 'select age_cd_agenda from agenda where :horario between age_ts_inicio and '+
                     'age_ts_fim and age_cd_ambiente = :ambiente';
    vQry.Params[0].AsDateTime := pDataInicio;
    vQry.Params[1].AsInteger := pIDAmbiente;
    vQry.Open;
    if vQry.IsEmpty then
    begin
      vQry.Close;
      vQry.Params[0].AsDateTime := pDataFim;
      vQry.Open;
      Result := vQry.IsEmpty;
    end
    else
      Result := True;
  finally
    vQry.Free;
  end;
end;

class function TDAOAgenda.Read(pCodAmbiente: string; pDataInicial,
  pDataFinal: TDateTime): TList;
var
  vQry:TSQLQuery;
  vAgenda:TAgenda;
begin
  Result := nil;
  vQry := TSQLQuery.Create(nil);
  try
    vQry.SQLConnection := DM.Connect;
    vQry.SQL.Text := 'select ' +
                     '    * ' +
                     'from ' +
                     '    agenda ' +
                     'where ' +
                     '    age_cd_ambiente = :ambiente and ' +
                     '    cast(age_ts_inicio as date) >= :d1 and ' +
                     '    cast(age_ts_inicio as date) <= :d2 ' +
                     'order by ' +
                     '    age_ts_inicio ';
    vQry.ParamByName('ambiente').AsInteger := StrToIntDef(pCodAmbiente, 0);
    vQry.ParamByName('d1').AsDate := pDataInicial;
    vQry.ParamByName('d2').AsDate := pDataFinal;
    vQry.Open;
    if not vQry.IsEmpty then
    begin
      Result := TList.Create;
      vQry.First;
      while not vQry.Eof do
      begin
        vAgenda := TAgenda.Create;
        vAgenda.Codigo := vQry.FieldByName('age_cd_agenda').AsInteger;
        vAgenda.Ambiente.GetValues(vQry.FieldByName('age_cd_ambiente').AsInteger);
        vAgenda.Cliente.GetValues(vQry.FieldByName('age_cd_cliente').AsInteger);
        vAgenda.DataHoraInicio := vQry.FieldByName('age_ts_inicio').AsDateTime;
        vAgenda.DataHoraFim := vQry.FieldByName('age_ts_fim').AsDateTime;
        vAgenda.DataAgendamento := vQry.FieldByName('age_dt_agendamento').AsDateTime;
        vAgenda.Observacoes := vQry.FieldByName('age_ds_observacoes').AsString;
        vAgenda.Status := vQry.FieldByName('age_fl_status').AsString;
        vAgenda.Valor := vQry.FieldByName('age_vl_valor').AsFloat;
        Result.Add(vAgenda);
        vQry.Next;
      end;
    end;
  finally
    vQry.Free;
  end;
end;

end.
