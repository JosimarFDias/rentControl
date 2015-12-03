unit uC_Conta;

interface
uses
  Classes, SysUtils;
type
  TOperacaoConta=(ocSemOperacao, ocInserir, ocAlterar, ocExcluir);
  TConta=class
  private
    FSaldoAnterior: Currency;
    FDescricao: string;
    FCodigo: integer;
    FSaldoAtual: Currency;
    FAdministrador: Boolean;
    procedure SetCodigo(const Value: integer);
    procedure SetDescricao(const Value: string);
    procedure SetSaldoAnterior(const Value: Currency);
    procedure SetSaldoAtual(const Value: Currency);
    procedure SetAdministrador(const Value: Boolean);
  published
    property Codigo:integer read FCodigo write SetCodigo;
    property Descricao:string read FDescricao write SetDescricao;
    property SaldoAtual:Currency read FSaldoAtual write SetSaldoAtual;
    property SaldoAnterior:Currency read FSaldoAnterior write SetSaldoAnterior;
    property Administrador:Boolean read FAdministrador write SetAdministrador;
  end;
implementation

{ TConta }

procedure TConta.SetAdministrador(const Value: Boolean);
begin
  FAdministrador := Value;
end;

procedure TConta.SetCodigo(const Value: integer);
begin
  FCodigo := Value;
end;

procedure TConta.SetDescricao(const Value: string);
begin
  FDescricao := Value;
end;

procedure TConta.SetSaldoAnterior(const Value: Currency);
begin
  FSaldoAnterior := Value;
end;

procedure TConta.SetSaldoAtual(const Value: Currency);
begin
  FSaldoAtual := Value;
end;

end.
