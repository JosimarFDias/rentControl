unit uCDAO_Sistema;

interface
uses
  Classes, SysUtils, SqlExpr, uC_Sistema;
type
  TDAOSistema=class
  public
    class function Read:TSistema;
    class function Update(pSistema:TSistema):Boolean;
  end;
implementation

{ TDAOSistema }

uses uDM;

class function TDAOSistema.Read: TSistema;
var
  vQry:TSQLQuery;
begin
  Result := nil;
  vQry := TSQLQuery.Create(nil);
  try
    vQry.SQLConnection := DM.Connect;
    vQry.SQL.Text := 'select * from sistema';
    vQry.Open;
    Result := TSistema.Create;
    Result.InicioExpediente := vQry.FieldByName('sis_tm_inicioexpediente').AsDateTime;
    Result.FimExpediente := vQry.FieldByName('sis_tm_fimexpediente').AsDateTime;
    Result.ValorMensalidadeEscolinha := vQry.FieldByName('sis_vl_mensalidadeescolinha').AsCurrency;
    Result.IdContaPricipal := vQry.FieldByName('sis_cd_contaprincipal').AsInteger;
  finally
    vQry.Free;
  end;
end;

class function TDAOSistema.Update(pSistema: TSistema): Boolean;
var
  vQry:TSQLQuery;
begin
  Result := False;
  vQry := TSQLQuery.Create(nil);
  try
    vQry.SQLConnection := DM.Connect;
    vQry.SQL.Text := 'select * from sistema';
    vQry.Open;
    if vQry.IsEmpty then
    begin
      vQry.Close;
      vQry.SQL.Text := 'insert into sistema (sis_tm_inicioexpediente,  ' +
                       'sis_tm_fimexpediente, sis_vl_mensalidadeescolinha, '+
                       'sis_cd_contaprincipal) values (:inicio, :fim, ' +
                       ':mensalidade, :conta)';
    end
    else
    begin
      vQry.Close;
      vQry.SQL.Text := 'update sistema set sis_tm_inicioexpediente = :inicio,  '+
                       'sis_tm_fimexpediente = :fim, sis_vl_mensalidadeescolinha = '+
                       ':valorescolinha, sis_cd_contaprincipal = :conta';
    end;
    vQry.Params[0].AsTime     := Sistema.InicioExpediente;
    vQry.Params[1].AsTime     := Sistema.FimExpediente;
    vQry.Params[1].AsTime     := Sistema.FimExpediente;
    vQry.Params[2].AsCurrency := Sistema.ValorMensalidadeEscolinha;
    vQry.Params[3].AsInteger  := Sistema.IdContaPricipal;
    try
      vQry.ExecSQL();
      Result := True;
    except
    end;
  finally
    vQry.Free;
  end;
end;

end.
