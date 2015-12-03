unit uForm_ContasPagar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, LiderLaranja,
  dxSkinLiderMarmore, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue, Vcl.Menus, Vcl.ComCtrls, dxCore,
  cxDateUtils, cxStyles, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxNavigator, Data.DB, cxDBData, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxGridCustomView, cxGrid, cxDropDownEdit, cxCalendar, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, cxTextEdit, cxMaskEdit, cxCalc,
  Vcl.StdCtrls, cxButtons, dxBevel, cxLabel, cxGroupBox, Datasnap.DBClient;

type
  TFormPagar = class(TForm)
    cxGroupBox1: TcxGroupBox;
    cxLabel1: TcxLabel;
    cxGroupBox2: TcxGroupBox;
    dxBevel1: TdxBevel;
    dxBevel2: TdxBevel;
    cxLabel2: TcxLabel;
    lblContasAberto: TcxLabel;
    btnSair: TcxButton;
    cxLabel8: TcxLabel;
    lblContasAtraso: TcxLabel;
    cgbPagamento: TcxGroupBox;
    cxGroupBox8: TcxGroupBox;
    btnConfirmarPagamento: TcxButton;
    cxButton4: TcxButton;
    cxLabel3: TcxLabel;
    cxLabel9: TcxLabel;
    cxCalcEdit1: TcxCalcEdit;
    cxLookupComboBox1: TcxLookupComboBox;
    cxLabel10: TcxLabel;
    cxDateEdit3: TcxDateEdit;
    cxGroupBox3: TcxGroupBox;
    cxGroupBox4: TcxGroupBox;
    cxGroupBox5: TcxGroupBox;
    cxLabel4: TcxLabel;
    cxComboBox1: TcxComboBox;
    cxGroupBox6: TcxGroupBox;
    cxLabel5: TcxLabel;
    cxLabel6: TcxLabel;
    cxDateEdit1: TcxDateEdit;
    cxLabel7: TcxLabel;
    cxDateEdit2: TcxDateEdit;
    btnPesquisar: TcxButton;
    cxGroupBox7: TcxGroupBox;
    btnExcluir: TcxButton;
    btnAlterar: TcxButton;
    btnIncluir: TcxButton;
    btnPagar: TcxButton;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1Vencimento: TcxGridDBColumn;
    cxGrid1DBTableView1Status_Str: TcxGridDBColumn;
    cxGrid1DBTableView1FornecedorNome: TcxGridDBColumn;
    cxGrid1DBTableView1Historico: TcxGridDBColumn;
    cxGrid1DBTableView1Valor: TcxGridDBColumn;
    cxGrid1DBTableView1Status: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    cdsDados: TClientDataSet;
    cdsDadosCodigo: TIntegerField;
    cdsDadosDataTitulo: TDateField;
    cdsDadosVencimento: TDateField;
    cdsDadosValor: TCurrencyField;
    cdsDadosStatus: TStringField;
    cdsDadosStatus_Str: TStringField;
    cdsDadosDataPagamento: TDateField;
    cdsDadosValorPago: TCurrencyField;
    cdsDadosHistorico: TStringField;
    dsDados: TDataSource;
    cdsComboConta: TClientDataSet;
    cdsComboContaCodigo: TIntegerField;
    cdsComboContaDecricao: TStringField;
    dsComboConta: TDataSource;
    cdsDadosFornecedorNome: TStringField;
    cdsDadosFornecedorCodigo: TIntegerField;
    procedure btnIncluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure cdsDadosCalcFields(DataSet: TDataSet);
    procedure btnSairClick(Sender: TObject);
    procedure btnPagarClick(Sender: TObject);
    procedure btnConfirmarPagamentoClick(Sender: TObject);
    procedure cxButton4Click(Sender: TObject);
    procedure cxGrid1DBTableView1CustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure AtualizaTotais;
    procedure CalculaContasEmAberto;
    function ListaContas:Boolean;
  end;

var
  FormPagar: TFormPagar;

implementation

{$R *.dfm}

uses uForm_Cadastro_Pagar, uCDAO_Pagar, uC_Pagar, uCDAO_Conta, uC_Conta;

