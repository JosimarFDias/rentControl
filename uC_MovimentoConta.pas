unit uC_MovimentoConta;

interface
uses
  Classes, SysUtils;
type
  TMovimentoConta=class
  private
    FHistorico: string;
    FValorMovimento: Currency;
    FCodigoMovimentoOrigem: Integer;
    FCodigo: Integer;
    FCodConta: Integer;
    FSaldoFinal: Currency;
    FMovimentoOrigem: string;
    FTipo: string;
    FData: TDate;
    procedure SetCodConta(const Value: Integer);
    procedure SetCodigo(const Value: Integer);
    procedure SetCodigoMovimentoOrigem(const Value: Integer);
    procedure SetHistorico(const Value: string);
    procedure SetMovimentoOrigem(const Value: string);
    procedure SetSaldoFinal(const Value: Currency);
    procedure SetTipo(const Value: string);
    procedure SetValorMovimento(const Value: Currency);
    procedure SetData(const Value: TDate);
  published
    property Codigo:Integer read FCodigo write SetCodigo;
    property Data:TDate read FData write SetData;
    property CodConta:Integer read FCodConta write SetCodConta;
    property Tipo:string read FTipo write SetTipo;
    property Historico:string read FHistorico write SetHistorico;
    property ValorMovimento:Currency read FValorMovimento write SetValorMovimento;
    property SaldoFinal:Currency read FSaldoFinal write SetSaldoFinal;
    property MovimentoOrigem:string read FMovimentoOrigem write SetMovimentoOrigem;
    property CodigoMovimentoOrigem:Integer read FCodigoMovimentoOrigem write SetCodigoMovimentoOrigem;
  end;
implementation

{ TMovimentoConta }

procedure TMovimentoConta.SetCodConta(const Value: Integer);
begin
  FCodConta := Value;
end;

procedure TMovimentoConta.SetCodigo(const Value: Integer);
begin
  FCodigo := Value;
end;

procedure TMovimentoConta.SetCodigoMovimentoOrigem(const Value: Integer);
begin
  FCodigoMovimentoOrigem := Value;
end;

procedure TMovimentoConta.SetData(const Value: TDate);
begin
  FData := Value;
end;

procedure TMovimentoConta.SetHistorico(const Value: string);
begin
  FHistorico := Value;
end;

procedure TMovimentoConta.SetMovimentoOrigem(const Value: string);
begin
  FMovimentoOrigem := Value;
end;

procedure TMovimentoConta.SetSaldoFinal(const Value: Currency);
begin
  FSaldoFinal := Value;
end;

procedure TMovimentoConta.SetTipo(const Value: string);
begin
  FTipo := Value;
end;

procedure TMovimentoConta.SetValorMovimento(const Value: Currency);
begin
  FValorMovimento := Value;
end;

end.
