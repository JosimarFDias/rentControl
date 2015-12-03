unit uForm_Rel_AgendasPorDiaSemana;

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
  dxCore, cxDateUtils, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar,
  SqlExpr, ppChrt, ppChrtDP, cxRadioGroup;

type
  TFrm_Rel_AgendasPorDiaSemana = class(TFrm_Diag_Heranca)
    cxGroupBox3: TcxGroupBox;
    cxLabel2: TcxLabel;
    cxDateEdit1: TcxDateEdit;
    cxDateEdit2: TcxDateEdit;
    Fim: TcxLabel;
    cxLabel3: TcxLabel;
    cdsRelatorioDIA: TStringField;
    cdsRelatorioQUANTIDADE: TIntegerField;
    ppLabel4: TppLabel;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppDBCalc1: TppDBCalc;
    ppGrafico: TppReport;
    ppParameterList2: TppParameterList;
    ppDesignLayers2: TppDesignLayers;
    ppDesignLayer2: TppDesignLayer;
    ppDetailBand2: TppDetailBand;
    ppSummaryBand2: TppSummaryBand;
    ppDPTeeChart1: TppDPTeeChart;
    cxRadioGroup1: TcxRadioGroup;
    procedure cxbtnConsultarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_Rel_AgendasPorDiaSemana: TFrm_Rel_AgendasPorDiaSemana;

implementation

{$R *.dfm}

uses uDM, uUtils, uFormChart, uform_base_relatorio;

procedure TFrm_Rel_AgendasPorDiaSemana.cxbtnConsultarClick(Sender: TObject);
var
  vSql:TSQLQuery;
begin
  inherited;
  cdsRelatorio.DisableControls;
  vSql := TSQLQuery.Create(nil);
  try
    vSql.SQLConnection := DM.Connect;
    vSql.SQL.Text := 'select ' +
                      '    extract(weekday from agenda.age_ts_inicio), ' +
                      '    CASE extract(weekday from agenda.age_ts_inicio) ' +
                      '     when 0 then ''DOMINGO'' ' +
                      '     when 1 then ''SEGUNDA-FEIRA'' ' +
                      '     when 2 then ''TERÇA-FEIRA'' ' +
                      '     when 3 then ''QUARTA-FEIRA'' ' +
                      '     when 4 then ''QUINTA-FEIRA'' ' +
                      '     when 5 then ''SEXTA-FEIRA'' ' +
                      '     when 6 then ''SÁBADO'' ' +
                      '    END  as dia, ' +
                      '    count(agenda.age_cd_agenda) quantidade ' +
                      'from ' +
                      '    agenda ' +
                      'where ' +
                      '    (agenda.age_fl_status = ''F'') and '+
                      '    (cast(age_ts_inicio as date) between :d1 and :d2) '+
                      'group by 1,2 ' +
                      'order by 1 ';
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
        cdsRelatorioDIA.AsString := vSql.Fields[1].AsString;
        cdsRelatorioQUANTIDADE.AsInteger := vSql.Fields[2].AsInteger;
        cdsRelatorio.Post;
        vSql.Next;
      end;
      ppLabel6.Caption := ' entre '+DateToStr(cxDateEdit1.Date)+' e '+DateToStr(cxDateEdit2.Date);
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

procedure TFrm_Rel_AgendasPorDiaSemana.FormShow(Sender: TObject);
begin
  inherited;
  cxDateEdit1.Date := Date;
  cxDateEdit2.Date := Date;
end;

end.
