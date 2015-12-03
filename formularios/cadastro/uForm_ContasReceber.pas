unit uForm_ContasReceber;

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
  dxSkinWhiteprint, dxSkinXmas2008Blue, Vcl.ComCtrls, dxCore, cxDateUtils,
  Vcl.Menus, cxStyles, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxNavigator, Data.DB, cxDBData, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, Vcl.StdCtrls, cxButtons, cxDropDownEdit, cxCalendar, cxTextEdit,
  cxMaskEdit, dxBevel, cxLabel, cxGroupBox, Datasnap.DBClient, cxCalc,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox;

type
  TFormReceber = class(TForm)
    cxGroupBox1: TcxGroupBox;
    cxLabel1: TcxLabel;
    cxGroupBox2: TcxGroupBox;
    cxLabel2: TcxLabel;
    lblContasAberto: TcxLabel;
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
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cdsDados: TClientDataSet;
    cdsDadosCodigo: TIntegerField;
    cdsDadosDataTitulo: TDateField;
    cdsDadosClienteCodigo: TIntegerField;
    cdsDadosClienteNome: TStringField;
    cdsDadosVencimento: TDateField;
    cdsDadosValor: TCurrencyField;
    cdsDadosStatus: TStringField;
    cdsDadosStatus_Str: TStringField;
    cdsDadosDataPagamento: TDateField;
    cdsDadosValorPago: TCurrencyField;
    cdsDadosHistorico: TStringField;
    dsDados: TDataSource;
    cxGrid1DBTableView1ClienteNome: TcxGridDBColumn;
    cxGrid1DBTableView1Vencimento: TcxGridDBColumn;
    cxGrid1DBTableView1Valor: TcxGridDBColumn;
    cxGrid1DBTableView1Status: TcxGridDBColumn;
    cxGrid1DBTableView1Status_Str: TcxGridDBColumn;
    btnSair: TcxButton;
    dxBevel1: TdxBevel;
    cxLabel8: TcxLabel;
    dxBevel2: TdxBevel;
    lblContasAtraso: TcxLabel;
    btnReceber: TcxButton;
    cgbRecebimento: TcxGroupBox;
    cxGroupBox8: TcxGroupBox;
    cxLabel3: TcxLabel;
    cxLabel9: TcxLabel;
    cxCalcEdit1: TcxCalcEdit;
    cxLookupComboBox1: TcxLookupComboBox;
    cdsComboConta: TClientDataSet;
    dsComboConta: TDataSource;
    cdsComboContaCodigo: TIntegerField;
    cdsComboContaDecricao: TStringField;
    btnConfirmarRecebimento: TcxButton;
    cxButton4: TcxButton;
    cxGrid1DBTableView1Historico: TcxGridDBColumn;
    cxLabel10: TcxLabel;
    cxDateEdit3: TcxDateEdit;
    procedure btnIncluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure cdsDadosCalcFields(DataSet: TDataSet);
    procedure btnSairClick(Sender: TObject);
    procedure btnReceberClick(Sender: TObject);
    procedure btnConfirmarRecebimentoClick(Sender: TObject);
    procedure cxButton4Click(Sender: TObject);
    procedure cxGrid1DBTableView1CustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
    procedure AtualizaTotais;
    procedure CalculaContasEmAberto;
    function ListaContas:Boolean;
  public
    { Public declarations }
  end;

var
  FormReceber: TFormReceber;

implementation

{$R *.dfm}

uses uForm_Cadastro_Receber, uCDAO_Receber, uC_Receber, uCDAO_Conta, uC_Conta;

procedure TFormReceber.AtualizaTotais;
begin
  CalculaContasEmAberto;
end;

procedure TFormReceber.CalculaContasEmAberto;
var
  vLista:TList;
  i: Integer;
  vTotal, vAtrasadas:Currency;
begin
  vLista := TDAOReceber.ReadAbertas;
  if Assigned(vLista) then
  begin
    vTotal := 0;
    vAtrasadas := 0;
    for i := 0 to vLista.Count - 1 do
    begin
      vTotal := vTotal + TReceber(vLista[i]).Valor;
      if TReceber(vLista[i]).Vencimento <= Date then
        vAtrasadas := vAtrasadas + TReceber(vLista[i]).Valor;
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

procedure TFormReceber.cdsDadosCalcFields(DataSet: TDataSet);
begin
  if cdsDadosStatus.AsString = 'A' then
    cdsDadosStatus_Str.AsString := 'Aberto'
  else if cdsDadosStatus.AsString = 'Q' then
    cdsDadosStatus_Str.AsString := 'Quitado';
end;

procedure TFormReceber.cxButton4Click(Sender: TObject);
begin
  cgbRecebimento.Visible := False;
end;

