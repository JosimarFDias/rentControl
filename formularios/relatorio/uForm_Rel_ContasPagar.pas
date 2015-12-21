unit uForm_Rel_ContasPagar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uform_heranca_diag, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
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
  dxSkinXmas2008Blue, Vcl.Menus, ppParameter, ppDesignLayer, ppBands, ppCtrls,
  ppVar, ppPrnabl, ppClass, ppCache, ppProd, ppReport, ppComm, ppRelatv, ppDB,
  ppDBPipe, Data.DB, Datasnap.DBClient, Vcl.StdCtrls, cxButtons, cxLabel,
  dxGDIPlusClasses, cxImage, cxGroupBox, Vcl.ExtCtrls, dxBevel, cxRadioGroup,
  Vcl.ComCtrls, dxCore, cxDateUtils, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxCalendar;

type
  TFrm_Rel_ContasAPagar = class(TFrm_Diag_Heranca)
    cxRadioGroup1: TcxRadioGroup;
    cxRadioGroup2: TcxRadioGroup;
    cxGroupBox3: TcxGroupBox;
    cxLabel2: TcxLabel;
    cxDateEdit1: TcxDateEdit;
    cxDateEdit2: TcxDateEdit;
    Fim: TcxLabel;
    cxLabel3: TcxLabel;
    cxGroupBox4: TcxGroupBox;
    cxTextEdit1: TcxTextEdit;
    cxButton1: TcxButton;
    cxTextEdit2: TcxTextEdit;
    cdsRelatorioDataTitulo: TDateField;
    cdsRelatorioNomeFornecedor: TStringField;
    cdsRelatorioVencimento: TDateField;
    cdsRelatorioValor: TCurrencyField;
    cdsRelatorioStatus: TStringField;
    cdsRelatorioDataPagamento: TDateField;
    cdsRelatorioValorPago: TCurrencyField;
    cdsRelatorioHistorico: TStringField;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppReport1: TppReport;
    ppTitleBand2: TppTitleBand;
    ppLabel8: TppLabel;
    ppSystemVariable3: TppSystemVariable;
    ppImage2: TppImage;
    ppLine11: TppLine;
    ppLine12: TppLine;
    ppLine13: TppLine;
    ppHeaderBand2: TppHeaderBand;
    ppShape3: TppShape;
    ppLabel9: TppLabel;
    ppLine14: TppLine;
    ppLine15: TppLine;
    ppLine16: TppLine;
    ppLine17: TppLine;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppDetailBand2: TppDetailBand;
    ppShape4: TppShape;
    ppLine18: TppLine;
    ppLine19: TppLine;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppFooterBand2: TppFooterBand;
    ppLabel14: TppLabel;
    ppSystemVariable4: TppSystemVariable;
    ppSummaryBand2: TppSummaryBand;
    ppLine20: TppLine;
    ppDesignLayers2: TppDesignLayers;
    ppDesignLayer2: TppDesignLayer;
    ppParameterList2: TppParameterList;
    ppLabel15: TppLabel;
    ppDBText11: TppDBText;
    ppLabel16: TppLabel;
    ppDBCalc1: TppDBCalc;
    ppLabel17: TppLabel;
    ppDBCalc2: TppDBCalc;
    ppLabel18: TppLabel;
    ppLabel19: TppLabel;
    procedure cxTextEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure cxButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cxbtnConsultarClick(Sender: TObject);
    procedure cxRadioGroup1Click(Sender: TObject);
    procedure ppImage2Print(Sender: TObject);
    procedure ppShape4Print(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_Rel_ContasAPagar: TFrm_Rel_ContasAPagar;

implementation

{$R *.dfm}

uses uC_Fornecedor, uForm_Pesquisa, uCDAO_Fornecedor, uCDAO_Pagar, uC_Pagar,
  uUtils, uc_Sistema;

procedure TFrm_Rel_ContasAPagar.cxbtnConsultarClick(Sender: TObject);
var
  vLista:TList;
  i:Integer;
begin
  inherited;
  case cxRadioGroup1.ItemIndex of
  0:
    begin
      case cxRadioGroup2.ItemIndex of
      0:vLista := TDAOPagar.ReadDataTitulo('A', cxDateEdit1.Date, cxDateEdit2.Date, StrToIntDef(cxTextEdit1.Text, 0));
      1:vLista := TDAOPagar.ReadDataVencimento('A', cxDateEdit1.Date, cxDateEdit2.Date, StrToIntDef(cxTextEdit1.Text, 0));
      end;
    end;
  1:
    begin
      case cxRadioGroup2.ItemIndex of
        0:vLista := TDAOPagar.ReadDataTitulo('Q', cxDateEdit1.Date, cxDateEdit2.Date, StrToIntDef(cxTextEdit1.Text, 0));
        1:vLista := TDAOPagar.ReadDataVencimento('Q', cxDateEdit1.Date, cxDateEdit2.Date, StrToIntDef(cxTextEdit1.Text, 0));
        2:vLista := TDAOPagar.ReadDataPagamento('Q', cxDateEdit1.Date, cxDateEdit2.Date, StrToIntDef(cxTextEdit1.Text, 0));
      end;
    end;
  end;
  if Assigned(vLista) then
  begin
    cdsRelatorio.DisableControls;
    try
      for i := 0 to vLista.Count - 1 do
      begin
        cdsRelatorio.Append;
        cdsRelatorioDataTitulo.AsDateTime := TPagar(vLista[i]).DataTitulo;
        cdsRelatorioNomeFornecedor.AsString := TPagar(vLista[i]).Fornecedor.Nome;
        cdsRelatorioVencimento.AsDateTime := TPagar(vLista[i]).Vencimento;
        cdsRelatorioValor.AsCurrency := TPagar(vLista[i]).Valor;
        cdsRelatorioStatus.AsString := TPagar(vLista[i]).Status;
        cdsRelatorioDataPagamento.AsDateTime := TPagar(vLista[i]).DataPagamento;
        cdsRelatorioValorPago.AsCurrency := TPagar(vLista[i]).ValorPago;
        cdsRelatorioHistorico.AsString := TPagar(vLista[i]).Historico;
        cdsRelatorio.Post;
      end;
    finally
      cdsRelatorio.EnableControls;
    end;
    case cxRadioGroup1.ItemIndex of
    0:begin
      case cxRadioGroup2.ItemIndex of
      0:ppLabel18.Caption := 'Data do título entre '+DateToStr(cxDateEdit1.Date)+' e '+DateToStr(cxDateEdit2.Date);
      1:ppLabel18.Caption := 'Vencimento entre '+DateToStr(cxDateEdit1.Date)+' e '+DateToStr(cxDateEdit2.Date);
      2:ppLabel18.Caption := 'Pagamento entre '+DateToStr(cxDateEdit1.Date)+' e '+DateToStr(cxDateEdit2.Date);
      end;
        PrintReport(cxLabel1.Caption, ppRelatorio);
      end;
    1:begin
        case cxRadioGroup2.ItemIndex of
        0:ppLabel19.Caption := 'Data do título entre '+DateToStr(cxDateEdit1.Date)+' e '+DateToStr(cxDateEdit2.Date);
        1:ppLabel19.Caption := 'Vencimento entre '+DateToStr(cxDateEdit1.Date)+' e '+DateToStr(cxDateEdit2.Date);
        2:ppLabel19.Caption := 'Pagamento entre '+DateToStr(cxDateEdit1.Date)+' e '+DateToStr(cxDateEdit2.Date);
        end;
        PrintReport(cxLabel1.Caption, ppReport1);
      end;
    end;
  end
  else
    Application.MessageBox('Dados insuficientes!', 'RentControl', MB_ICONWARNING);
end;

procedure TFrm_Rel_ContasAPagar.cxButton1Click(Sender: TObject);
var
  vFornecedor:TFornecedor;
  vCodigo:Integer;
begin
  inherited;
  FormPesquisa := TFormPesquisa.Create(nil);
  FormPesquisa.PreparaPesquisaCliente;
  FormPesquisa.ShowModal;
  vCodigo := FormPesquisa.IDRetorno;
  FormPesquisa.Free;
  if vCodigo > 0 then
  begin
    try
      vFornecedor := TDAOFornecedor.Read(vCodigo);
      cxTextEdit1.Text := IntToStr(vFornecedor.Codigo);
      cxTextEdit2.Text := vFornecedor.Nome;
      cxTextEdit1.SetFocus;
    finally
      vFornecedor.Free;;
    end;
  end;
end;

procedure TFrm_Rel_ContasAPagar.cxRadioGroup1Click(Sender: TObject);
begin
  inherited;
  case cxRadioGroup1.ItemIndex of
  0:
  begin
    cxRadioGroup2.Controls[0].Enabled := True;
    cxRadioGroup2.Controls[1].Enabled := True;
    cxRadioGroup2.Controls[2].Enabled := False;
  end;
  1:
  begin
    cxRadioGroup2.Controls[0].Enabled := True;
    cxRadioGroup2.Controls[1].Enabled := True;
    cxRadioGroup2.Controls[2].Enabled := True;
  end;
  end;
end;

procedure TFrm_Rel_ContasAPagar.cxTextEdit1KeyPress(Sender: TObject;
  var Key: Char);
var
  vFornecedor:TFornecedor;
begin
  if Key = #13 then
  begin
    vFornecedor := nil;
    if (cxTextEdit1.Text = '')then
    begin
      FormPesquisa := TFormPesquisa.Create(nil);
      FormPesquisa.PreparaPesquisaFornecedor;
      FormPesquisa.ShowModal;
      vFornecedor := TDAOFornecedor.Read(FormPesquisa.IDRetorno);
      FormPesquisa.Free;
    end;
    if Assigned(vFornecedor) then
    begin
      cxTextEdit1.Text := IntToStr(vFornecedor.Codigo);
      cxTextEdit2.Text := vFornecedor.Nome;
      FreeAndNil(vFornecedor);
    end
    else
    begin
      vFornecedor := TDAOFornecedor.Read(StrToIntDef(cxTextEdit1.Text, 0));
      if not Assigned(vFornecedor) then
      begin
        cxTextEdit1.SetFocus;
        ShowMessage('Atenção!'+#13+#10+'Fornecedor não encontrado');
      end
      else
      begin
        cxTextEdit2.Text := vFornecedor.Nome;
        vFornecedor.Free;
      end;
    end;
  end;
end;

procedure TFrm_Rel_ContasAPagar.FormShow(Sender: TObject);
begin
  inherited;
  cxDateEdit1.Date := Date;
  cxDateEdit2.Date := Date;
  cxTextEdit1.Clear;
  cxTextEdit2.Clear;
  cxRadioGroup2.Controls[2].Enabled := False;
end;

procedure TFrm_Rel_ContasAPagar.ppImage2Print(Sender: TObject);
begin
  if FileExists(Sys_Dir_Principal+Sys_Arq_Logo) then
    ppImage2.Picture.LoadFromFile(Sys_Dir_Principal+Sys_Arq_Logo);
end;

procedure TFrm_Rel_ContasAPagar.ppShape4Print(Sender: TObject);
begin
  inherited;
  ppShape4.Visible := Odd(cdsRelatorio.RecNo);
end;

end.
