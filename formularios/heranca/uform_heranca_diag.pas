unit uform_heranca_diag;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, Vcl.Imaging.pngimage, Vcl.ExtCtrls, AeroButtons, DBClient,
  ppParameter, ppProd, ppClass, ppReport, ppComm, ppRelatv, ppDB, ppDBPipe,
  Data.DB, ppDesignLayer, ppBands, ppCtrls, ppVar, ppPrnabl, ppCache,
  cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Vcl.Menus, dxSkinsCore,
  dxSkinLiderMarmore, cxButtons, dxBevel, LiderLaranja, dxSkinBlack, dxSkinBlue,
  dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, cxControls, cxContainer, cxEdit, cxLabel,
  dxGDIPlusClasses, cxImage, cxGroupBox;

type
  TFrm_Diag_Heranca = class(TForm)
    cdsRelatorio: TClientDataSet;
    dsRelatorio: TDataSource;
    ppDBRelatorio: TppDBPipeline;
    Panel2: TPanel;
    ppRelatorio: TppReport;
    ppParameterList1: TppParameterList;
    ppDesignLayers1: TppDesignLayers;
    ppDesignLayer1: TppDesignLayer;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppTitleBand1: TppTitleBand;
    ppLabel1: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppShape1: TppShape;
    ppLabel2: TppLabel;
    ppSystemVariable2: TppSystemVariable;
    ppLabel3: TppLabel;
    ppImage1: TppImage;
    ppLine1: TppLine;
    ppLine2: TppLine;
    ppLine3: TppLine;
    ppShape2: TppShape;
    ppLine4: TppLine;
    ppLine5: TppLine;
    ppLine6: TppLine;
    ppLine7: TppLine;
    ppLine8: TppLine;
    ppLine9: TppLine;
    ppSummaryBand1: TppSummaryBand;
    ppLine10: TppLine;
    cxGroupBox1: TcxGroupBox;
    cxImage1: TcxImage;
    cxLabel1: TcxLabel;
    cxGroupBox2: TcxGroupBox;
    cxbtnConsultar: TcxButton;
    cxButton2: TcxButton;
    dxBevel1: TdxBevel;
    procedure ppShape1Print(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure ppImage1Print(Sender: TObject);
    procedure cxbtnConsultarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_Diag_Heranca: TFrm_Diag_Heranca;

implementation

{$R *.dfm}

uses uc_Sistema;

{ TFrm_Diag_Heranca }

{------------------------------------------------------------------------------}
procedure TFrm_Diag_Heranca.cxbtnConsultarClick(Sender: TObject);
begin

end;
{------------------------------------------------------------------------------}
procedure TFrm_Diag_Heranca.cxButton2Click(Sender: TObject);
begin
  Self.Close;
end;
{------------------------------------------------------------------------------}
procedure TFrm_Diag_Heranca.FormCreate(Sender: TObject);
begin
  cdsRelatorio.CreateDataSet;
end;

procedure TFrm_Diag_Heranca.FormShow(Sender: TObject);
begin

end;
{------------------------------------------------------------------------------}
procedure TFrm_Diag_Heranca.ppImage1Print(Sender: TObject);
begin
  if FileExists(Sys_Dir_Principal+Sys_Arq_Logo) then
    ppImage1.Picture.LoadFromFile(Sys_Dir_Principal+Sys_Arq_Logo);
end;
{------------------------------------------------------------------------------}
procedure TFrm_Diag_Heranca.ppShape1Print(Sender: TObject);
begin
  ppShape1.Visible := not(ppShape1.Visible);
end;
{------------------------------------------------------------------------------}
end.