procedure TFormReceber.cxGrid1DBTableView1CustomDrawCell(
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

procedure TFormReceber.btnPesquisarClick(Sender: TObject);
var
  vLista:TList;
  i: Integer;
begin
  cdsDados.EmptyDataSet;
  case cxComboBox1.ItemIndex of
  0: vLista := TDAOReceber.ReadDataVencimento('A', cxDateEdit1.Date, cxDateEdit2.Date);
  1: vLista := TDAOReceber.ReadDataVencimento('Q', cxDateEdit1.Date, cxDateEdit2.Date);
  2: vLista := TDAOReceber.ReadTodas;
  end;
  if Assigned(vLista) then
  begin
    cdsDados.DisableControls;
    try
      for i := 0 to vLista.Count - 1 do
      begin
        cdsDados.Append;
        cdsDadosCodigo.AsInteger := TReceber(vLista[i]).Codigo;
        cdsDadosDataTitulo.AsDateTime := TReceber(vLista[i]).DataTitulo;
        cdsDadosClienteCodigo.AsInteger := TReceber(vLista[i]).Cliente.Codigo;
        cdsDadosClienteNome.AsString := TReceber(vLista[i]).Cliente.Nome;
        cdsDadosVencimento.AsDateTime := TReceber(vLista[i]).Vencimento;
        cdsDadosValor.AsCurrency := TReceber(vLista[i]).Valor;
        cdsDadosStatus.AsString := TReceber(vLista[i]).Status;
        cdsDadosDataPagamento.AsDateTime := TReceber(vLista[i]).DataPagamento;
        cdsDadosValorPago.AsCurrency := TReceber(vLista[i]).ValorPago;
        cdsDadosHistorico.AsString := TReceber(vLista[i]).Historico;
        cdsDados.Post;
      end;
    finally
      cdsDados.EnableControls;
    end;
  end;
end;

procedure TFormReceber.btnReceberClick(Sender: TObject);
begin
  if cdsDados.IsEmpty then
    Exit;
  if cdsDadosStatus.AsString = 'Q' then
    raise Exception.Create('Não é possível receber títulos já quitados');
  if not ListaContas then
  begin
    Application.MessageBox('Não existem contas cadastradas. Proceda a correção!', 'RentControl', MB_ICONERROR);
    Exit;
  end;
  if not cgbRecebimento.Visible then
  begin
    cgbRecebimento.Visible := True;
    cxLookupComboBox1.SetFocus;
    cxCalcEdit1.Value := cdsDadosValor.AsCurrency;
    cxDateEdit3.Date := Date;
  end;
end;

procedure TFormReceber.btnExcluirClick(Sender: TObject);
var
  vTitulo:TReceber;
begin
  if cdsDados.IsEmpty then
    Exit;
  if cdsDadosStatus.AsString = 'Q' then
    raise Exception.Create('Não é permitida a exclusão de títulos quitados');
  vTitulo := TDAOReceber.Read(cdsDadosCodigo.AsInteger);
  try
    if TDAOReceber.Delete(vTitulo) then
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

procedure TFormReceber.btnAlterarClick(Sender: TObject);
begin
  if cdsDados.IsEmpty then
    Exit;
  if cdsDadosStatus.AsString = 'Q' then
    raise Exception.Create('Não é permitida a alteração de títulos quitados');
  FormCadastroReceber := TFormCadastroReceber.Create(nil);
  try
    FormCadastroReceber.Operacao := 'A';
    FormCadastroReceber.Titulo := cdsDadosCodigo.AsInteger;
    FormCadastroReceber.ShowModal;
    btnPesquisarClick(Sender);
    AtualizaTotais;
  finally
    FormCadastroReceber.Free;
  end;
end;

procedure TFormReceber.btnConfirmarRecebimentoClick(Sender: TObject);
var
  vTitulo:TReceber;
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
    raise Exception.Create('Não é possível receber um título nesta data!');
  end;
  vTitulo := TDAOReceber.Read(cdsDadosCodigo.AsInteger);
  try
    if vTitulo.Receber(cdsComboContaCodigo.AsInteger, cxCalcEdit1.Value, cxDateEdit3.Date) then
    begin
      Application.MessageBox('Título recebido com sucesso', 'RentControl', MB_ICONASTERISK);
      btnPesquisarClick(Sender);
      AtualizaTotais;
    end
    else
      Application.MessageBox('Erro ao receber título', 'RentControl', MB_ICONERROR);
  finally
    vTitulo.Free;
    cgbRecebimento.Visible := False;
  end;
end;

procedure TFormReceber.btnIncluirClick(Sender: TObject);
begin
  FormCadastroReceber := TFormCadastroReceber.Create(nil);
  try
    FormCadastroReceber.Operacao := 'I';
    FormCadastroReceber.ShowModal;
    btnPesquisarClick(Sender);
    AtualizaTotais;
  finally
    FormCadastroReceber.Free;
  end;
end;

procedure TFormReceber.btnSairClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TFormReceber.FormCreate(Sender: TObject);
begin
  cdsDados.CreateDataSet;
  cdsComboConta.CreateDataSet;
end;

procedure TFormReceber.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_RETURN) then
  begin
    Perform (CM_DIALOGKEY, VK_TAB, 0);
  end
  else if (Key = VK_ESCAPE) then
    Perform(WM_NEXTDLGCTL,1,0);
end;

procedure TFormReceber.FormShow(Sender: TObject);
begin
  cxDateEdit1.Date := Date;
  cxDateEdit2.Date := Date;
  AtualizaTotais;
end;

function TFormReceber.ListaContas:Boolean;
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
