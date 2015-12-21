unit uForm_Cadastro_Conta;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, dxSkinscxPCPainter, cxPCdxBarPopupMenu, cxContainer,
  cxEdit, Vcl.Menus, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, Data.DB, cxDBData, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls,
  cxGroupBox, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid, cxRadioGroup,
  cxButtons, cxTextEdit, Vcl.ExtCtrls, cxPC, Datasnap.DBClient, uC_Conta,
  cxCheckBox, cxDBEdit;

type
  TFormCadastroConta = class(TForm)
    cxPageControl1: TcxPageControl;
    tabPesquisa: TcxTabSheet;
    pnlPesquisa: TPanel;
    edtPesquisa: TcxTextEdit;
    btnPesquisar: TcxButton;
    rgFiltro: TcxRadioGroup;
    pnlBotoesRegistro: TPanel;
    btnFechar: TcxButton;
    btnIncluir: TcxButton;
    btnAlterar: TcxButton;
    btnExcluir: TcxButton;
    gridPesquisa: TcxGrid;
    gridPesquisaDBTableView1: TcxGridDBTableView;
    gridPesquisaLevel1: TcxGridLevel;
    tabDados: TcxTabSheet;
    pnlBotoesEdicao: TPanel;
    btnGravar: TcxButton;
    btnCancelar: TcxButton;
    cxGroupBox1: TcxGroupBox;
    Label3: TLabel;
    Label2: TLabel;
    Label1: TLabel;
    cdsPesquisa: TClientDataSet;
    dsPesquisa: TDataSource;
    cdsDados: TClientDataSet;
    cdsDadosCodigo: TIntegerField;
    cdsDadosNome: TStringField;
    dsDados: TDataSource;
    cdsDadosSaldo: TFloatField;
    cdsPesquisaCodigo: TIntegerField;
    cdsPesquisaDescricao: TStringField;
    cdsPesquisaSaldo: TFloatField;
    gridPesquisaDBTableView1Codigo: TcxGridDBColumn;
    gridPesquisaDBTableView1Descricao: TcxGridDBColumn;
    gridPesquisaDBTableView1Saldo: TcxGridDBColumn;
    cdsDadosAdministrador: TBooleanField;
    cxDBCheckBox1: TcxDBCheckBox;
    cxDBTextEdit1: TcxDBTextEdit;
    cxDBTextEdit2: TcxDBTextEdit;
    cxDBTextEdit3: TcxDBTextEdit;
    procedure btnAlterarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure tabDadosShow(Sender: TObject);
    procedure cxPageControl1PageChanging(Sender: TObject; NewPage: TcxTabSheet;
      var AllowChange: Boolean);
    procedure gridPesquisaDBTableView1DblClick(Sender: TObject);
  private
    FOperacao: TOperacaoConta;
    procedure SetOperacao(const Value: TOperacaoConta);
    { Private declarations }
    property Operacao:TOperacaoConta read FOperacao write SetOperacao;
    procedure Pesquisa;
  public
    { Public declarations }
  end;

var
  FormCadastroConta: TFormCadastroConta;

implementation

{$R *.dfm}

uses uCDAO_Conta, uc_Sistema;

procedure TFormCadastroConta.btnAlterarClick(Sender: TObject);
var
  vConta:TConta;
begin
  if cdsPesquisa.IsEmpty then
    Exit;
  cdsDados.EmptyDataSet;
  cdsDados.Append;
  vConta := TDAO_Conta.Read(cdsPesquisaCodigo.AsInteger);
  try
    if ((vConta.Administrador) and (Sistema.UsuarioLogado.Nivel <> 1)) then
      raise Exception.Create('Usuário não habilitado para esta operação');
    cdsDadosCodigo.AsInteger        := vConta.Codigo;
    cdsDadosNome.AsString           := vConta.Descricao;
    cdsDadosSaldo.AsFloat           := vConta.SaldoAtual;
    cdsDadosAdministrador.AsBoolean := vConta.Administrador;
  finally
    vConta.Free;
  end;
  Operacao := ocAlterar;
  cxPageControl1.ActivePage := tabDados;
  cxDBTextEdit2.SetFocus;
end;

procedure TFormCadastroConta.btnCancelarClick(Sender: TObject);
begin
  cxPageControl1.ActivePage := tabPesquisa;
  cdsDados.EmptyDataSet;
  Pesquisa;
end;

procedure TFormCadastroConta.btnExcluirClick(Sender: TObject);
var
  vConta:TConta;
