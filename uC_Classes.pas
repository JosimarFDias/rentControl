unit uC_Classes;

interface
uses
  Classes, SysUtils;
type
  TTipoPessoa=(tpPessoaFisica, tpPessoaJuridica);
  TPessoaFisica=class
  private
    FNomePai: string;
    FRG: string;
    FCPF: string;
    FNomeMae: String;
    procedure SetCPF(const Value: string);
    procedure SetNomeMae(const Value: String);
    procedure SetNomePai(const Value: string);
    procedure SetRG(const Value: string);
  published
    property CPF:string read FCPF write SetCPF;
    property RG:string read FRG write SetRG;
    property NomeMae:String read FNomeMae write SetNomeMae;
    property NomePai:string read FNomePai write SetNomePai;
  end;
  TPessoaJuridica=class
  private
    FCNPJ: string;
    FIM: string;
    FIE: string;
    FRazaoSocial: string;
    procedure SetCNPJ(const Value: string);
    procedure SetIE(const Value: string);
    procedure SetIM(const Value: string);
    procedure SetRazaoSocial(const Value: string);
  published
    property RazaoSocial:string read FRazaoSocial write SetRazaoSocial;
    property CNPJ:string read FCNPJ write SetCNPJ;
    property IE:string read FIE write SetIE;
    property IM:string read FIM write SetIM;
  end;
  TEndereco=class
  private
    FLogradouro: string;
    FBairro: string;
    FUF: string;
    FCEP: string;
    FNumero: string;
    FMunicipio: string;
    FComplemento: string;
    procedure SetBairro(const Value: string);
    procedure SetCEP(const Value: string);
    procedure SetComplemento(const Value: string);
    procedure SetLogradouro(const Value: string);
    procedure SetMunicipio(const Value: string);
    procedure SetNumero(const Value: string);
    procedure SetUF(const Value: string);
  published
    property Logradouro:string read FLogradouro write SetLogradouro;
    property Complemento:string read FComplemento write SetComplemento;
    property Numero:string read FNumero write SetNumero;
    property CEP:string read FCEP write SetCEP;
    property Bairro:string read FBairro write SetBairro;
    property Municipio:string read FMunicipio write SetMunicipio;
    property UF:string read FUF write SetUF;
  end;
implementation

{ TEndereco }

procedure TEndereco.SetBairro(const Value: string);
begin
  FBairro := Value;
end;

procedure TEndereco.SetCEP(const Value: string);
begin
  FCEP := Value;
end;

procedure TEndereco.SetComplemento(const Value: string);
begin
  FComplemento := Value;
end;

procedure TEndereco.SetLogradouro(const Value: string);
begin
  FLogradouro := Value;
end;

procedure TEndereco.SetMunicipio(const Value: string);
begin
  FMunicipio := Value;
end;

procedure TEndereco.SetNumero(const Value: string);
begin
  FNumero := Value;
end;

procedure TEndereco.SetUF(const Value: string);
begin
  FUF := Value;
end;

{ TPessoaFisica }

procedure TPessoaFisica.SetCPF(const Value: string);
begin
  FCPF := Value;
end;

procedure TPessoaFisica.SetNomeMae(const Value: String);
begin
  FNomeMae := Value;
end;

procedure TPessoaFisica.SetNomePai(const Value: string);
begin
  FNomePai := Value;
end;

procedure TPessoaFisica.SetRG(const Value: string);
begin
  FRG := Value;
end;

{ TPessoaJuridica }

procedure TPessoaJuridica.SetCNPJ(const Value: string);
begin
  FCNPJ := Value;
end;

procedure TPessoaJuridica.SetIE(const Value: string);
begin
  FIE := Value;
end;

procedure TPessoaJuridica.SetIM(const Value: string);
begin
  FIM := Value;
end;

procedure TPessoaJuridica.SetRazaoSocial(const Value: string);
begin
  FRazaoSocial := Value;
end;
end.
