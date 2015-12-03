unit uForm_Rel_ReceitasDespesas;

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
  dxCore, cxDateUtils, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, cxRadioGroup, cxTextEdit, cxMaskEdit, cxCalendar, ppChrt,
  ppChrtDP, SqlExpr;

type
  TFrm_Rel_ReceitasDespesas = class(TFrm_Diag_Heranca)
    cxGroupBox3: TcxGroupBox;
    cxGroupBox4: TcxGroupBox;
    cxLabel2: TcxLabel;
    cxDateEdit1: TcxDateEdit;
    cxDateEdit2: TcxDateEdit;
    Fim: TcxLabel;
    cxLabel3: TcxLabel;
    cdsComboConta: TClientDataSet;
    cdsComboContaCodigo: TIntegerField;
    cdsComboContaDecricao: TStringField;
    dsComboConta: TDataSource;
    cxLookupComboBox1: TcxLookupComboBox;
    cdsRelatorioTIPO: TStringField;
    cdsRelatorioTOTAL: TCurrencyField;
    ppGrafico: TppReport;
    ppDetailBand2: TppDetailBand;
    ppSummaryBand2: TppSummaryBand;
    ppDPTeeChart1: TppDPTeeChart;
    ppDesignLayers2: TppDesignLayers;
    ppDesignLayer2: TppDesignLayer;
    ppParameterList2: TppParameterList;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cxbtnConsultarClick(Sender: TObject);
  private
    { Private declarations }
    function ListaContas:Boolean;
  public
    { Public declarations }
  end;

var
  Frm_Rel_ReceitasDespesas: TFrm_Rel_ReceitasDespesas;

implementation

{$R *.dfm}

uses uC_Conta, uCDAO_Conta, uDM, uUtils;

procedure TFrm_Rel_ReceitasDespesas.cxbtnConsultarClick(Sender: TObject);
var
  vSql:TSQLQuery;
begin
  inherited;
  if (cxDateEdit1.Date > cxDateEdit2.Date) then
  begin
    Application.MessageBox('Data inicial superior a data final!', 'RentControl', MB_ICONEXCLAMATION);
    cxDateEdit1.SetFocus;
    Exit;
  end;
  if (cxLookupComboBox1.EditValue = 0) or VarIsNull(cxLookupComboBox1.EditValue) then
  begin
    Application.MessageBox('Selecione uma conta válida!', 'RentControl', MB_ICONEXCLAMATION);
    cxLookupComboBox1.SetFocus;
    Exit;
  end;
  cdsRelatorio.DisableControls;
  vSql := TSQLQuery.Create(nil);
  try
    vSql.SQLConnection := DM.Connect;
    vSql.SQL.Text :=  'select ' +
                      '    case ' +
                      '        when movimento_conta.cmv_fl_tipo = ''D'' then ''Despesas'' ' +
                      '        else ''Receitas'' ' +
                      '    end as tipo, ' +
                      '    sum(movimento_conta.cmv_vl_valor) as total ' +
                      'from ' +
                      '    movimento_conta ' +
                      'where ' +
                      '    (movimento_conta.cmv_dt_data between :d1 and :d2) and ' +
                      '    (movimento_conta.cmv_cd_conta = :conta) '+
                      'group by ' +
                      '    1 ';
    vSql.Params[0].AsDate := cxDateEdit1.Date;
    vSql.Params[1].AsDate := cxDateEdit2.Date;
    vSql.Params[2].AsInteger := cxLookupComboBox1.EditValue;
    vSql.Open;
    if not vSql.IsEmpty then
    begin
      cdsRelatorio.EmptyDataSet;
      vSql.First;
      while not vSql.Eof do
      begin
        cdsRelatorio.Append;
        cdsRelatorioTIPO.AsString := vSql.Fields[0].AsString;
        cdsRelatorioTOTAL.AsCurrency := vSql.Fields[1].AsCurrency;
        cdsRelatorio.Post;
        vSql.Next;
      end;
      PrintReport('Grafico', ppGrafico);
    end
    else
      Application.MessageBox('Dados insuficientes!', 'RentControl', MB_ICONWARNING);
  finally
    cdsRelatorio.EnableControls;
    vSql.Free;
  end;
end;

procedure TFrm_Rel_ReceitasDespesas.FormCreate(Sender: TObject);
begin
  inherited;
  cdsComboConta.CreateDataSet;
  cxDateEdit1.Date := Date;
  cxDateEdit2.Date := Date;
end;

procedure TFrm_Rel_ReceitasDespesas.FormShow(Sender: TObject);
begin
  inherited;
  ListaContas;
end;

function TFrm_Rel_ReceitasDespesas.ListaContas: Boolean;
var
  vLista:TList;
  i: Integer;
begin
  Result := False;
  vLista := TDAO_Conta.Read('');
  if not Assigned(vLista) then
    Exit;
  cdsComboConta.DisableControls;
  try
    for i := 0 to vLista.Count - 1 do
    begin
      cdsComboConta.Append;
      cdsComboContaCodigo.AsInteger := TConta(vLista[i]).Codigo;
      cdsComboContaDecricao.AsString := TConta(vLista[i]).Descricao;
      cdsComboConta.Post;
    end;
  finally
    cdsComboConta.EnableControls;
  end;
  Result := True
end;

end.
