unit uForm_Login;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, cxGraphics,
  cxLookAndFeels, cxLookAndFeelPainters, Vcl.Menus, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue, cxButtons, Vcl.ExtCtrls,
  dxGDIPlusClasses, cxControls, cxContainer, cxEdit, cxTextEdit, cxLabel,
  LiderLaranja, dxSkinLiderMarmore;

type
  TForm_Login = class(TForm)
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    cxLabel1: TcxLabel;
    cxTextEdit1: TcxTextEdit;
    Image1: TImage;
    cxTextEdit2: TcxTextEdit;
    cxLabel2: TcxLabel;
    procedure FormShow(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_Login: TForm_Login;

implementation

{$R *.dfm}

uses uC_Usuario, uCDAO_Usuario, uc_Sistema;

procedure TForm_Login.cxButton1Click(Sender: TObject);
var
  vUsuario:TUsuario;
begin
  vUsuario := TDAO_Usuario.Read(cxTextEdit1.Text, cxTextEdit2.Text);
  if Assigned(vUsuario) then
  begin
    if not vUsuario.Ativo then
    begin
      vUsuario.Free;
      cxTextEdit1.SelectAll;
      cxTextEdit1.SetFocus;
      raise Exception.Create('Usuário inativo!');
    end;
    Sistema.UsuarioLogado := vUsuario;
    Self.Close;
  end
  else
  begin
    Application.MessageBox('Dados inválidos', 'RentControl', MB_ICONEXCLAMATION);
    cxTextEdit1.SelectAll;
    cxTextEdit1.SetFocus;
  end;
end;

procedure TForm_Login.cxButton2Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TForm_Login.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_RETURN) then
    Perform (CM_DIALOGKEY, VK_TAB, 0)
  else if (Key = VK_ESCAPE) then
    Perform(WM_NEXTDLGCTL,1,0);
end;

procedure TForm_Login.FormShow(Sender: TObject);
begin
  cxTextEdit1.SetFocus;
end;

end.
