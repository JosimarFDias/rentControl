unit uC_Mensalidade;

interface
uses
  Classes, SysUtils, uC_Cliente, uC_Receber;
type
  TMensalidade=class
  private
    FTitulo: TReceber;
    FCliente: TCliente;
    FCodigo: Integer;
    FMes: Integer;
    FAno: Integer;
    procedure SetAno(const Value: Integer);
    procedure SetCliente(const Value: TCliente);
    procedure SetCodigo(const Value: Integer);
    procedure SetMes(const Value: Integer);
    procedure SetTitulo(const Value: TReceber);
  public
    constructor Create;
  published
    property Codigo:Integer read FCodigo write SetCodigo;
    property Cliente:TCliente read FCliente write SetCliente;
    property Mes:Integer read FMes write SetMes;
    property Ano:Integer read FAno write SetAno;
    property Titulo:TReceber read FTitulo write SetTitulo;
  end;
implementation

{ TMensalidade }

constructor TMensalidade.Create;
begin
  Self.Cliente := TCliente.Create;
  Self.Titulo := TReceber.Create;
end;

procedure TMensalidade.SetAno(const Value: Integer);
begin
  FAno := Value;
end;

procedure TMensalidade.SetCliente(const Value: TCliente);
begin
  FCliente := Value;
end;

procedure TMensalidade.SetCodigo(const Value: Integer);
begin
  FCodigo := Value;
end;

procedure TMensalidade.SetMes(const Value: Integer);
begin
  FMes := Value;
end;

procedure TMensalidade.SetTitulo(const Value: TReceber);
begin
  FTitulo := Value;
end;

end.
