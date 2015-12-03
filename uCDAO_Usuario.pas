unit uCDAO_Usuario;

interface
uses
  Classes, SysUtils, uC_Usuario, SqlExpr, StrUtils;
type
  TDAO_Usuario=class
  private
    class function GetNextID:Integer;
  public
    class function Create(pUsuario:TUsuario; pControlaTransacao:Boolean = True):Boolean;
    class function Read(pCodigo:Integer):TUsuario;overload;
    class function Read(pLogin, pSenha:string):TUsuario;overload;
    class function Read(pNome:string):TList;overload;
    class function Update(pUsuario:TUsuario):Boolean;
    class function Delete(pUsuario:TUsuario; pControlaTransacao:Boolean = True):Boolean;
  end;
implementation

{ TDAO_Usuario }

uses uDM;

class function TDAO_Usuario.Create(pUsuario: TUsuario;
  pControlaTransacao: Boolean): Boolean;
var
  vQry:TSQLQuery;
  vTransacao:TTransactionDesc;
begin
  Result := False;
  vQry := TSQLQuery.Create(nil);
  try
    vQry.SQLConnection := DM.Connect;
    vQry.SQL.Text := 'insert into usuario (usu_cd_usuario, usu_ds_nome, usu_ds_senha, usu_ds_login, usu_fl_ativo, usu_cd_nivel) '+
                     'values (:codigo, :nome, :senha, :login, :ativo, :nivel)';
    if pControlaTransacao then
    begin
      vTransacao.TransactionID := 301;
      vTransacao.IsolationLevel := xilREADCOMMITTED;
      DM.Connect.StartTransaction(vTransacao);
    end;
    if pUsuario.Codigo = 0 then
      pUsuario.Codigo := GetNextID;
    vQry.Params[0].AsInteger := pUsuario.Codigo;
    vQry.Params[1].AsString := pUsuario.Nome;
    vQry.Params[2].AsString := pUsuario.Senha;
    vQry.Params[3].AsString := pUsuario.Login;
    vQry.Params[4].AsString := IfThen(pUsuario.Ativo, 'S', 'N');
    vQry.Params[5].AsInteger := pUsuario.Nivel;
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

class function TDAO_Usuario.Delete(pUsuario: TUsuario;
  pControlaTransacao: Boolean): Boolean;
var
  vQry:TSQLQuery;
  vTransacao:TTransactionDesc;
begin
  Result := False;
  vQry := TSQLQuery.Create(nil);
  try
    vQry.SQLConnection := DM.Connect;
    vQry.SQL.Text := 'delete from usuario where usu_cd_usuario = :codigo';
    vQry.Params[0].AsInteger := pUsuario.Codigo;
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

class function TDAO_Usuario.GetNextID: Integer;
var
  vProc:TSQLStoredProc;
begin
  Result := 0;
  vProc := TSQLStoredProc.Create(nil);
  try
    vProc.SQLConnection := DM.Connect;
    vProc.StoredProcName := 'SP_GEN_USUARIO_ID';
    vProc.ExecProc;
    Result := vProc.Params[0].AsInteger;
  finally
    vProc.Free;
  end;
end;

class function TDAO_Usuario.Read(pLogin, pSenha: string): TUsuario;
var
  vQry:TSQLQuery;
begin
  Result := nil;
  vQry := TSQLQuery.Create(nil);
  try
    vQry.SQLConnection := DM.Connect;
    vQry.SQL.Text := 'select * from usuario where usu_ds_login = :login and usu_ds_senha = :senha';
    vQry.Params[0].AsString := pLogin;
    vQry.Params[1].AsString := pSenha;
    vQry.Open;
    if not vQry.IsEmpty then
    begin
      Result := TUsuario.Create;
      Result.Codigo := vQry.FieldByName('usu_cd_usuario').AsInteger;
      Result.Nome := vQry.FieldByName('usu_ds_nome').AsString;
      Result.Senha := vQry.FieldByName('usu_ds_senha').AsString;
      Result.Login := vQry.FieldByName('usu_ds_login').AsString;
      Result.Ativo := (vQry.FieldByName('usu_fl_ativo').AsString = 'S');
      Result.Nivel := vQry.FieldByName('usu_cd_nivel').AsInteger;
    end;
  finally
    vQry.Free;
  end;
end;

class function TDAO_Usuario.Read(pCodigo: Integer): TUsuario;
var
  vQry:TSQLQuery;
begin
  Result := nil;
  vQry := TSQLQuery.Create(nil);
  try
    vQry.SQLConnection := DM.Connect;
    vQry.SQL.Text := 'select * from usuario where usu_cd_usuario = :codigo';
    vQry.Params[0].AsInteger := pCodigo;
    vQry.Open;
    if not vQry.IsEmpty then
    begin
      Result := TUsuario.Create;
      Result.Codigo := vQry.FieldByName('usu_cd_usuario').AsInteger;
      Result.Nome := vQry.FieldByName('usu_ds_nome').AsString;
      Result.Senha := vQry.FieldByName('usu_ds_senha').AsString;
      Result.Login := vQry.FieldByName('usu_ds_login').AsString;
      Result.Ativo := (vQry.FieldByName('usu_fl_ativo').AsString = 'S');
      Result.Nivel := vQry.FieldByName('usu_cd_nivel').AsInteger;
    end;
  finally
    vQry.Free;
  end;
end;

class function TDAO_Usuario.Update(pUsuario: TUsuario): Boolean;
var
  vTransacao:TTransactionDesc;
begin
  vTransacao.TransactionID := 302;
  vTransacao.IsolationLevel := xilREADCOMMITTED;
  DM.Connect.StartTransaction(vTransacao);
  Result := Delete(pUsuario, False);
  if Result then
    Result := Create(pUsuario, False);
  if Result then
    DM.Connect.Commit(vTransacao)
  else
    DM.Connect.Rollback(vTransacao);
end;

class function TDAO_Usuario.Read(pNome: string): TList;
var
  vQry:TSQLQuery;
  vUsuario:TUsuario;
begin
  Result := nil;
  vQry := TSQLQuery.Create(nil);
  try
    vQry.SQLConnection := DM.Connect;
    vQry.SQL.Text := 'select * from usuario where usu_ds_nome like :nome';
    vQry.Params[0].AsString := '%'+pNome;
    vQry.Open;
    if not vQry.IsEmpty then
    begin
      Result := TFieldList.Create;
      vQry.First;
      while not vQry.Eof do
      begin
        vUsuario := TUsuario.Create;
        vUsuario.Codigo := vQry.FieldByName('usu_cd_usuario').AsInteger;
        vUsuario.Nome := vQry.FieldByName('usu_ds_nome').AsString;
        vUsuario.Senha := vQry.FieldByName('usu_ds_senha').AsString;
        vUsuario.Login := vQry.FieldByName('usu_ds_login').AsString;
        vUsuario.Ativo := (vQry.FieldByName('usu_fl_ativo').AsString = 'S');
        vUsuario.Nivel := vQry.FieldByName('usu_cd_nivel').AsInteger;
        Result.Add(vUsuario);
        vQry.Next;
      end;
    end;
  finally
    vQry.Free;
  end;
end;

end.
