unit uC_Fornecedor;

interface
uses
  Classes, SysUtils, uC_Classes;
type
  TOperacaoFornecedor=(ofSemOperacao, ofInserir, ofAlterar, ofExcluir);
  TFornecedor=class
  private
    FTipoPessoa: TTipoPessoa;
    FEmail: string;
    FCodigo: Integer;
    FNome: string;
    FPessoaJuridica: TPessoaJuridica;
    FEndereco: TEndereco;
    FPessoaFisica: TPessoaFisica;
    FTelefone: string;
    procedure SetCodigo(const Value: Integer);
    procedure SetEmail(const Value: string);
    procedure SetEndereco(const Value: TEndereco);
    procedure SetNome(const Value: string);
    procedure SetTelefone(const Value: string);
  public
    constructor Create;
    procedure GetValues(pCodigo:Integer);
  published
    property Codigo:Integer read FCodigo write SetCodigo;
    property Nome:string read FNome write SetNome;
    property Telefone:string read FTelefone write SetTelefone;
    property Email:string read FEmail write SetEmail;
    property Endereco:TEndereco read FEndereco write SetEndereco;
  end;
implementation

{ TFornecedor }

uses uCDAO_Fornecedor;

constructor TFornecedor.Create;
begin
  Self.Endereco := TEndereco.Create;
end;

procedure TFornecedor.GetValues(pCodigo: Integer);
var
  vFornecedor:TFornecedor;
begin
  vFornecedor := TDAOFornecedor.Read(pCodigo);
  try
    Self.FCodigo               := vFornecedor.Codigo;
    Self.FNome                 := vFornecedor.Nome;
    Self.FTelefone             := vFornecedor.Telefone;
    Self.FEmail                := vFornecedor.Email;
    Self.FEndereco.Logradouro  := vFornecedor.Endereco.Logradouro;
    Self.FEndereco.Complemento := vFornecedor.Endereco.Complemento;
    Self.FEndereco.Numero      := vFornecedor.Endereco.Numero;
    Self.FEndereco.CEP         := vFornecedor.Endereco.CEP;
    Self.FEndereco.Bairro      := vFornecedor.Endereco.Bairro;
    Self.FEndereco.Municipio   := vFornecedor.Endereco.Municipio;
    Self.FEndereco.UF          := vFornecedor.Endereco.UF;
  finally
    vFornecedor.Free;
  end;
end;

procedure TFornecedor.SetCodigo(const Value: Integer);
begin
  FCodigo := Value;
end;

procedure TFornecedor.SetEmail(const Value: string);
begin
  FEmail := Value;
end;

procedure TFornecedor.SetEndereco(const Value: TEndereco);
begin
  FEndereco := Value;
end;

procedure TFornecedor.SetNome(const Value: string);
begin
  FNome := Value;
end;

procedure TFornecedor.SetTelefone(const Value: string);
begin
  FTelefone := Value;
end;

end.
