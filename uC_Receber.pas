unit uC_Receber;

interface
uses
  Classes, SysUtils, uC_Cliente, Forms, Windows;
type
  TReceber=class
  private
    FDataTitulo: TDate;
    FValor: Currency;
    FCliente: TCliente;
    FCodigo: Integer;
    FVencimento: TDate;
    FDataPagamento: TDate;
    FStatus: string;
    FValorPago: Currency;
    FCodigoContaOrigem: Integer;
    FHistorico: string;
    procedure SetCliente(const Value: TCliente);
    procedure SetCodigo(const Value: Integer);
    procedure SetCodigoContaOrigem(const Value: Integer);
    procedure SetDataPagamento(const Value: TDate);
    procedure SetDataTitulo(const Value: TDate);
    procedure SetStatus(const Value: string);
    procedure SetValor(const Value: Currency);
    procedure SetValorPago(const Value: Currency);
    procedure SetVencimento(const Value: TDate);
    procedure SetHistorico(const Value: string);
  public
    constructor Create;
    function Receber(pCodigoConta:Integer; pValorRecebido:Currency;
      pDataRecebimento:TDate):Boolean;
  published
    property Codigo:Integer read FCodigo write SetCodigo;
    property DataTitulo:TDate read FDataTitulo write SetDataTitulo;
    property Cliente:TCliente read FCliente write SetCliente;
    property Vencimento:TDate read FVencimento write SetVencimento;
    property Valor:Currency read FValor write SetValor;
    property Status:string read FStatus write SetStatus;
    property DataPagamento:TDate read FDataPagamento write SetDataPagamento;
    property ValorPago:Currency read FValorPago write SetValorPago;
    property CodigoContaOrigem:Integer read FCodigoContaOrigem write SetCodigoContaOrigem;
    property Historico:string read FHistorico write SetHistorico;
  end;
implementation

{ TReceber }

uses uC_Conta, uC_MovimentoConta, uCDAO_Conta, uCDAO_Receber,
  uCDAO_MovimentoConta;

constructor TReceber.Create;
begin
  Self.Cliente := TCliente.Create;
end;

function TReceber.Receber(pCodigoConta: Integer;
  pValorRecebido: Currency; pDataRecebimento:TDate): Boolean;
var
  vMovimento:TMovimentoConta;
  vReceber:TReceber;
begin
  Result := False;
  if pValorRecebido < Self.Valor then
    if Application.MessageBox('O valor recebido é inferior ao valor da conta.'+#13+#10+
                              'Caso prossiga com o recebimento, uma conta com o valor restante será criada.'+#13+#10+
                              'Deseja prosseguir?', 'RentControl', MB_ICONQUESTION+MB_YESNO+MB_DEFBUTTON1)=ID_NO then
      Exit;

  Self.Status := 'Q';
  Self.DataPagamento := pDataRecebimento;
  Self.ValorPago := pValorRecebido;
  Result := TDAOReceber.Update(Self);
  if Result then
  begin
    if pValorRecebido < Self.Valor then
    begin
      vReceber := TReceber.Create;
      try
        vReceber.Codigo            := 0;
        vReceber.DataTitulo        := pDataRecebimento;
        vReceber.Cliente           := Self.Cliente;
        vReceber.Vencimento        := Self.Vencimento;
        vReceber.Valor             := Self.Valor-pValorRecebido;
        vReceber.Status            := 'A';
        vReceber.DataPagamento     := 0;
        vReceber.ValorPago         := 0;
        vReceber.CodigoContaOrigem := Self.Codigo;
        vReceber.Historico         := 'DIFERENCA DE RECEBIMENTO DE TITULO PAGO NO DIA '+FormatDateTime('DD/MM/YY', Self.DataPagamento);
        Result := TDAOReceber.Create(vReceber);
      finally
        vReceber.Free;
      end;
    end;
  end;
  if Result then
  begin
    vMovimento := TMovimentoConta.Create;
    try
      vMovimento.Codigo                := 0;
      vMovimento.Data                  := Date;
      vMovimento.CodConta              := pCodigoConta;
      vMovimento.Tipo                  := 'C';
      vMovimento.Historico             := 'RECEBIMENTO DO TÍTULO DE '+Self.Cliente.Nome;
      vMovimento.ValorMovimento        := pValorRecebido;
      vMovimento.SaldoFinal            := 0;
      vMovimento.MovimentoOrigem       := 'R';
      vMovimento.CodigoMovimentoOrigem := Self.Codigo;
      Result := TDAO_MovimentoConta.Create(vMovimento);
    finally
      vMovimento.Free;
    end;
  end;
end;

procedure TReceber.SetCliente(const Value: TCliente);
begin
  FCliente := Value;
end;

procedure TReceber.SetCodigo(const Value: Integer);
begin
  FCodigo := Value;
end;

procedure TReceber.SetCodigoContaOrigem(const Value: Integer);
begin
  FCodigoContaOrigem := Value;
end;

procedure TReceber.SetDataPagamento(const Value: TDate);
begin
  FDataPagamento := Value;
end;

procedure TReceber.SetDataTitulo(const Value: TDate);
begin
  FDataTitulo := Value;
end;

procedure TReceber.SetHistorico(const Value: string);
begin
  FHistorico := Value;
end;

procedure TReceber.SetStatus(const Value: string);
begin
  FStatus := Value;
end;

procedure TReceber.SetValor(const Value: Currency);
begin
  FValor := Value;
end;

procedure TReceber.SetValorPago(const Value: Currency);
begin
  FValorPago := Value;
end;

procedure TReceber.SetVencimento(const Value: TDate);
begin
  FVencimento := Value;
end;

end.