procedure TFormPagar.AtualizaTotais;
begin
  CalculaContasEmAberto;
end;

procedure TFormPagar.btnAlterarClick(Sender: TObject);
begin
  if cdsDados.IsEmpty then
    Exit;
  if cdsDadosStatus.AsString = 'Q' then
    raise Exception.Create('Não é permitida a alteração de títulos quitados');
  FormCadastroPagar := TFormCadastroPagar.Create(nil);
  try
    FormCadastroPagar.Operacao := 'A';
    FormCadastroPagar.Titulo := cdsDadosCodigo.AsInteger;
    FormCadastroPagar.ShowModal;
    btnPesquisarClick(Sender);
    AtualizaTotais;
  finally
    FormCadastroPagar.Free;
  end;
end;

procedure TFormPagar.btnConfirmarPagamentoClick(Sender: TObject);
var
  vTitulo:TPagar;
begin
  if cxCalcEdit1.Value <= 0 then
  begin
    cxCalcEdit1.SelectAll;
    cxCalcEdit1.SetFocus;
    raise Exception.Create('Favor informar um valor válido!');
  end;
  if cxDateEdit3.Date > Date then
  begin
    cxDateEdit3.Date := Date;
    cxDateEdit3.SetFocus;
    raise Exception.Create('Não é possível pagar um título nesta data!');
  end;
  vTitulo := TDAOPagar.Read(cdsDadosCodigo.AsInteger);
  try
    if vTitulo.Pagar(cdsComboContaCodigo.AsInteger, cxCalcEdit1.Value, cxDateEdit3.Date) then
    begin
      Application.MessageBox('Título pago com sucesso', 'RentControl', MB_ICONASTERISK);
      btnPesquisarClick(Sender);
      AtualizaTotais;
    end
    else
      Application.MessageBox('Erro ao pagar título', 'RentControl', MB_ICONERROR);
  finally
    vTitulo.Free;
    cgbPagamento.Visible := False;
  end;
end;

procedure TFormPagar.btnExcluirClick(Sender: TObject);
var
  vTitulo:TPagar;
begin
  if cdsDados.IsEmpty then
    Exit;
  if cdsDadosStatus.AsString = 'Q' then
    raise Exception.Create('Não é permitida a exclusão de títulos quitados');
  vTitulo := TDAOPagar.Read(cdsDadosCodigo.AsInteger);
  try
    if TDAOPagar.Delete(vTitulo) then
    begin
      Application.MessageBox('Excluido com sucesso', 'RentControl', MB_ICONASTERISK);
      cdsDados.Delete;
      AtualizaTotais;
    end
    else
      Application.MessageBox('Erro ao excluir', 'RentControl', MB_ICONERROR);
  finally
    vTitulo.Free;
  end;
end;

procedure TFormPagar.btnIncluirClick(Sender: TObject);
begin
  FormCadastroPagar := TFormCadastroPagar.Create(nil);
  try
    FormCadastroPagar.Operacao := 'I';
    FormCadastroPagar.ShowModal;
    btnPesquisarClick(Sender);
    AtualizaTotais;
  finally
    FormCadastroPagar.Free;
  end;
end;

procedure TFormPagar.btnPagarClick(Sender: TObject);
begin
  if cdsDados.IsEmpty then
    Exit;
  if cdsDadosStatus.AsString = 'Q' then
    raise Exception.Create('Não é possível pagar títulos já quitados');
  if not ListaContas then
  begin
    Application.MessageBox('Não existem contas cadastradas. Proceda a correção!', 'RentControl', MB_ICONERROR);
    Exit;
  end;
  if not cgbPagamento.Visible then
  begin
    cgbPagamento.Visible := True;
    cxLookupComboBox1.SetFocus;
    cxCalcEdit1.Value := cdsDadosValor.AsCurrency;
    cxDateEdit3.Date := Date;
  end;
end;

procedure TFormPagar.btnPesquisarClick(Sender: TObject);
var
  vLista:TList;
  i: Integer;
