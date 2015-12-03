unit uCDAO_Aluno;

interface
uses
  Classes, SysUtils, SqlExpr, uC_Aluno;
type
  TDAO_Aluno=class
  private
    class function GetNextID:Integer;
  public
    class function Create(pAluno:TAluno; pControlaTransacao:Boolean=True):Boolean;
    class function Read(pCodigo:Integer):TAluno;overload;
    class function Read(pNome:string):TList;overload;
    class function Update(pAluno:TAluno):Boolean;
    class function Delete(pAluno:TAluno; pControlaTransacao:Boolean=True):Boolean;

    class procedure CriaEstruturas;
  end;
implementation

{ TDAO_Aluno }

uses uDM;

class function TDAO_Aluno.Create(pAluno: TAluno; pControlaTransacao:Boolean): Boolean;
var
  vQry:TSQLQuery;
  vTransacao:TTransactionDesc;
begin
  Result := False;
  vQry := TSQLQuery.Create(nil);
  try
    vQry.SQLConnection := DM.Connect;
    vQry.SQL.Text := 'insert into aluno (alu_cd_aluno, alu_ds_nome, alu_ds_logradouro, alu_ds_numero, alu_ds_bairro, alu_ds_municipio, ' +
'alu_ds_uf, alu_ds_cep, alu_dt_nascimento, alu_ds_naturalidademunicipio, alu_ds_naturalidadeuf, alu_dt_cadastro, ' +
'alu_ds_rg, alu_ds_orgaoexpedidorrg, alu_dt_expedicaorg, alu_ds_cpf, alu_ds_certidaonascimento, alu_ds_celular, ' +
'alu_ds_telefone, alu_fl_sexo, alu_ds_nomeresponsavel, alu_ds_profissaoresponsavel, alu_ds_telefoneresponsavel, ' +
'alu_ds_tiposanguineo, alu_ds_fatorrh) values (:codigo, :nome, :logradouro, :numero, :bairro, :municipio, :uf, ' +
':cep, :nascimento, :municipionatural, :ufnatural, :datacadastro, :rg, :orgaoexpedidor, :datarg, :cpf, :certidao, ' +
':celular, :telefone, :sexo, :nomeresposnsavel, :profissaoresponsavel, :telefoneresponsavel, :tiposanguineo, :fatorrh) ';
    if pControlaTransacao then
    begin
      vTransacao.TransactionID := 201;
      vTransacao.IsolationLevel := xilREADCOMMITTED;
      DM.Connect.StartTransaction(vTransacao);
    end;
    if pAluno.Codigo = 0 then
      pAluno.Codigo := GetNextID;
    vQry.Params[0].AsInteger := pAluno.Codigo;
    vQry.Params[1].AsString  := pAluno.Nome;
    vQry.Params[2].AsString  := pAluno.Logradouro;
    vQry.Params[3].AsString  := pAluno.Numero;
    vQry.Params[4].AsString  := pAluno.Bairro;
    vQry.Params[5].AsString  := pAluno.Municipio;
    vQry.Params[6].AsString  := pAluno.UF;
    vQry.Params[7].AsString  := pAluno.CEP;
    vQry.Params[8].AsDate    := pAluno.Nascimento;
    vQry.Params[9].AsString  := pAluno.NaturalidadeMunicipio;
    vQry.Params[10].AsString := pAluno.NaturalidadeUF;
    vQry.Params[11].AsDate   := pAluno.DataCadastro;
    vQry.Params[12].AsString := pAluno.RG;
    vQry.Params[13].AsString := pAluno.OrgaoExpeditorRG;
    vQry.Params[14].AsDate := pAluno.DataExpedicaoRG;
    vQry.Params[15].AsString := pAluno.CPF;
    vQry.Params[16].AsString := pAluno.CertidaoNascimento;
    vQry.Params[17].AsString := pAluno.Celular;
    vQry.Params[18].AsString := pAluno.Telefone;
    vQry.Params[19].AsString := pAluno.Sexo;
    vQry.Params[20].AsString := pAluno.ResponsavelNome;
    vQry.Params[21].AsString := pAluno.ResponsavelProfissao;
    vQry.Params[22].AsString := pAluno.ResponsavelTelefone;
    vQry.Params[23].AsString := pAluno.TipoSanguineo;
    vQry.Params[24].AsString := pAluno.FatorRh;
   // try
      vQry.ExecSQL();
      Result := True;
   // except
   // end;
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

