unit uForm_Rel_RelacaoCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uform_heranca_diag, cxGraphics,
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
  dxSkinWhiteprint, dxSkinXmas2008Blue, ppParameter, ppDesignLayer, ppBands,
  ppCtrls, ppVar, ppPrnabl, ppClass, ppCache, ppProd, ppReport, ppComm,
  ppRelatv, ppDB, ppDBPipe, Data.DB, Datasnap.DBClient, Vcl.StdCtrls, cxButtons,
  Vcl.ExtCtrls, dxBevel, Vcl.Imaging.pngimage, cxControls, cxContainer, cxEdit,
  cxLabel, dxGDIPlusClasses, cxImage, cxGroupBox;

type
  TFrm_Rel_RelacaoCliente = class(TFrm_Diag_Heranca)
    cdsRelatorioCodigo: TIntegerField;
    cdsRelatorioNome: TStringField;
    cdsRelatorioTelefone: TStringField;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    procedure cxbtnConsultarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_Rel_RelacaoCliente: TFrm_Rel_RelacaoCliente;

implementation

{$R *.dfm}

uses uCDAO_Cliente, uC_Cliente, uform_base_relatorio, uUtils;

procedure TFrm_Rel_RelacaoCliente.cxbtnConsultarClick(Sender: TObject);
var
  vLista:TList;
  i:Integer;
begin
  inherited;
  cdsRelatorio.DisableControls;
  try
    vLista := TDAOCliente.Read('');
    if Assigned(vLista) then
    begin
      cdsRelatorio.EmptyDataSet;
      for i := 0 to vlista.Count - 1 do
      begin
        cdsRelatorio.Append;
        cdsRelatorioCodigo.AsInteger := TCLiente(vLista[i]).Codigo;
        cdsRelatorioNome.AsString := TCLiente(vLista[i]).Nome;
        cdsRelatorioTelefone.AsString := TCLiente(vLista[i]).Telefone;
        cdsRelatorio.Post;
      end;
      PrintReport(cxLabel1.Caption, ppRelatorio);
    end
    else
      Application.MessageBox('Dados insuficientes!', 'RentControl', MB_ICONWARNING);
  finally
    cdsRelatorio.EnableControls;
  end;
end;

end.
