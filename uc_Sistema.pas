unit uc_Sistema;

interface
uses
  Classes, SysUtils, uC_Usuario;
const
  Sys_Dir_Principal='C:\RentControl\';
  Sys_Dir_Conf = Sys_Dir_Principal+'cfg\';
  Sys_Arq_Logo='Logo.jpg';
  Sys_Arq_Conf='conf.ini';
type
  TSistema=class(TObject)
  private
    FUsuarioLogado: TUsuario;
    FFimExpediente: TTime;
    FInicioExpediente: TTime;
    FServidor: string;
    procedure SetUsuarioLogado(const Value: TUsuario);
    procedure SetFimExpediente(const Value: TTime);
    procedure SetInicioExpediente(const Value: TTime);
  public
    procedure Inicializa;
  published
    property UsuarioLogado:TUsuario read FUsuarioLogado write SetUsuarioLogado;
    property InicioExpediente:TTime read FInicioExpediente write SetInicioExpediente;
    property FimExpediente:TTime read FFimExpediente write SetFimExpediente;
  end;
var
  Sistema:TSistema;
implementation

{ TSistema }

uses uCDAO_Sistema;

{ TSistema }

procedure TSistema.Inicializa;
var
  vSistema:TSistema;
begin
  vSistema := TDAOSistema.Read;
  try
    Self.InicioExpediente := vSistema.InicioExpediente;
    Self.FimExpediente := vSistema.FimExpediente;
  finally
    vSistema.Free;
  end;
end;

procedure TSistema.SetFimExpediente(const Value: TTime);
begin
  FFimExpediente := Value;
end;

procedure TSistema.SetInicioExpediente(const Value: TTime);
begin
  FInicioExpediente := Value;
end;

procedure TSistema.SetUsuarioLogado(const Value: TUsuario);
begin
  FUsuarioLogado := Value;
end;

end.
