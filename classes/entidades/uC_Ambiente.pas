unit uC_Ambiente;

interface
uses
  Classes, SysUtils;
type
  TOperacaoAmbiente=(oaSemOperacao, oaInserir, oaAlterar, oaExcluir);
  TAmbiente=class
  private
    FCodigo: Integer;
    FDescricao: string;
    FValorPadrao: Currency;
    FDescontoPacote: Real;
    FValorNoite: Currency;
    procedure SetCodigo(const Value: Integer);
    procedure SetDescricao(const Value: string);
    procedure SetValorPadrao(const Value: Currency);
    procedure SetDescontoPacote(const Value: Real);
    procedure SetValorNoite(const Value: Currency);
  public
    procedure GetValues(pCodigo:Integer);
    property Codigo:Integer read FCodigo write SetCodigo;
    property Descricao:string read FDescricao write SetDescricao;
    property ValorPadrao:Currency read FValorPadrao write SetValorPadrao;
    property ValorNoite:Currency read FValorNoite write SetValorNoite;
    property DescontoPacote:Real read FDescontoPacote write SetDescontoPacote;
  end;
implementation

{ TAmbiente }

uses uCDAO_Ambiente;

procedure TAmbiente.GetValues(pCodigo: Integer);
var
  vAmbiente:TAmbiente;
begin
  vAmbiente := TDAOAmbiente.Read(pCodigo);
  try
    Self.FCodigo := vAmbiente.Codigo;
    Self.FDescricao := vAmbiente.Descricao;
  finally
    vAmbiente.Free;
  end;
end;

procedure TAmbiente.SetCodigo(const Value: Integer);
begin
  FCodigo := Value;
end;

procedure TAmbiente.SetDescontoPacote(const Value: Real);
begin
  FDescontoPacote := Value;
end;

procedure TAmbiente.SetDescricao(const Value: string);
begin
  FDescricao := Value;
end;

procedure TAmbiente.SetValorNoite(const Value: Currency);
begin
  FValorNoite := Value;
end;

procedure TAmbiente.SetValorPadrao(const Value: Currency);
begin
  FValorPadrao := Value;
end;

end.
