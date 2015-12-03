unit uC_Pagar;

interface
uses
  Classes, SysUtils, uC_Fornecedor, Forms, Windows;
type
  TPagar=class
  private
    FHistorico: string;
    FDataTitulo: TDate;
    FValor: Currency;
    FCodigo: Integer;
    FVencimento: TDate;
    FDataPagamento: TDate;
    FStatus: string;
    FFornecedor: TFornecedor;
    FValorPago: Currency;
    procedure SetCodigo(const Value: Integer);
    procedure SetDataPagamento(const Value: TDate);
    procedure SetDataTitulo(const Value: TDate);
    procedure SetFornecedor(const Value: TFornecedor);
    procedure SetHistorico(const Value: string);
    procedure SetStatus(const Value: string);
    procedure SetValor(const Value: Currency);
    procedure SetValorPago(const Value: Currency);
    procedure SetVencimento(const Value: TDate);
  public
    constructor Create;
    function Pagar(pCodigoConta:Integer; pValorPago:Currency;
      pDataPagamento:TDate):Boolean;
  published
    property Codigo:Integer read FCodigo write SetCodigo;
    property DataTitulo:TDate read FDataTitulo write SetDataTitulo;
    property Fornecedor:TFornecedor read FFornecedor write SetFornecedor;
    property Vencimento:TDate read FVencimento write SetVencimento;
    property Valor:Currency read FValor write SetValor;
    property Status:string read FStatus write SetStatus;
    property DataPagamento:TDate read FDataPagamento write SetDataPagamento;
    property ValorPago:Currency read FValorPago write SetValorPago;
    property Historico:string read FHistorico write SetHistorico;
  end;
implementation

{ TPagar }

uses uC_MovimentoConta, uCDAO_MovimentoConta, uCDAO_Pagar;

constructor TPagar.Create;
begin
  Self.Fornecedor := TFornecedor.Create;
end;

function TPagar.Pagar(pCodigoConta: Integer; pValorPago: Currency;
  pDataPagamento: TDate): Boolean;
var
  vMovimento:TMovimentoConta;
begin
  Result := False;
  if pValorPago < Self.Valor then
    raise Exception.Create('Valor inferior ao valor do título');

  Self.Status := 'Q';
  Self.DataPagamento := pDataPagamento;
  Self.ValorPago := pValorPago;
  Result := TDAOPagar.Update(Self);
  if Result then
  begin
    vMovimento := TMovimentoConta.Create;
    try
      vMovimento.Codigo                := 0;
      vMovimento.Data                  := Date;
      vMovimento.CodConta              := pCodigoConta;
      vMovimento.Tipo                  := 'D';
      vMovimento.Historico             := 'PAGAMENTO DE '+Self.Historico+' À '+Self.Fornecedor.Nome;
      vMovimento.ValorMovimento        := pValorPago;
      vMovimento.SaldoFinal            := 0;
      vMovimento.MovimentoOrigem       := 'P';
      vMovimento.CodigoMovimentoOrigem := Self.Codigo;
      Result := TDAO_MovimentoConta.Create(vMovimento);
    finally
      vMovimento.Free;
    end;
  end;
end;

procedure TPagar.SetCodigo(const Value: Integer);
begin
  FCodigo := Value;
end;

procedure TPagar.SetDataPagamento(const Value: TDate);
begin
  FDataPagamento := Value;
end;

procedure TPagar.SetDataTitulo(const Value: TDate);
begin
  FDataTitulo := Value;
end;

procedure TPagar.SetFornecedor(const Value: TFornecedor);
begin
  FFornecedor := Value;
end;

procedure TPagar.SetHistorico(const Value: string);
begin
  FHistorico := Value;
end;

procedure TPagar.SetStatus(const Value: string);
begin
  FStatus := Value;
end;

procedure TPagar.SetValor(const Value: Currency);
begin
  FValor := Value;
end;

procedure TPagar.SetValorPago(const Value: Currency);
begin
  FValorPago := Value;
end;

procedure TPagar.SetVencimento(const Value: TDate);
begin
  FVencimento := Value;
end;

end.
