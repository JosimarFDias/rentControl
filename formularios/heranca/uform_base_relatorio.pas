unit uform_base_relatorio;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ppViewr, Vcl.ComCtrls,
  Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ImgList, cxGraphics,
  cxLookAndFeels, cxLookAndFeelPainters, Vcl.Menus, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary,
  dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue, cxButtons;

type
  TForm_Base_Relatorio = class(TForm)
    pnlFiltro: TPanel;
    Splitter1: TSplitter;
    pnlRelatorio: TPanel;
    ppRelatorio: TppViewer;
    sd1: TSaveDialog;
    Bevel1: TBevel;
    ImageList1: TImageList;
    CategoryPanelGroup1: TCategoryPanelGroup;
    CategoryPanelCliente: TCategoryPanel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    CategoryPanelAgenda: TCategoryPanel;
    cxButton3: TcxButton;
    CategoryPanelFinanceiro: TCategoryPanel;
    cxButton4: TcxButton;
    cxButton5: TcxButton;
    cxButton6: TcxButton;
    procedure FormCreate(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure cxButton3Click(Sender: TObject);
    procedure cxButton4Click(Sender: TObject);
    procedure cxButton5Click(Sender: TObject);
    procedure cxButton6Click(Sender: TObject);
  private
    FreportName: string;
    { Private declarations }
    procedure SetreportName(const Value: string);
  public
    { Public declarations }
    property reportName:string read FreportName write SetreportName;
  end;

var
  Form_Base_Relatorio: TForm_Base_Relatorio;

implementation

{$R *.dfm}

uses uform_principal, uForm_Rel_RelacaoCliente, uForm_Rel_AgendasPorCliente,
  uForm_Rel_AgendasPorDiaSemana, uForm_Rel_ReceitasDespesas,
  uForm_Rel_ContasPagar, uForm_Rel_ContasReceber;

procedure TForm_Base_Relatorio.cxButton1Click(Sender: TObject);
begin
  if not assigned(Frm_Rel_RelacaoCliente) then
  begin
    Frm_Rel_RelacaoCliente := TFrm_Rel_RelacaoCliente.Create(nil);
    Frm_Rel_RelacaoCliente.Parent := pnlFiltro;
  end;
  Frm_Rel_RelacaoCliente.Show;
end;

procedure TForm_Base_Relatorio.cxButton2Click(Sender: TObject);
begin
  if not assigned(Frm_Rel_AgendasPorCliente) then
  begin
    Frm_Rel_AgendasPorCliente := TFrm_Rel_AgendasPorCliente.Create(nil);
    Frm_Rel_AgendasPorCliente.Parent := pnlFiltro;
  end;
  Frm_Rel_AgendasPorCliente.Show;
end;

procedure TForm_Base_Relatorio.cxButton3Click(Sender: TObject);
begin
  if not Assigned(Frm_Rel_AgendasPorDiaSemana) then
  begin
    Frm_Rel_AgendasPorDiaSemana := TFrm_Rel_AgendasPorDiaSemana.Create(nil);
    Frm_Rel_AgendasPorDiaSemana.Parent := pnlFiltro;
  end;
  Frm_Rel_AgendasPorDiaSemana.Show;
end;

procedure TForm_Base_Relatorio.cxButton4Click(Sender: TObject);
begin
  if not Assigned(Frm_Rel_ReceitasDespesas) then
  begin
    Frm_Rel_ReceitasDespesas := TFrm_Rel_ReceitasDespesas.Create(nil);
    Frm_Rel_ReceitasDespesas.Parent := pnlFiltro;
  end;
  Frm_Rel_ReceitasDespesas.Show;
end;

procedure TForm_Base_Relatorio.cxButton5Click(Sender: TObject);
begin
  if not Assigned(Frm_Rel_ContasAPagar) then
  begin
    Frm_Rel_ContasAPagar := TFrm_Rel_ContasAPagar.Create(nil);
    Frm_Rel_ContasAPagar.Parent := pnlFiltro;
  end;
  Frm_Rel_ContasAPagar.Show;
end;

procedure TForm_Base_Relatorio.cxButton6Click(Sender: TObject);
begin
  if not Assigned(Frm_Rel_ContasAReceber) then
  begin
    Frm_Rel_ContasAReceber := TFrm_Rel_ContasAReceber.Create(nil);
    Frm_Rel_ContasAReceber.Parent := pnlFiltro;
  end;
  Frm_Rel_ContasAReceber.Show;
end;

procedure TForm_Base_Relatorio.FormCreate(Sender: TObject);
begin
  CategoryPanelGroup1.CollapseAll;
end;

procedure TForm_Base_Relatorio.SetreportName(const Value: string);
begin
  FreportName := Value;
end;
{------------------------------------------------------------------------------}
end.
