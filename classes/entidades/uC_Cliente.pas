unit uC_Cliente;

interface
uses
  Classes, SysUtils, uC_Classes;
type
  TOperacaoCliente=(ocSemOperacao, ocInserir, ocAlterar, ocExcluir);
  TCliente=class
  private
    FEmail: string;
    FNome: string;
    FCodigo: Integer;
    FTelefone: string;
    FTipoPessoa: TTipoPessoa;
    FEndereco: TEndereco;
    FCNPJ: string;
    FCPF: string;
    FNascimento: TDate;
    FAluno: Boolean;
    FResponsavel: string;
    FValorMensalidade: Currency;
    procedure SetCodigo(const Value: Integer);
    procedure SetNome(const Value: string);
    procedure SetEmail(const Value: string);
    procedure SetTelefone(const Value: string);
    procedure SetEndereco(const Value: TEndereco);
    procedure SetTipoPessoa(const Value: TTipoPessoa);
    procedure SetCNPJ(const Value: string);
    procedure SetCPF(const Value: string);
    procedure SetNascimento(const Value: TDate);
    procedure SetAluno(const Value: Boolean);
    procedure SetResponsavel(const Value: string);
    procedure SetValorMensalidade(const Value: Currency);
  public
    constructor Create;
    procedure GetValues(pCodigo:Integer);
    property Codigo:Integer read FCodigo write SetCodigo;
    property Nome:string read FNome write SetNome;
    property Telefone:string read FTelefone write SetTelefone;
    property Email:string read FEmail write SetEmail;
    property Endereco:TEndereco read FEndereco write SetEndereco;
    property TipoPessoa:TTipoPessoa read FTipoPessoa write SetTipoPessoa;
    property CPF:string read FCPF write SetCPF;
    property CNPJ:string read FCNPJ write SetCNPJ;
    property Nascimento:TDate read FNascimento write SetNascimento;
    property Aluno:Boolean read FAluno write SetAluno;
    property Responsavel:string read FResponsavel write SetResponsavel;
    property ValorMensalidade:Currency read FValorMensalidade write SetValorMensalidade;
  end;
implementation

{ TCliente }

uses uCDAO_Cliente;

constructor TCliente.Create;
begin
  Self.Endereco := TEndereco.Create;
end;

procedure TCliente.GetValues(pCodigo: Integer);
var
  vCliente:TCliente;
begin
  vCliente := TDAOCliente.Read(pCodigo);
  try
    Self.FCodigo := vCliente.Codigo;
    Self.FNome := vCliente.Nome;
    Self.FTelefone := vCliente.Telefone;
    Self.FEmail := vCliente.Email;
    Self.FTipoPessoa := vCliente.TipoPessoa;
    Self.FEndereco.Logradouro := vCliente.Endereco.Logradouro;
    Self.FEndereco.Complemento := vCliente.Endereco.Complemento;
    Self.FEndereco.Numero := vCliente.Endereco.Numero;
    Self.FEndereco.CEP := vCliente.Endereco.CEP;
    Self.FEndereco.Bairro := vCliente.Endereco.Bairro;
    Self.FEndereco.Municipio := vCliente.Endereco.Municipio;
    Self.FEndereco.UF := vCliente.Endereco.UF;
    Self.FNascimento := vCliente.Nascimento;
    Self.FAluno := vCliente.Aluno;
    Self.FResponsavel := vCliente.Responsavel;
    Self.FValorMensalidade := vCliente.ValorMensalidade;
  finally
    vCliente.Free;
  end;
end;

procedure TCliente.SetAluno(const Value: Boolean);
begin
  FAluno := Value;
end;

procedure TCliente.SetCNPJ(const Value: string);
begin
  FCNPJ := Value;
end;

procedure TCliente.SetCodigo(const Value: Integer);
begin
  FCodigo := Value;
end;

procedure TCliente.SetCPF(const Value: string);
begin
  FCPF := Value;
end;

procedure TCliente.SetNascimento(const Value: TDate);
begin
  FNascimento := Value;
end;

procedure TCliente.SetNome(const Value: string);
begin
  FNome := Value;
end;

procedure TCliente.SetResponsavel(const Value: string);
begin
  FResponsavel := Value;
end;

procedure TCliente.SetEmail(const Value: string);
begin
  FEmail := Value;
end;

procedure TCliente.SetEndereco(const Value: TEndereco);
begin
  FEndereco := Value;
end;

procedure TCliente.SetTelefone(const Value: string);
begin
  FTelefone := Value;
end;

procedure TCliente.SetTipoPessoa(const Value: TTipoPessoa);
begin
  FTipoPessoa := Value;
end;

procedure TCliente.SetValorMensalidade(const Value: Currency);
begin
  FValorMensalidade := Value;
end;

end.
