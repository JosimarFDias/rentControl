unit uDM;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.SqlExpr, Data.DBXFirebird,
  Inifiles;

type
  TDM = class(TDataModule)
    Connect: TSQLConnection;
    procedure ConnectAfterConnect(Sender: TObject);
    procedure ConnectBeforeConnect(Sender: TObject);
  private
    FServidor: string;
    procedure SetServidor(const Value: string);
    { Private declarations }
  public
    { Public declarations }
    property Servidor:string read FServidor write SetServidor;
  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses uUtils, uc_Sistema;

{$R *.dfm}

procedure TDM.ConnectAfterConnect(Sender: TObject);
begin
  UpdateDataBase;
end;

procedure TDM.ConnectBeforeConnect(Sender: TObject);
var
  vIni:TIniFile;
begin
  vIni := TIniFile.Create(Sys_Dir_Conf+Sys_Arq_Conf);
  try
    Connect.Params.Values['DATABASE'] := vIni.ReadString('BD', 'SERVIDOR', 'LOCALHOST')+':C:\RentControl\Dados\dados.fdb';
    Self.Servidor := vIni.ReadString('BD', 'SERVIDOR', 'LOCALHOST');
  finally
    vIni.Free;
  end;
end;

procedure TDM.SetServidor(const Value: string);
begin
  FServidor := Value;
end;

end.
