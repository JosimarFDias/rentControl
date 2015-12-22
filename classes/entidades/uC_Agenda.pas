unit uC_Agenda;

interface
uses
  Classes, SysUtils, uC_Cliente, uC_Ambiente, DateUtils, uUtils;
type
  TAgenda=class
  private
    FCliente: TCliente;
    FCodigo: Integer;
    FAmbiente: TAmbiente;
    FStatus: string;
    FDataAgendamento: TDate;
    FDataHoraFim: TDateTime;
    FDataHoraInicio: TDateTime;
    FObservacoes: string;
    FPacote: Boolean;
    FValor: Currency;
    FFormaPagamento: TFormaPagamento;
    procedure SetAmbiente(const Value: TAmbiente);
    procedure SetCliente(const Value: TCliente);
    procedure SetCodigo(const Value: Integer);
    procedure SetDataAgendamento(const Value: TDate);
    procedure SetDataHoraFim(const Value: TDateTime);
    procedure SetDataHoraInicio(const Value: TDateTime);
    procedure SetObservacoes(const Value: string);
    procedure SetStatus(const Value: string);
    procedure SetPacote(const Value: Boolean);
    procedure SetValor(const Value: Currency);
    procedure SetFormaPagamento(const Value: TFormaPagamento);
  public
    constructor Create;
    function Finaliza:Boolean;
    property Codigo:Integer read FCodigo write SetCodigo;
    property Ambiente:TAmbiente read FAmbiente write SetAmbiente;
    property Cliente:TCliente read FCliente write SetCliente;
    property DataHoraInicio:TDateTime read FDataHoraInicio write SetDataHoraInicio;
    property DataHoraFim:TDateTime read FDataHoraFim write SetDataHoraFim;
    property DataAgendamento:TDate read FDataAgendamento write SetDataAgendamento;
    property Observacoes:string read FObservacoes write SetObservacoes;
    property Status:string read FStatus write SetStatus;
    property Pacote:Boolean read FPacote write SetPacote;
    property Valor:Currency read FValor write SetValor;
    property FormaPagamento:TFormaPagamento read FFormaPagamento write SetFormaPagamento;
  end;
implementation

{ TAgenda }

uses uCDAO_Agenda, uC_MovimentoConta, uCDAO_Ambiente, uC_Conta, uCDAO_Conta,
  uCDAO_MovimentoConta;

constructor TAgenda.Create;
begin
  Self.Cliente := TCliente.Create;
  Self.Ambiente := TAmbiente.Create;
end;

function TAgenda.Finaliza: Boolean;
var
  vMovimento:TMovimentoConta;
  vAmbiente:TAmbiente;
begin
  Result := False;
  Self.Status := 'F';
  Result := TDAOAgenda.Update(Self);
  if Result then
  begin
    vMovimento := TMovimentoConta.Create;
    try
      vMovimento.Codigo   := 0;
      vMovimento.Data     := Self.DataHoraInicio;
      vMovimento.CodConta := 1;
      vMovimento.Tipo     := 'C';
      vAmbiente := TDAOAmbiente.Read(Self.Ambiente.Codigo);
      try
        vMovimento.Historico := 'RECEBIMENTO DE '+vAmbiente.Descricao+' DE '+
                                FormatDateTime('dd/mm/yy hh:mm:ss', Self.DataHoraInicio)+' À '+
                                FormatDateTime('dd/mm/yy hh:mm:ss', Self.DataHoraFim);
        vMovimento.ValorMovimento := Self.Valor;
      finally
        vAmbiente.Free;
      end;
      vMovimento.SaldoFinal            := 0;
      vMovimento.MovimentoOrigem       := 'A';
      vMovimento.CodigoMovimentoOrigem := Self.Codigo;
      Result := TDAO_MovimentoConta.Create(vMovimento);
    finally
      vMovimento.Free;
    end;
  end;
end;

procedure TAgenda.SetAmbiente(const Value: TAmbiente);
begin
  FAmbiente := Value;
end;

procedure TAgenda.SetCliente(const Value: TCliente);
begin
  FCliente := Value;
end;

procedure TAgenda.SetCodigo(const Value: Integer);
begin
  FCodigo := Value;
end;

procedure TAgenda.SetDataAgendamento(const Value: TDate);
begin
  FDataAgendamento := Value;
end;

procedure TAgenda.SetDataHoraFim(const Value: TDateTime);
begin
  FDataHoraFim := Value;
end;

procedure TAgenda.SetDataHoraInicio(const Value: TDateTime);
begin
  FDataHoraInicio := Value;
end;

procedure TAgenda.SetFormaPagamento(const Value: TFormaPagamento);
begin
  FFormaPagamento := Value;
end;

procedure TAgenda.SetObservacoes(const Value: string);
begin
  FObservacoes := Value;
end;

procedure TAgenda.SetPacote(const Value: Boolean);
begin
  FPacote := Value;
end;

procedure TAgenda.SetStatus(const Value: string);
begin
  FStatus := Value;
end;

procedure TAgenda.SetValor(const Value: Currency);
begin
  FValor := Value;
end;

end.
