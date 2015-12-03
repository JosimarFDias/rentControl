unit uForm_Rel_AgendasPorCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uform_heranca_diag, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, LiderLaranja, dxSkinLiderMarmore, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, Vcl.Menus, ppParameter, ppDesignLayer, ppBands, ppCtrls,
  ppVar, ppPrnabl, ppClass, ppCache, ppProd, ppReport, ppComm, ppRelatv, ppDB,
  ppDBPipe, Data.DB, Datasnap.DBClient, Vcl.StdCtrls, cxButtons, cxLabel,
  dxGDIPlusClasses, cxImage, cxGroupBox, Vcl.ExtCtrls, dxBevel, Vcl.ComCtrls,
  dxCore, cxDateUtils, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, SQLExpr,
  cxRadioGroup, ppChrt, ppChrtDP;

type
  TFrm_Rel_AgendasPorCliente = class(TFrm_Diag_Heranca)
    cxGroupBox3: TcxGroupBox;
    cxLabel2: TcxLabel;
    cxDateEdit1: TcxDateEdit;
    cxDateEdit2: TcxDateEdit;
    Fim: TcxLabel;
    cxLabel3: TcxLabel;
    cdsRelatorioCodigo: TIntegerField;
    cdsRelatorioNome: TStringField;
    cdsRelatorioAgendas: TIntegerField;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppDBText3: TppDBText;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppDBCalc1: TppDBCalc;
    cxGroupBox4: TcxGroupBox;
    cxComboBox1: TcxComboBox;
    ppGrafico: TppReport;
    ppDetailBand2: TppDetailBand;
    ppSummaryBand2: TppSummaryBand;
    ppDPTeeChart1: TppDPTeeChart;
    ppDesignLayers2: TppDesignLayers;
    ppDesignLayer2: TppDesignLayer;
    ppParameterList2: TppParameterList;
    cxRadioGroup1: TcxRadioGroup;
    procedure FormShow(Sender: TObject);
    procedure cxbtnConsultarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_Rel_AgendasPorCliente: TFrm_Rel_AgendasPorCliente;

implementation

{$R *.dfm}

uses uDM, uUtils;

procedure TFrm_Rel_AgendasPorCliente.cxbtnConsultarClick(Sender: TObject);
var
  vSql:TSQLQuery;
begin
  inherited;
  cdsRelatorio.DisableControls;
  vSql := TSQLQuery.Create(nil);
  try
    vSql.SQLConnection := DM.Connect;
    case cxComboBox1.ItemIndex of
    0: vSql.SQL.Text := 'select agenda.age_cd_cliente, cliente.cli_ds_cliente, count(age_cd_agenda) from agenda inner join cliente on (cliente.cli_cd_cliente = agenda.age_cd_cliente) where cast(age_ts_inicio as date) between :d1 and :d2 group by 1, 2 order by 3 desc';
    1, 2:
      begin
        vSql.SQL.Text := 'select agenda.age_cd_cliente, cliente.cli_ds_cliente, ' +
                         'count(age_cd_agenda) from agenda inner join cliente on ' +
                         '(cliente.cli_cd_cliente = agenda.age_cd_cliente) where ' +
                         '(cast(age_ts_inicio as date) between :d1 and :d2) and ' +
                         '(agenda.age_fl_status = :status) group by 1, 2 order by 3 desc';
        case cxComboBox1.ItemIndex of
        1: vSql.Params[2].AsString := 'F';
        2: vSql.Params[2].AsString := 'A';
        end;
      end;
    end;
    vSql.Params[0].AsDate := cxDateEdit1.Date;
    vSql.Params[1].AsDate := cxDateEdit2.Date;
    vSql.Open;
    if not vSql.IsEmpty then
    begin
      cdsRelatorio.EmptyDataSet;
      vSql.First;
      while not vSql.Eof do
      begin
        cdsRelatorio.Append;
        cdsRelatorioCodigo.AsInteger := vSql.Fields[0].AsInteger;
        cdsRelatorioNome.AsString := vSql.Fields[1].AsString;
        cdsRelatorioAgendas.AsInteger := vSql.Fields[2].AsInteger;
        cdsRelatorio.Post;
        vSql.Next;
      end;
      ppLabel6.Caption := cxComboBox1.Text + ' entre '+DateToStr(cxDateEdit1.Date)+' e '+DateToStr(cxDateEdit2.Date);
      case cxRadioGroup1.ItemIndex of
        0:PrintReport(cxLabel1.Caption, ppRelatorio);
        1:PrintReport('Grafico', ppGrafico);
      end;
    end
    else
      Application.MessageBox('Dados insuficientes!', 'RentControl', MB_ICONWARNING);
  finally
    cdsRelatorio.EnableControls;
    vSql.Free;
  end;
end;

procedure TFrm_Rel_AgendasPorCliente.FormShow(Sender: TObject);
begin
  inherited;
  cxDateEdit1.Date := Date;
  cxDateEdit2.Date := Date;
end;

end.