begin
  if cdsPesquisa.IsEmpty then
    Exit;
  vConta := TDAO_Conta.Read(cdsPesquisacodigo.AsInteger);
  try
    if ((vConta.Administrador) and (Sistema.UsuarioLogado.Nivel <> 1)) then
      raise Exception.Create('Usuário não habilitado para esta operação');
    if TDAO_Conta.ExisteMovimento(vConta.Codigo) then
      raise Exception.Create('Esta conta não pode ser excluida pois possui histórico de movimentação');
    Self.Operacao := ocExcluir;
    if not TDAO_Conta.Delete(vConta) then
      Application.MessageBox('Erro ao excluir a conta', 'Erro', MB_ICONERROR)
    else
      cdsPesquisa.Delete;
  finally
    vConta.Free;
    Self.Operacao := ocSemOperacao;
  end;
end;

procedure TFormCadastroConta.btnFecharClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TFormCadastroConta.btnGravarClick(Sender: TObject);
var
  vConta:TConta;
begin
  if Self.Operacao = ocAlterar then
    vConta := TDAO_Conta.Read(cdsDadosCodigo.AsInteger)
  else
    vConta := TConta.Create;
  try
    vConta.Codigo     := cdsDadoscodigo.AsInteger;
    vConta.Descricao  := cdsDadosNome.AsString;
    vConta.SaldoAtual := cdsDadosSaldo.AsFloat;
    if TDAO_Conta.Create(vConta) then
    begin
      Application.MessageBox('Salvo com sucesso', 'OK', MB_ICONASTERISK);
      cxPageControl1.ActivePage := tabPesquisa;
      Self.Operacao := ocSemOperacao;
      Pesquisa;
    end
    else
      Application.MessageBox('Erro ao gravar', 'Erro', MB_ICONERROR);
  finally
    vConta.Free;
  end;
end;

procedure TFormCadastroConta.btnIncluirClick(Sender: TObject);
begin
  cdsDados.EmptyDataSet;
  cdsDados.Append;
  Operacao := ocInserir;
  cxPageControl1.ActivePage := tabDados;
  cxDBTextEdit2.SetFocus;
end;

procedure TFormCadastroConta.btnPesquisarClick(Sender: TObject);
begin
  Pesquisa;
end;

procedure TFormCadastroConta.cxPageControl1PageChanging(Sender: TObject;
  NewPage: TcxTabSheet; var AllowChange: Boolean);
begin
  if (NewPage = tabDados)  and (Self.Operacao = ocSemOperacao) then
    AllowChange := False
  else if NewPage = tabPesquisa then
    Self.Operacao := ocSemOperacao;
end;

procedure TFormCadastroConta.FormCreate(Sender: TObject);
begin
  cdsPesquisa.CreateDataSet;
  cdsDados.CreateDataSet;
end;

procedure TFormCadastroConta.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_RETURN) then
    Perform (CM_DIALOGKEY, VK_TAB, 0)
  else if (Key = VK_ESCAPE) then
    Perform(WM_NEXTDLGCTL,1,0);
end;

procedure TFormCadastroConta.FormShow(Sender: TObject);
begin
  edtPesquisa.SetFocus;
end;

procedure TFormCadastroConta.gridPesquisaDBTableView1DblClick(Sender: TObject);
begin
  btnAlterarClick(Sender);
end;

procedure TFormCadastroConta.Pesquisa;
var
  vLista:TList;
  vConta:TConta;
  i: Integer;
begin
  cdsPesquisa.DisableControls;
  try
    cdsPesquisa.EmptyDataSet;
    case rgFiltro.ItemIndex of
    0:
      begin
        vConta := TDAO_Conta.Read(StrToIntDef(edtPesquisa.Text, 0));
        if Assigned(vConta) then
        begin
          cdsPesquisa.Append;
          cdsPesquisaCodigo.AsInteger := vConta.Codigo;
          cdsPesquisaDescricao.AsString := vConta.Descricao;
          cdsPesquisaSaldo.AsFloat := vConta.SaldoAtual;
          cdsPesquisa.Post;
          vConta.Free;
        end;
      end;
    1:
      begin
        vLista := TDAO_Conta.Read(edtPesquisa.Text);
        if Assigned(vLista) then
        begin
          for i := 0 to vLista.Count - 1 do
          begin
            cdsPesquisa.Append;
            cdsPesquisaCodigo.AsInteger := TConta(vLista[i]).Codigo;
            cdsPesquisaDescricao.AsString := TConta(vLista[i]).Descricao;
            cdsPesquisaSaldo.AsFloat := TConta(vLista[i]).SaldoAtual;
            cdsPesquisa.Post;
          end;
          vLista.Free;
        end;
      end;
    end;
  finally
    cdsPesquisa.EnableControls;
  end;
end;

procedure TFormCadastroConta.SetOperacao(const Value: TOperacaoConta);
begin
  FOperacao := Value;
end;

procedure TFormCadastroConta.tabDadosShow(Sender: TObject);
begin
  cxDBTextEdit3.Properties.ReadOnly := not (Self.Operacao = ocInserir);
end;

end.