class procedure TDAO_Aluno.CriaEstruturas;
begin

end;

class function TDAO_Aluno.Delete(pAluno: TAluno; pControlaTransacao:Boolean): Boolean;
var
  vQry:TSQLQuery;
  vTransacao:TTransactionDesc;
begin
  Result := False;
  vQry := TSQLQuery.Create(nil);
  try
    vQry.SQLConnection := DM.Connect;
    vQry.SQL.Text := 'delete from aluno where alu_cd_aluno = :codigo';
    if pControlaTransacao then
    begin
      vTransacao.TransactionID := 203;
      vTransacao.IsolationLevel := xilREADCOMMITTED;
      DM.Connect.StartTransaction(vTransacao);
    end;
    vQry.Params[0].AsInteger := pAluno.Codigo;
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

class function TDAO_Aluno.GetNextID: Integer;
var
  vProc:TSQLStoredProc;
begin
  vProc := TSQLStoredProc.Create(nil);
  try
    vProc.SQLConnection := DM.Connect;
    vProc.StoredProcName := 'SP_GEN_ALUNO_ID';
    try
      vProc.ExecProc;
    except
    end;
    Result := vProc.Params[0].Value;
  finally
    vProc.Free;
  end;
end;

class function TDAO_Aluno.Read(pNome: string): TList;
var
  vQry:TSQLQuery;
  vAluno:TAluno;
begin
  vQry := TSQLQuery.Create(nil);
  try
    vQry.SQLConnection := DM.Connect;
    vQry.SQL.Text := 'select * from aluno where alu_ds_nome lije :nome';
    vQry.Params[0].AsString := '%'+pNome;
    vQry.Open;
    if not vQry.IsEmpty then
    begin
      vQry.First;
      while not vQry.Eof do
      begin
        vAluno := TAluno.Create;

        vAluno.Codigo := vQry.FieldByName('alu_cd_aluno').AsInteger;
        vAluno.Nome := vQry.FieldByName('alu_ds_nome').AsString;
        vAluno.Logradouro := vQry.FieldByName('alu_ds_logradouro').AsString;
        vAluno.Numero := vQry.FieldByName('alu_ds_numero').AsString;
        vAluno.Bairro := vQry.FieldByName('alu_ds_bairro').AsString;
        vAluno.Municipio := vQry.FieldByName('alu_ds_municipio').AsString;
        vAluno.UF := vQry.FieldByName('alu_ds_uf').AsString;
        vAluno.CEP := vQry.FieldByName('alu_ds_cep').AsString;
        vAluno.Nascimento := vQry.FieldByName('alu_dt_nascimento').AsDateTime;
        vAluno.NaturalidadeMunicipio := vQry.FieldByName('alu_ds_naturalidademunicipio').AsString;
        vAluno.NaturalidadeUF := vQry.FieldByName('alu_ds_naturalidadeuf').AsString;
        vAluno.DataCadastro := vQry.FieldByName('alu_dt_cadastro').AsDateTime;
        vAluno.RG := vQry.FieldByName('alu_ds_rg').AsString;
        vAluno.OrgaoExpeditorRG := vQry.FieldByName('alu_ds_orgaoexpedidorg').AsString;
        vAluno.DataExpedicaoRG := vQry.FieldByName('alu_dt_expedicaorg').AsDateTime;
        vAluno.CPF := vQry.FieldByName('alu_ds_cpf').AsString;
        vAluno.CertidaoNascimento := vQry.FieldByName('alu_ds_certidao').AsString;
        vAluno.Celular := vQry.FieldByName('alu_ds_celular').AsString;
        vAluno.Telefone := vQry.FieldByName('alu_ds_telefone').AsString;
        vAluno.Sexo := vQry.FieldByName('alu_fl_sexo').AsString;
        vAluno.ResponsavelNome := vQry.FieldByName('alu_ds_nomeresponsavel').AsString;
        vAluno.ResponsavelProfissao := vQry.FieldByName('alu_ds_profissaoresponsavel').AsString;
        vAluno.ResponsavelTelefone := vQry.FieldByName('alu_ds_telefoneresponsavel').AsString;
        vAluno.TipoSanguineo := vQry.FieldByName('alu_ds_tiposanguineo').AsString;
        vAluno.FatorRh := vQry.FieldByName('alu_ds_fatorrh').AsString;

        Result.Add(vAluno);
      vQry.Next;
      end;
    end;
  finally
    vQry.Free;
  end;
