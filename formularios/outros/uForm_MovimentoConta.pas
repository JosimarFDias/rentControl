unit uForm_MovimentoConta;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, Vcl.Menus, Vcl.StdCtrls, cxButtons, Vcl.DBCtrls,
  Vcl.ComCtrls, cxLabel, Vcl.ExtCtrls, dxSkinscxPCPainter, cxPCdxBarPopupMenu,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator, Data.DB,
  cxDBData, cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxPC, cxMaskEdit, cxDropDownEdit,
  cxCalc, cxTextEdit, Datasnap.DBClient, dxCore, cxDateUtils, cxCalendar,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox;

type
  TFormMovimentoConta = class(TForm)
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxButton1: TcxButton;
    Panel1: TPanel;
    cxButton2: TcxButton;
    cxButton3: TcxButton;
    cxButton4: TcxButton;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    Panel2: TPanel;
    cxPageControl1: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    cxTabSheet2: TcxTabSheet;
    cxTabSheet3: TcxTabSheet;
    Panel3: TPanel;
    cxButton5: TcxButton;
    cxButton6: TcxButton;
    cxTextEdit1: TcxTextEdit;
    cxButton7: TcxButton;
    cxTextEdit2: TcxTextEdit;
    cxCalcEdit1: TcxCalcEdit;
    cxTextEdit3: TcxTextEdit;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    cxLabel6: TcxLabel;
    cxLabel7: TcxLabel;
    cxLabel8: TcxLabel;
    cxLabel9: TcxLabel;
    cxTextEdit4: TcxTextEdit;
    cxButton8: TcxButton;
    cxTextEdit5: TcxTextEdit;
    cxLabel10: TcxLabel;
    cxTextEdit6: TcxTextEdit;
    cxCalcEdit2: TcxCalcEdit;
    cxLabel11: TcxLabel;
    cxLabel12: TcxLabel;
    cxLabel13: TcxLabel;
    cdsContaPesquisa: TClientDataSet;
    cdsContaPesquisacodigo: TIntegerField;
    cdsContaPesquisadescricao: TStringField;
    dsContaPesquisa: TDataSource;
    cdsPesquisa: TClientDataSet;
    cdsPesquisacodigo: TIntegerField;
    cdsPesquisadata: TDateField;
    cdsPesquisahistorico: TStringField;
    cdsPesquisatipo: TStringField;
    cdsPesquisavalor: TFloatField;
    cdsPesquisasaldofinal: TFloatField;
    dsPesquisa: TDataSource;
    cxGrid1DBTableView1data: TcxGridDBColumn;
    cxGrid1DBTableView1historico: TcxGridDBColumn;
    cxGrid1DBTableView1tipo: TcxGridDBColumn;
    cxGrid1DBTableView1valor: TcxGridDBColumn;
    cxGrid1DBTableView1saldofinal: TcxGridDBColumn;
    cxLabel14: TcxLabel;
    cxLabel15: TcxLabel;
    cxLabel16: TcxLabel;
    cxCalcEdit3: TcxCalcEdit;
    cdsContaDestino: TClientDataSet;
    dsContaDestino: TDataSource;
    cdsContaDestinocodigo: TIntegerField;
    cdsContaDestinodescricao: TStringField;
    cxDateEdit1: TcxDateEdit;
    cxDateEdit2: TcxDateEdit;
    cxDateEdit3: TcxDateEdit;
    cxDateEdit4: TcxDateEdit;
    cxDBLookupComboBox1: TcxDBLookupComboBox;
    cxDBLookupComboBox2: TcxDBLookupComboBox;
    ClientDataSet1: TClientDataSet;
    ClientDataSet2: TClientDataSet;
    ClientDataSet1codigo: TIntegerField;
    ClientDataSet2codigo: TIntegerField;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    procedure FormShow(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure cxButton3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cxButton4Click(Sender: TObject);
    procedure cxButton5Click(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure cxGrid1DBTableView1valorCustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure cxGrid1DBTableView1CustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cxButton6Click(Sender: TObject);
    procedure DBLookupComboBox1CloseUp(Sender: TObject);
  private
    FTipoMovimento: string;
    { Private declarations }
    procedure Pesquisa;
    procedure LimpaEdits;
    procedure ListaContas;
    procedure ListaContasDestino;
    procedure SetTipoMovimento(const Value: string);
    property TipoMovimento:string read FTipoMovimento write SetTipoMovimento;
  public
    { Public declarations }
  end;

var
  FormMovimentoConta: TFormMovimentoConta;

implementation

{$R *.dfm}

uses uCDAO_Conta, uC_Conta, uC_MovimentoConta, uCDAO_MovimentoConta, uc_Sistema;

procedure TFormMovimentoConta.cxButton1Click(Sender: TObject);
begin
  Pesquisa;
end;

procedure TFormMovimentoConta.cxButton2Click(Sender: TObject);
begin
  LimpaEdits;
  Panel2.Visible := True;
  cxPageControl1.ActivePageIndex := 0;
  cxTextEdit3.SetFocus;
  Self.TipoMovimento := 'E';
end;

procedure TFormMovimentoConta.cxButton3Click(Sender: TObject);
begin
  LimpaEdits;
  Panel2.Visible := True;
  cxPageControl1.ActivePageIndex := 1;
  cxTextEdit6.SetFocus;
  Self.TipoMovimento := 'S';
end;

procedure TFormMovimentoConta.cxButton4Click(Sender: TObject);
begin
  LimpaEdits;
  ListaContasDestino;
  if cdsContaDestino.RecordCount = 1 then
  begin
    Application.MessageBox('Para realiza transferências é necessário que haja 2 ou mais contas cadastradas', 'RentControl', MB_ICONERROR);
    Exit;
  end;
  cdsContaDestino.First;
  cdsContaDestino.Next;
  ClientDataSet2codigo.AsInteger := cdsContaDestinocodigo.AsInteger;
  Panel2.Visible := True;
  cxPageControl1.ActivePageIndex := 2;
  cxDBLookupComboBox2.SetFocus;
  Self.TipoMovimento := 'T';
end;

procedure TFormMovimentoConta.cxButton5Click(Sender: TObject);
var
  vMovimento:TMovimentoConta;
  vConta:TConta;
begin
  if Self.TipoMovimento = 'E' then
  begin
    if cxCalcEdit1.Value <= 0 then
    begin
      Application.MessageBox('Informe um valor válido para realizar a operação!', 'RentConrtol', MB_ICONEXCLAMATION);
      cxCalcEdit1.SetFocus;
      Exit;
    end;
    if cxTextEdit3.Text = '' then
    begin
      Application.MessageBox('É necessário informar o histórico desta entrada!', 'RentConrtol', MB_ICONEXCLAMATION);
      cxTextEdit3.SetFocus;
      Exit;
    end;
    vMovimento := TMovimentoConta.Create;
    try
      vMovimento.Codigo := 0;
      vMovimento.Data := cxDateEdit3.Date;
      vMovimento.CodConta := cxDBLookupComboBox1.EditValue;
      vMovimento.Tipo := 'C';
      vMovimento.Historico := cxTextEdit3.Text;
      vMovimento.ValorMovimento := cxCalcEdit1.Value;
      vMovimento.SaldoFinal := 0;
      vMovimento.MovimentoOrigem := 'M';
      vMovimento.CodigoMovimentoOrigem := 0;
      if TDAO_MovimentoConta.Create(vMovimento) then
        Application.MessageBox('Salvo com sucesso!', 'RentControl', MB_ICONASTERISK)
      else
        Application.MessageBox('Erro ao gravar!', 'RentControl', MB_ICONERROR);
    finally
      vMovimento.Free;
    end;
  end
  else if Self.TipoMovimento = 'S' then
  begin
    if cxCalcEdit2.Value <= 0 then
    begin
      Application.MessageBox('Informe um valor válido para realizar a opereção!', 'RentConrtol', MB_ICONEXCLAMATION);
      cxCalcEdit2.SetFocus;
      Exit;
    end;
    if cxTextEdit6.Text = '' then
    begin
      Application.MessageBox('É necessário informar o histórico desta saída!', 'RentConrtol', MB_ICONEXCLAMATION);
      cxTextEdit6.SetFocus;
      Exit;
    end;
    vConta := TConta.Create;
    try
      vConta := TDAO_Conta.Read(StrToInt(cxDBLookupComboBox1.EditValue));
      if vConta.SaldoAtual < cxCalcEdit2.Value then
      begin
        Application.MessageBox(PWideChar('Saldo insuficiente para realizar este lançamento!'+#13+#10+
                                         'Saldo Atual: '+FormatFloat('R$#0.00', vConta.SaldoAtual)), 'RentControl', MB_ICONWARNING);
        cxCalcEdit2.SetFocus;
        Exit;
      end;
    finally
      vConta.Free;
    end;
    vMovimento := TMovimentoConta.Create;
    try
      vMovimento.Codigo := 0;
      vMovimento.Data := cxDateEdit4.Date;
      vMovimento.CodConta := cxDBLookupComboBox1.EditValue;
      vMovimento.Tipo := 'D';
      vMovimento.Historico := cxTextEdit6.Text;
      vMovimento.ValorMovimento := cxCalcEdit2.Value;
      vMovimento.SaldoFinal := 0;
      vMovimento.MovimentoOrigem := 'M';
      vMovimento.CodigoMovimentoOrigem := 0;
      if TDAO_MovimentoConta.Create(vMovimento) then
        Application.MessageBox('Salvo com sucesso!', 'RentControl', MB_ICONASTERISK)
      else
        Application.MessageBox('Erro ao gravar!', 'RentControl', MB_ICONERROR);
    finally
      vMovimento.Free;
    end;
  end
  else if Self.TipoMovimento = 'T' then
  begin
    if cxDBLookupComboBox1.EditValue = cxDBLookupComboBox2.EditValue then
    begin
      Application.MessageBox('Selecione uma conta de destino diferente da de origem!', 'RentConrtol', MB_ICONEXCLAMATION);
      cxDBLookupComboBox2.SetFocus;
      Exit;
    end;
    if cxCalcEdit3.Value <= 0 then
    begin
      Application.MessageBox('Informe um valor válido para realizar a transferência!', 'RentConrtol', MB_ICONEXCLAMATION);
      cxCalcEdit3.SetFocus;
      Exit;
    end;
    vConta := TConta.Create;
    try
      vConta := TDAO_Conta.Read(StrToInt(cxDBLookupComboBox1.EditValue));
      if vConta.SaldoAtual < cxCalcEdit3.Value then
      begin
        Application.MessageBox(PWideChar('Saldo insuficiente para realizar este lançamento!'+#13+#10+
                                         'Saldo Atual: '+FormatFloat('R$#0.00', vConta.SaldoAtual)), 'RentControl', MB_ICONWARNING);
        cxCalcEdit3.SetFocus;
        Exit;
      end;
    finally
      vConta.Free;
    end;
    vMovimento := TMovimentoConta.Create;
    try
      vMovimento.Codigo := 0;
      vMovimento.Data := Date;
      vMovimento.CodConta := cxDBLookupComboBox1.EditValue;
      vMovimento.Tipo := 'D';
      vMovimento.Historico := 'TRANSFERÊNCIA PARA A CONTA '+cxDBLookupComboBox2.Text;
      vMovimento.ValorMovimento := cxCalcEdit3.Value;
      vMovimento.SaldoFinal := 0;
      vMovimento.MovimentoOrigem := 'M';
      vMovimento.CodigoMovimentoOrigem := 0;
      if TDAO_MovimentoConta.Create(vMovimento) then
      begin
        vMovimento.CodigoMovimentoOrigem := vMovimento.Codigo;
        vMovimento.Codigo := 0;
        vMovimento.Data := Date;
        vMovimento.CodConta := cxDBLookupComboBox2.EditValue;
        vMovimento.Tipo := 'C';
        vMovimento.Historico := 'TRANSFERÊNCIA DA CONTA '+cxDBLookupComboBox1.Text;
        vMovimento.ValorMovimento := cxCalcEdit3.Value;
        vMovimento.SaldoFinal := 0;
        vMovimento.MovimentoOrigem := 'T';
        TDAO_MovimentoConta.Create(vMovimento);
        Application.MessageBox('Salvo com sucesso!', 'RentControl', MB_ICONASTERISK)
      end
      else
        Application.MessageBox('Erro ao gravar!', 'RentControl', MB_ICONERROR);
    finally
      vMovimento.Free;
    end;
  end;
  Panel2.Visible := False;
  Pesquisa;
end;

procedure TFormMovimentoConta.cxButton6Click(Sender: TObject);
begin
  Panel2.Visible := False;
  Pesquisa;
end;

procedure TFormMovimentoConta.cxGrid1DBTableView1CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  if (AViewInfo.Item.Index = cxGrid1DBTableView1tipo.Index)then
  begin
    if AViewInfo.Text = 'D' then
      ACanvas.Font.Color := clRed
    else
      ACanvas.Font.Color := clBlue;
  end
  else if (AViewInfo.Item.Index = cxGrid1DBTableView1valor.Index)then
  begin
    if (AViewInfo.GridRecord.Values[cxGrid1DBTableView1tipo.Index] = 'D') then
      ACanvas.Font.Color := clRed
    else
      ACanvas.Font.Color := clBlue;
  end
  else if (AViewInfo.Item.Index = cxGrid1DBTableView1saldofinal.Index)then
  begin
    if (AViewInfo.GridRecord.Values[cxGrid1DBTableView1saldofinal.Index] <= 0) then
      ACanvas.Font.Color := clRed
    else
      ACanvas.Font.Color := clBlue;
  end;
end;

procedure TFormMovimentoConta.cxGrid1DBTableView1valorCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  if AViewInfo.Text = 'D' then
    ACanvas.Font.Color := clRed
  else
    ACanvas.Font.Color := clBlue;
end;

procedure TFormMovimentoConta.DBLookupComboBox1CloseUp(Sender: TObject);
begin
  Pesquisa;
end;

procedure TFormMovimentoConta.FormCreate(Sender: TObject);
begin
  cdsContaPesquisa.CreateDataSet;
  cdsPesquisa.CreateDataSet;
  cdsContaDestino.CreateDataSet;
  ClientDataSet1.CreateDataSet;
  ClientDataSet1.Append;
  ClientDataSet2.CreateDataSet;
  ClientDataSet2.Append;
end;

procedure TFormMovimentoConta.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_RETURN) then
    Perform (CM_DIALOGKEY, VK_TAB, 0)
  else if (Key = VK_ESCAPE) then
    Perform(WM_NEXTDLGCTL,1,0);
end;

procedure TFormMovimentoConta.FormShow(Sender: TObject);
begin
  cxDateEdit1.Date := Date - 7;
  cxDateEdit2.Date := Date;
  ListaContas;
  cdsContaPesquisa.First;
  cxDBLookupComboBox1.EditValue := cdsContaPesquisacodigo.AsInteger;
  Pesquisa;
end;

procedure TFormMovimentoConta.LimpaEdits;
begin
  cxDateEdit3.Date := Date;
  cxTextEdit1.Clear;
  cxTextEdit2.Clear;
  cxTextEdit3.Clear;
  cxCalcEdit1.Text := 'R$0,00';
  cxDateEdit4.Date := Date;
  cxTextEdit4.Clear;
  cxTextEdit5.Clear;
  cxTextEdit6.Clear;
  cxCalcEdit2.Text := 'R$0,00';
  cxDBLookupComboBox2.EditValue := Null;
  cxCalcEdit3.Text := 'R$0,00';
end;

procedure TFormMovimentoConta.ListaContas;
var
  vLista:TList;
  i: Integer;
begin
  cdsContaPesquisa.EmptyDataSet;
  vLista := TDAO_Conta.Read('%');
  if Assigned(vLista) then
  begin
    for i := 0 to vLista.Count - 1 do
    begin
      cdsContaPesquisa.Append;
      cdsContaPesquisacodigo.AsInteger := TConta(vLista[i]).Codigo;
      cdsContaPesquisadescricao.AsString := TConta(vLista[i]).Descricao;
      cdsContaPesquisa.Post;
    end;
    vLista.Free;
  end;
end;

procedure TFormMovimentoConta.ListaContasDestino;
var
  vLista:TList;
  i: Integer;
begin
  cdsContaDestino.EmptyDataSet;
  vLista := TDAO_Conta.Read('%');
  if Assigned(vLista) then
  begin
    for i := 0 to vLista.Count - 1 do
    begin
      cdsContaDestino.Append;
      cdsContaDestinocodigo.AsInteger := TConta(vLista[i]).Codigo;
      cdsContaDestinodescricao.AsString := TConta(vLista[i]).Descricao;
      cdsContaDestino.Post;
    end;
    vLista.Free;
  end;
end;

procedure TFormMovimentoConta.Pesquisa;
var
  vLista:TList;
  i: Integer;
begin
  with TDAO_Conta.Read(Integer(cxDBLookupComboBox1.EditValue)) do
  begin
    try
      if ((Administrador) and (Sistema.UsuarioLogado.Nivel <> 1))then
      begin
        cxDBLookupComboBox1.EditValue := 1;
        raise Exception.Create('Usuário não habilitado para esta conta');
      end;
    finally
      Free;
    end;
  end;
  cdsPesquisa.EmptyDataSet;
  vLista := TDAO_MovimentoConta.Read(cxDateEdit1.Date, cxDateEdit2.Date, cxDBLookupComboBox1.EditValue);
  if Assigned(vLista) then
  begin
    cdsPesquisa.DisableControls;
    try
      for i := 0 to vLista.Count - 1 do
      begin
        cdsPesquisa.Append;
        cdsPesquisacodigo.AsInteger := TMovimentoConta(vLista[i]).Codigo;
        cdsPesquisadata.AsDateTime := TMovimentoConta(vLista[i]).Data;
        cdsPesquisahistorico.AsString := TMovimentoConta(vLista[i]).Historico;
        cdsPesquisatipo.AsString := TMovimentoConta(vLista[i]).Tipo;
        cdsPesquisavalor.AsFloat := TMovimentoConta(vLista[i]).ValorMovimento;
        cdsPesquisasaldofinal.AsFloat := TMovimentoConta(vLista[i]).SaldoFinal;
        cdsPesquisa.Post;
      end;
      cdsPesquisa.Last;
    finally
      cdsPesquisa.EnableControls;
      vLista.Free;
    end;
  end;
  cxGrid1.SetFocus;
end;

procedure TFormMovimentoConta.SetTipoMovimento(const Value: string);
begin
  FTipoMovimento := Value;
end;

end.