begin
  cdsDados.EmptyDataSet;
  case cxComboBox1.ItemIndex of
  0: vLista := TDAOPagar.ReadDataVencimento('A', cxDateEdit1.Date, cxDateEdit2.Date);
  1: vLista := TDAOPagar.ReadDataVencimento('Q', cxDateEdit1.Date, cxDateEdit2.Date);
  2: vLista := TDAOPagar.ReadTodas;
  end;
  if Assigned(vLista) then
  begin
    cdsDados.DisableControls;
    try
      for i := 0 to vLista.Count - 1 do
      begin
        cdsDados.Append;
        cdsDadosCodigo.AsInteger := TPagar(vLista[i]).Codigo;
        cdsDadosDataTitulo.AsDateTime := TPagar(vLista[i]).DataTitulo;
        cdsDadosFornecedorCodigo.AsInteger := TPagar(vLista[i]).Fornecedor.Codigo;
        cdsDadosFornecedorNome.AsString := TPagar(vLista[i]).Fornecedor.Nome;
        cdsDadosVencimento.AsDateTime := TPagar(vLista[i]).Vencimento;
        cdsDadosValor.AsCurrency := TPagar(vLista[i]).Valor;
        cdsDadosStatus.AsString := TPagar(vLista[i]).Status;
        cdsDadosDataPagamento.AsDateTime := TPagar(vLista[i]).DataPagamento;
        cdsDadosValorPago.AsCurrency := TPagar(vLista[i]).ValorPago;
        cdsDadosHistorico.AsString := TPagar(vLista[i]).Historico;
        cdsDados.Post;
      end;
    finally
      cdsDados.EnableControls;
    end;
  end;
end;

procedure TFormPagar.btnSairClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TFormPagar.CalculaContasEmAberto;
var
  vLista:TList;
  i: Integer;
  vTotal, vAtrasadas:Currency;
begin
  vLista := TDAOPagar.ReadAbertas;
  if Assigned(vLista) then
  begin
    vTotal := 0;
    vAtrasadas := 0;
    for i := 0 to vLista.Count - 1 do
    begin
      vTotal := vTotal + TPagar(vLista[i]).Valor;
      if TPagar(vLista[i]).Vencimento <= Date then
        vAtrasadas := vAtrasadas + TPagar(vLista[i]).Valor;
    end;
    lblContasAberto.Caption := 'R$ '+FormatFloat('#0.00', vTotal);
    lblContasAtraso.Caption := 'R$ '+FormatFloat('#0.00', vAtrasadas);
    vLista.Free;
  end
  else
  begin
    lblContasAberto.Caption := 'R$ 0,00';
    lblContasAtraso.Caption := 'R$ 0,00';
  end;
end;

procedure TFormPagar.cdsDadosCalcFields(DataSet: TDataSet);
begin
  if cdsDadosStatus.AsString = 'A' then
    cdsDadosStatus_Str.AsString := 'Aberto'
  else if cdsDadosStatus.AsString = 'Q' then
    cdsDadosStatus_Str.AsString := 'Quitado';
end;

procedure TFormPagar.cxButton4Click(Sender: TObject);
begin
  cgbPagamento.Visible := False;
end;

procedure TFormPagar.cxGrid1DBTableView1CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  if (AViewInfo.Item.Index = 1) then
  begin
    if ((AViewInfo.GridRecord.Values[cxGrid1DBTableView1Status.Index] = 'A') and
       (AViewInfo.GridRecord.Values[cxGrid1DBTableView1Vencimento.Index] <= Date)) then
      ACanvas.Font.Color := clRed;
  end;
end;

procedure TFormPagar.FormCreate(Sender: TObject);
begin
  cdsDados.CreateDataSet;
  cdsComboConta.CreateDataSet;
end;

procedure TFormPagar.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_RETURN) then
  begin
    Perform (CM_DIALOGKEY, VK_TAB, 0);
  end
  else if (Key = VK_ESCAPE) then
    Perform(WM_NEXTDLGCTL,1,0);
end;

procedure TFormPagar.FormShow(Sender: TObject);
begin
  cxDateEdit1.Date := Date;
  cxDateEdit2.Date := Date;
  AtualizaTotais;
end;

function TFormPagar.ListaContas: Boolean;
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