end;

class function TDAO_Aluno.Read(pCodigo: Integer): TAluno;
var
  vQry:TSQLQuery;
begin
  vQry := TSQLQuery.Create(nil);
  try
    vQry.SQLConnection := DM.Connect;
    vQry.SQL.Text := 'select * from aluno where alu_cd_aluno = :codigo';
    vQry.Params[0].AsInteger := pCodigo;
    vQry.Open;
    if not vQry.IsEmpty then
    begin
      Result := TAluno.Create;
      Result.Codigo := vQry.FieldByName('alu_cd_aluno').AsInteger;
      Result.Nome := vQry.FieldByName('alu_ds_nome').AsString;
      Result.Logradouro := vQry.FieldByName('alu_ds_logradouro').AsString;
      Result.Numero := vQry.FieldByName('alu_ds_numero').AsString;
      Result.Bairro := vQry.FieldByName('alu_ds_bairro').AsString;
      Result.Municipio := vQry.FieldByName('alu_ds_municipio').AsString;
      Result.UF := vQry.FieldByName('alu_ds_uf').AsString;
      Result.CEP := vQry.FieldByName('alu_ds_cep').AsString;
      Result.Nascimento := vQry.FieldByName('alu_dt_nascimento').AsDateTime;
      Result.NaturalidadeMunicipio := vQry.FieldByName('alu_ds_naturalidademunicipio').AsString;
      Result.NaturalidadeUF := vQry.FieldByName('alu_ds_naturalidadeuf').AsString;
      Result.DataCadastro := vQry.FieldByName('alu_dt_cadastro').AsDateTime;
      Result.RG := vQry.FieldByName('alu_ds_rg').AsString;
      Result.OrgaoExpeditorRG := vQry.FieldByName('alu_ds_orgaoexpedidorg').AsString;
      Result.DataExpedicaoRG := vQry.FieldByName('alu_dt_expedicaorg').AsDateTime;
      Result.CPF := vQry.FieldByName('alu_ds_cpf').AsString;
      Result.CertidaoNascimento := vQry.FieldByName('alu_ds_certidao').AsString;
      Result.Celular := vQry.FieldByName('alu_ds_celular').AsString;
      Result.Telefone := vQry.FieldByName('alu_ds_telefone').AsString;
      Result.Sexo := vQry.FieldByName('alu_fl_sexo').AsString;
      Result.ResponsavelNome := vQry.FieldByName('alu_ds_nomeresponsavel').AsString;
      Result.ResponsavelProfissao := vQry.FieldByName('alu_ds_profissaoresponsavel').AsString;
      Result.ResponsavelTelefone := vQry.FieldByName('alu_ds_telefoneresponsavel').AsString;
      Result.TipoSanguineo := vQry.FieldByName('alu_ds_tiposanguineo').AsString;
      Result.FatorRh := vQry.FieldByName('alu_ds_fatorrh').AsString;
    end;
  finally
    vQry.Free;
  end;
end;

class function TDAO_Aluno.Update(pAluno: TAluno): Boolean;
var
  vTransacao:TTransactionDesc;
begin
  vTransacao.TransactionID := 202;
  vTransacao.IsolationLevel := xilREADCOMMITTED;
  DM.Connect.StartTransaction(vTransacao);
  Result := Create(pAluno, False);
  if Result then
    Result := Delete(pAluno, False);
  if Result then
    DM.Connect.Commit(vTransacao)
  else
    DM.Connect.Rollback(vTransacao);
end;

end.

