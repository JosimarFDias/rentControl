unit uForm_Rel_ContasReceber;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uform_heranca_diag, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  dxSkinsCore, Vcl.Menus, ppParameter, ppDesignLayer, ppBands, ppCtrls, ppVar,
  ppPrnabl, ppClass, ppCache, ppProd, ppReport, ppComm, ppRelatv, ppDB,
  ppDBPipe, Data.DB, Datasnap.DBClient, Vcl.StdCtrls, cxButtons, cxLabel,
  dxGDIPlusClasses, cxImage, cxGroupBox, Vcl.ExtCtrls, dxBevel, Vcl.ComCtrls,
  dxCore, cxDateUtils, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar,
  cxRadioGroup;

type
  TFrm_Rel_ContasAReceber = class(TFrm_Diag_Heranca)
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
    cdsRelatorioNomeCliente: TStringField;
    cdsRelatorioVencimento: TDateField;
    cdsRelatorioValor: TCurrencyField;
    cdsRelatorioStatus: TStringField;
    cdsRelatorioDataPagamento: TDateField;
    cdsRelatorioValorPago: TCurrencyField;
    cdsRelatorioHistorico: TStringField;
    ppReport1: TppReport;
    ppTitleBand2: TppTitleBand;
    ppLabel8: TppLabel;
    ppSystemVariable3: TppSystemVariable;
    ppImage2: TppImage;
    ppLine11: TppLine;
    ppLine12: TppLine;
    ppLine13: TppLine;
    ppLabel19: TppLabel;
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
    ppLabel15: TppLabel;
    ppDetailBand2: TppDetailBand;
    ppShape4: TppShape;
    ppLine18: TppLine;
    ppLine19: TppLine;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppFooterBand2: TppFooterBand;
    ppLabel14: TppLabel;
    ppSystemVariable4: TppSystemVariable;
    ppSummaryBand2: TppSummaryBand;
    ppLine20: TppLine;
    ppLabel16: TppLabel;
    ppDBCalc1: TppDBCalc;
    ppDesignLayers2: TppDesignLayers;
    ppDesignLayer2: TppDesignLayer;
    ppParameterList2: TppParameterList;
    ppReport2: TppReport;
    ppParameterList3: TppParameterList;
    ppTitleBand3: TppTitleBand;
    ppLabel4: TppLabel;
    ppSystemVariable5: TppSystemVariable;
    ppImage3: TppImage;
    ppLine21: TppLine;
    ppLine22: TppLine;
    ppLine23: TppLine;
    ppLabel18: TppLabel;
    ppHeaderBand3: TppHeaderBand;
    ppShape5: TppShape;
    ppLabel5: TppLabel;
    ppLine24: TppLine;
    ppLine25: TppLine;
    ppLine26: TppLine;
    ppLine27: TppLine;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel17: TppLabel;
    ppLabel20: TppLabel;
    ppDetailBand3: TppDetailBand;
    ppShape6: TppShape;
    ppLine28: TppLine;
    ppLine29: TppLine;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppFooterBand3: TppFooterBand;
    ppLabel21: TppLabel;
    ppSystemVariable6: TppSystemVariable;
    ppSummaryBand3: TppSummaryBand;
    ppLine30: TppLine;
    ppLabel22: TppLabel;
    ppDBCalc2: TppDBCalc;
    ppDesignLayers3: TppDesignLayers;
    ppDesignLayer3: TppDesignLayer;
    procedure cxTextEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure cxButton1Click(Sender: TObject);
    procedure cxbtnConsultarClick(Sender: TObject);
    procedure ppShape4Print(Sender: TObject);
    procedure ppImage2Print(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cxRadioGroup1Click(Sender: TObject);
    procedure ppShape6Print(Sender: TObject);
    procedure ppImage3Print(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_Rel_ContasAReceber: TFrm_Rel_ContasAReceber;

implementation

{$R *.dfm}

uses uC_Cliente, uCDAO_Cliente, uForm_Pesquisa, uCDAO_Receber, uC_Receber,
  uc_Sistema, uUtils;

procedure TFrm_Rel_ContasAReceber.cxbtnConsultarClick(Sender: TObject);
var
  vLista:TList;
  i:Integer;
begin
  inherited;
  TelaEspera('Gerando relatório, aguarde...');
  try
    case cxRadioGroup1.ItemIndex of
    0:
      begin
        case cxRadioGroup2.ItemIndex of
        0:vLista := TDAOReceber.ReadDataTitulo('A', cxDateEdit1.Date, cxDateEdit2.Date, StrToIntDef(cxTextEdit1.Text, 0));
        1:vLista := TDAOReceber.ReadDataVencimento('A', cxDateEdit1.Date, cxDateEdit2.Date, StrToIntDef(cxTextEdit1.Text, 0));
        end;
      end;
    1:
      begin
        case cxRadioGroup2.ItemIndex of
          0:vLista := TDAOReceber.ReadDataTitulo('Q', cxDateEdit1.Date, cxDateEdit2.Date, StrToIntDef(cxTextEdit1.Text, 0));
          1:vLista := TDAOReceber.ReadDataVencimento('Q', cxDateEdit1.Date, cxDateEdit2.Date, StrToIntDef(cxTextEdit1.Text, 0));
          2:vLista := TDAOReceber.ReadDataPagamento('Q', cxDateEdit1.Date, cxDateEdit2.Date, StrToIntDef(cxTextEdit1.Text, 0));
        end;
      end;
    end;
    if Assigned(vLista) then
    begin
      cdsRelatorio.DisableControls;
      cdsRelatorio.EmptyDataSet;
      try
        for i := 0 to vLista.Count - 1 do
        begin
          cdsRelatorio.Append;
          cdsRelatorioDataTitulo.AsDateTime := TReceber(vLista[i]).DataTitulo;
          cdsRelatorioNomeCliente.AsString := TReceber(vLista[i]).Cliente.Nome;
          cdsRelatorioVencimento.AsDateTime := TReceber(vLista[i]).Vencimento;
          cdsRelatorioValor.AsCurrency := TReceber(vLista[i]).Valor;
          cdsRelatorioStatus.AsString := TReceber(vLista[i]).Status;
          cdsRelatorioDataPagamento.AsDateTime := TReceber(vLista[i]).DataPagamento;
          cdsRelatorioValorPago.AsCurrency := TReceber(vLista[i]).ValorPago;
          cdsRelatorioHistorico.AsString := TReceber(vLista[i]).Historico;
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
        2:ppLabel18.Caption := 'Recebimento entre '+DateToStr(cxDateEdit1.Date)+' e '+DateToStr(cxDateEdit2.Date);
        end;
          PrintReport(cxLabel1.Caption, ppReport2);
        end;
      1:begin
          case cxRadioGroup2.ItemIndex of
          0:ppLabel19.Caption := 'Data do título entre '+DateToStr(cxDateEdit1.Date)+' e '+DateToStr(cxDateEdit2.Date);
          1:ppLabel19.Caption := 'Vencimento entre '+DateToStr(cxDateEdit1.Date)+' e '+DateToStr(cxDateEdit2.Date);
          2:ppLabel19.Caption := 'Recebimento entre '+DateToStr(cxDateEdit1.Date)+' e '+DateToStr(cxDateEdit2.Date);
          end;
          PrintReport(cxLabel1.Caption, ppReport1);
        end;
      end;
    end
    else
    begin
      TelaEspera('', False);
      Application.MessageBox('Dados insuficientes!', 'RentControl', MB_ICONWARNING);
    end;
  finally
    TelaEspera('', False);
  end;
end;

procedure TFrm_Rel_ContasAReceber.cxButton1Click(Sender: TObject);
var
  vCliente:TCliente;
  vCodigo:Integer;
begin
  inherited;
  FormPesquisa := TFormPesquisa.Create(nil);
  try
    FormPesquisa.PreparaPesquisaCliente;
    FormPesquisa.ShowModal;
    vCodigo := FormPesquisa.IDRetorno;
  finally
    FormPesquisa.Free;
  end;
  if vCodigo > 0 then
  begin
    vCliente := TDAOCliente.Read(vCodigo);
    if Assigned(vCliente) then
    begin
      try
        cxTextEdit1.Text := IntToStr(vCliente.Codigo);
        cxTextEdit2.Text := vCliente.Nome;
        cxTextEdit1.SetFocus;
      finally
        vCliente.Free;;
      end;
    end;
  end;
end;

procedure TFrm_Rel_ContasAReceber.cxRadioGroup1Click(Sender: TObject);
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

procedure TFrm_Rel_ContasAReceber.cxTextEdit1KeyPress(Sender: TObject;
  var Key: Char);
var
  vCliente:TCliente;
begin
  if Key = #13 then
  begin
    vCliente := nil;
    if (cxTextEdit1.Text = '')then
    begin
      FormPesquisa := TFormPesquisa.Create(nil);
      FormPesquisa.PreparaPesquisaCliente;
      FormPesquisa.ShowModal;
      vCliente := TDAOCliente.Read(FormPesquisa.IDRetorno);
      FormPesquisa.Free;
    end;
    if Assigned(vCliente) then
    begin
      cxTextEdit1.Text := IntToStr(vCliente.Codigo);
      cxTextEdit2.Text := vCliente.Nome;
      FreeAndNil(vCliente);
    end
    else
    begin
      vCliente := TDAOCliente.Read(StrToIntDef(cxTextEdit1.Text, 0));
      if not Assigned(vCliente) then
      begin
        cxTextEdit1.SetFocus;
        ShowMessage('Atenção!'+#13+#10+'Cliente não encontrado');
      end
      else
      begin
        cxTextEdit2.Text := vCliente.Nome;
        vCliente.Free;
      end;
    end;
  end;
end;

procedure TFrm_Rel_ContasAReceber.FormShow(Sender: TObject);
begin
  inherited;
  cxDateEdit1.Date := Date;
  cxDateEdit2.Date := Date;
  cxTextEdit1.Clear;
  cxTextEdit2.Clear;
  cxRadioGroup2.Controls[2].Enabled := False;
end;

procedure TFrm_Rel_ContasAReceber.ppImage2Print(Sender: TObject);
begin
  inherited;
  if FileExists(Sys_Dir_Principal+Sys_Arq_Logo) then
    ppImage2.Picture.LoadFromFile(Sys_Dir_Principal+Sys_Arq_Logo);
end;

procedure TFrm_Rel_ContasAReceber.ppImage3Print(Sender: TObject);
begin
  inherited;
  if FileExists(Sys_Dir_Principal+Sys_Arq_Logo) then
    ppImage1.Picture.LoadFromFile(Sys_Dir_Principal+Sys_Arq_Logo);
end;

procedure TFrm_Rel_ContasAReceber.ppShape4Print(Sender: TObject);
begin
  inherited;
  ppShape4.Visible := Odd(cdsRelatorio.RecNo);
end;

procedure TFrm_Rel_ContasAReceber.ppShape6Print(Sender: TObject);
begin
  inherited;
  ppShape6.Visible := Odd(cdsRelatorio.RecNo);
end;

end.
