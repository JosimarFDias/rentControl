unit uFormAgendamentoPacote;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.ComCtrls, dxCore, cxDateUtils,
  dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, Vcl.Menus, Vcl.StdCtrls, cxButtons, cxLabel, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxCalendar, DateUtils;

type
  TFormAgendamentoPacote = class(TForm)
    cxDateEdit1: TcxDateEdit;
    cxLabel1: TcxLabel;
    cxDateEdit2: TcxDateEdit;
    cxLabel2: TcxLabel;
    cxDateEdit3: TcxDateEdit;
    cxLabel3: TcxLabel;
    cxDateEdit4: TcxDateEdit;
    cxLabel4: TcxLabel;
    cxDateEdit5: TcxDateEdit;
    cxLabel5: TcxLabel;
    cxDateEdit6: TcxDateEdit;
    cxLabel6: TcxLabel;
    cxDateEdit7: TcxDateEdit;
    cxLabel7: TcxLabel;
    cxDateEdit8: TcxDateEdit;
    cxLabel8: TcxLabel;
    cxButton1: TcxButton;
    cxDateEdit9: TcxDateEdit;
    cxDateEdit10: TcxDateEdit;
    cxDateEdit11: TcxDateEdit;
    cxDateEdit12: TcxDateEdit;
    cxDateEdit13: TcxDateEdit;
    cxDateEdit14: TcxDateEdit;
    cxDateEdit15: TcxDateEdit;
    cxDateEdit16: TcxDateEdit;
    procedure FormShow(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormAgendamentoPacote: TFormAgendamentoPacote;

implementation

{$R *.dfm}

procedure TFormAgendamentoPacote.cxButton1Click(Sender: TObject);
begin
  Self.Close;
end;

procedure TFormAgendamentoPacote.FormShow(Sender: TObject);
begin
  cxDateEdit2.Date := IncDay(cxDateEdit1.Date, 7);
  cxDateEdit3.Date := IncDay(cxDateEdit2.Date, 7);
  cxDateEdit4.Date := IncDay(cxDateEdit3.Date, 7);
  cxDateEdit5.Date := IncDay(cxDateEdit4.Date, 7);
  cxDateEdit6.Date := IncDay(cxDateEdit5.Date, 7);
  cxDateEdit7.Date := IncDay(cxDateEdit6.Date, 7);
  cxDateEdit8.Date := IncDay(cxDateEdit7.Date, 7);

  cxDateEdit10.Date := IncDay(cxDateEdit9.Date, 7);
  cxDateEdit11.Date := IncDay(cxDateEdit10.Date, 7);
  cxDateEdit12.Date := IncDay(cxDateEdit11.Date, 7);
  cxDateEdit13.Date := IncDay(cxDateEdit12.Date, 7);
  cxDateEdit14.Date := IncDay(cxDateEdit13.Date, 7);
  cxDateEdit15.Date := IncDay(cxDateEdit14.Date, 7);
  cxDateEdit16.Date := IncDay(cxDateEdit15.Date, 7);
end;

end.
