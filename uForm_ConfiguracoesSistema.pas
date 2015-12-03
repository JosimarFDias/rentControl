unit uForm_ConfiguracoesSistema;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Vcl.Menus, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, LiderLaranja,
  dxSkinLiderMarmore, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue, cxControls, cxContainer, cxEdit,
  cxLabel, cxTextEdit, cxMaskEdit, cxSpinEdit, cxTimeEdit, cxGroupBox,
  Vcl.StdCtrls, cxButtons, Vcl.ExtCtrls;

type
  TFormConfiguracoesSistema = class(TForm)
    Panel1: TPanel;
    btnGravar: TcxButton;
    gbHorarioExpediente: TcxGroupBox;
    tmInicioExpediente: TcxTimeEdit;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    tmFimExpediente: TcxTimeEdit;
    procedure FormCreate(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormConfiguracoesSistema: TFormConfiguracoesSistema;

implementation

{$R *.dfm}

uses uc_Sistema, uCDAO_Sistema;

procedure TFormConfiguracoesSistema.btnGravarClick(Sender: TObject);
begin
  Sistema.InicioExpediente := tmInicioExpediente.Time;
  Sistema.FimExpediente := tmFimExpediente.Time;
  if TDAOSistema.Update(Sistema) then
  begin
    Application.MessageBox('Atualizado com sucesso!', 'RentControl', MB_ICONASTERISK);
    Self.Close;
  end;
end;

procedure TFormConfiguracoesSistema.FormCreate(Sender: TObject);
begin
  tmInicioExpediente.Time := Sistema.InicioExpediente;
  tmFimExpediente.Time := Sistema.FimExpediente;
end;

procedure TFormConfiguracoesSistema.FormShow(Sender: TObject);
begin
  tmInicioExpediente.SetFocus;
end;

end.
