unit uC_Aluno;

interface
uses
  Classes, SysUtils;
type
  TOperacaoAluno=(oaSemOperacao, oaInserir, oaAlterar, oaExcluir);
  TAluno=class
  private
    FLogradouro: string;
    FTipoSanguineo: string;
    FRG: string;
    FFatorRh: string;
    FOrgaoExpeditorRG: string;
    FBairro: string;
    FNascimento: TDate;
    FResponsavelNome: string;
    FUF: string;
    FResponsavelTelefone: string;
    FNaturalidadeUF: string;
    FCodigo: Integer;
    FResponsavelProfissao: string;
    FCPF: string;
    FDataExpedicaoRG: TDate;
    FCertidaoNascimento: string;
    FCEP: string;
    FNumero: string;
    FMunicipio: string;
    FNaturalidadeMunicipio: string;
    FDataCadastro: TDate;
    FSexo: string;
    FNome: string;
    FTelefone: string;
    FCelular: string;
    procedure SetBairro(const Value: string);
    procedure SetCelular(const Value: string);
    procedure SetCEP(const Value: string);
    procedure SetCertidaoNascimento(const Value: string);
    procedure SetCodigo(const Value: Integer);
    procedure SetCPF(const Value: string);
    procedure SetDataCadastro(const Value: TDate);
    procedure SetDataExpedicaoRG(const Value: TDate);
    procedure SetFatorRh(const Value: string);
    procedure SetLogradouro(const Value: string);
    procedure SetMunicipio(const Value: string);
    procedure SetNascimento(const Value: TDate);
    procedure SetNaturalidadeMunicipio(const Value: string);
    procedure SetNaturalidadeUF(const Value: string);
    procedure SetNome(const Value: string);
    procedure SetNumero(const Value: string);
    procedure SetOrgaoExpeditorRG(const Value: string);
    procedure SetResponsavelNome(const Value: string);
    procedure SetResponsavelProfissao(const Value: string);
    procedure SetResponsavelTelefone(const Value: string);
    procedure SetRG(const Value: string);
    procedure SetSexo(const Value: string);
    procedure SetTelefone(const Value: string);
    procedure SetTipoSanguineo(const Value: string);
    procedure SetUF(const Value: string);
  published
    property Codigo:Integer read FCodigo write SetCodigo;
    property Nome:string read FNome write SetNome;
    property Logradouro:string read FLogradouro write SetLogradouro;
    property Numero:string read FNumero write SetNumero;
    property Bairro:string read FBairro write SetBairro;
    property Municipio:string read FMunicipio write SetMunicipio;
    property UF:string read FUF write SetUF;
    property CEP:string read FCEP write SetCEP;
    property Nascimento:TDate read FNascimento write SetNascimento;
    property NaturalidadeMunicipio:string read FNaturalidadeMunicipio write SetNaturalidadeMunicipio;
    property NaturalidadeUF:string read FNaturalidadeUF write SetNaturalidadeUF;
    property DataCadastro:TDate read FDataCadastro write SetDataCadastro;
    property RG:string read FRG write SetRG;
    property OrgaoExpeditorRG:string read FOrgaoExpeditorRG write SetOrgaoExpeditorRG;
    property DataExpedicaoRG:TDate read FDataExpedicaoRG write SetDataExpedicaoRG;
    property CPF:string read FCPF write SetCPF;
    property CertidaoNascimento:string read FCertidaoNascimento write SetCertidaoNascimento;
    property Celular:string read FCelular write SetCelular;
    property Telefone:string read FTelefone write SetTelefone;
    property Sexo:string read FSexo write SetSexo;
    property ResponsavelNome:string read FResponsavelNome write SetResponsavelNome;
    property ResponsavelProfissao:string read FResponsavelProfissao write SetResponsavelProfissao;
    property ResponsavelTelefone:string read FResponsavelTelefone write SetResponsavelTelefone;
    property TipoSanguineo:string read FTipoSanguineo write SetTipoSanguineo;
    property FatorRh:string read FFatorRh write SetFatorRh;
  end;
implementation

{ TAluno }

procedure TAluno.SetBairro(const Value: string);
begin
  FBairro := Value;
end;

procedure TAluno.SetCelular(const Value: string);
begin
  FCelular := Value;
end;

procedure TAluno.SetCEP(const Value: string);
begin
  FCEP := Value;
end;

procedure TAluno.SetCertidaoNascimento(const Value: string);
begin
  FCertidaoNascimento := Value;
end;

procedure TAluno.SetCodigo(const Value: Integer);
begin
  FCodigo := Value;
end;

procedure TAluno.SetCPF(const Value: string);
begin
  FCPF := Value;
end;

procedure TAluno.SetDataCadastro(const Value: TDate);
begin
  FDataCadastro := Value;
end;

procedure TAluno.SetDataExpedicaoRG(const Value: TDate);
begin
  FDataExpedicaoRG := Value;
end;

procedure TAluno.SetFatorRh(const Value: string);
begin
  FFatorRh := Value;
end;

procedure TAluno.SetLogradouro(const Value: string);
begin
  FLogradouro := Value;
end;

procedure TAluno.SetMunicipio(const Value: string);
begin
  FMunicipio := Value;
end;

procedure TAluno.SetNascimento(const Value: TDate);
begin
  FNascimento := Value;
end;

procedure TAluno.SetNaturalidadeMunicipio(const Value: string);
begin
  FNaturalidadeMunicipio := Value;
end;

procedure TAluno.SetNaturalidadeUF(const Value: string);
begin
  FNaturalidadeUF := Value;
end;

procedure TAluno.SetNome(const Value: string);
begin
  FNome := Value;
end;

procedure TAluno.SetNumero(const Value: string);
begin
  FNumero := Value;
end;

procedure TAluno.SetOrgaoExpeditorRG(const Value: string);
begin
  FOrgaoExpeditorRG := Value;
end;

procedure TAluno.SetResponsavelNome(const Value: string);
begin
  FResponsavelNome := Value;
end;

procedure TAluno.SetResponsavelProfissao(const Value: string);
begin
  FResponsavelProfissao := Value;
end;

procedure TAluno.SetResponsavelTelefone(const Value: string);
begin
  FResponsavelTelefone := Value;
end;

procedure TAluno.SetRG(const Value: string);
begin
  FRG := Value;
end;

procedure TAluno.SetSexo(const Value: string);
begin
  FSexo := Value;
end;

procedure TAluno.SetTelefone(const Value: string);
begin
  FTelefone := Value;
end;

procedure TAluno.SetTipoSanguineo(const Value: string);
begin
  FTipoSanguineo := Value;
end;

procedure TAluno.SetUF(const Value: string);
begin
  FUF := Value;
end;

end.
