unit uForm_Cadastro_Ambiente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue, dxSkinscxPCPainter, cxPCdxBarPopupMenu,
  cxContainer, cxEdit, Vcl.Menus, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxNavigator, Data.DB, cxDBData, Vcl.StdCtrls, Vcl.Mask,
  Vcl.DBCtrls, cxGroupBox, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid, cxRadioGroup,
  cxButtons, cxTextEdit, Vcl.ExtCtrls, cxPC, Datasnap.DBClient, uC_Ambiente,
  cxDBEdit, cxLabel;

type
  TFormCadastroAmbiente = class(TForm)
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
    gridPesquisaDBTableView1Codigo: TcxGridDBColumn;
    gridPesquisaDBTableView1Descricao: TcxGridDBColumn;
    gridPesquisaDBTableView1ValorPadrao: TcxGridDBColumn;
    gridPesquisaLevel1: TcxGridLevel;
    tabDados: TcxTabSheet;
    pnlBotoesEdicao: TPanel;
    btnGravar: TcxButton;
    btnCancelar: TcxButton;
    cxGroupBox1: TcxGroupBox;
    cdsPesquisa: TClientDataSet;
    cdsPesquisaCodigo: TIntegerField;
    cdsPesquisaDescricao: TStringField;
    dsPesquisa: TDataSource;
    cdsDados: TClientDataSet;
    cdsDadosCodigo: TIntegerField;
    cdsDadosNome: TStringField;
    dsDados: TDataSource;
    cdsDadosValorPadrao: TFloatField;
    cdsPesquisaValorPadrao: TFloatField;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxDBTextEdit1: TcxDBTextEdit;
    cxDBTextEdit2: TcxDBTextEdit;
    cxDBTextEdit3: TcxDBTextEdit;
    cxLabel3: TcxLabel;
    cxDBTextEdit4: TcxDBTextEdit;
    cxLabel4: TcxLabel;
    cxDBTextEdit5: TcxDBTextEdit;
    cxLabel5: TcxLabel;
    cdsDadosValorNoite: TFloatField;
    cdsDadosDescontoPacote: TFloatField;
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
    procedure cxPageControl1PageChanging(Sender: TObject; NewPage: TcxTabSheet;
      var AllowChange: Boolean);
    procedure gridPesquisaDBTableView1DblClick(Sender: TObject);
  private
    FOperacao: TOperacaoAmbiente;
    procedure SetOperacao(const Value: TOperacaoAmbiente);
    { Private declarations }
  public
    { Public declarations }
    property Operacao:TOperacaoAmbiente read FOperacao write SetOperacao;
    procedure Pesquisa;
  end;

var
  FormCadastroAmbiente: TFormCadastroAmbiente;

implementation

{$R *.dfm}

uses uCDAO_Ambiente;

{ TFormCadastroAmbiente }

procedure TFormCadastroAmbiente.btnAlterarClick(Sender: TObject);
var
  vAmbiente:TAmbiente;
begin
  if cdsPesquisa.IsEmpty then
    Exit;
  cdsDados.EmptyDataSet;
  cdsDados.Append;
  vAmbiente := TDAOAmbiente.Read(cdsPesquisaCodigo.AsInteger);
  try
    cdsDadosCodigo.AsInteger := vAmbiente.Codigo;
    cdsDadosNome.AsString := vAmbiente.Descricao;
    cdsDadosValorPadrao.AsFloat := vAmbiente.ValorPadrao;
    cdsDadosValorNoite.AsFloat := vAmbiente.ValorNoite;
    cdsDadosDescontoPacote.AsFloat := vAmbiente.DescontoPacote;
  finally
    vAmbiente.Free;
  end;
  Operacao := oaAlterar;
  cxPageControl1.ActivePage := tabDados;
  cxDBTextEdit2.SetFocus;
end;

procedure TFormCadastroAmbiente.btnCancelarClick(Sender: TObject);
begin
  cxPageControl1.ActivePage := tabPesquisa;
  cdsDados.EmptyDataSet;
  Pesquisa;
end;

procedure TFormCadastroAmbiente.btnExcluirClick(Sender: TObject);
var
  vAmbiente:TAmbiente;
begin
  if cdsPesquisa.IsEmpty then
    Exit;
  vAmbiente := TDAOAmbiente.Read(cdsPesquisacodigo.AsInteger);
  try
    Self.Operacao := oaExcluir;
    if not TDAOAmbiente.Delete(vAmbiente) then
      Application.MessageBox('Erro ao excluir ambiente', 'Erro', MB_ICONERROR)
    else
      cdsPesquisa.Delete;
  finally
    vAmbiente.Free;
    Self.Operacao := oaSemOperacao;
  end;
end;

procedure TFormCadastroAmbiente.btnFecharClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TFormCadastroAmbiente.btnGravarClick(Sender: TObject);
var
  vAmbiente:TAmbiente;
begin
  if Self.Operacao = oaAlterar then
    vAmbiente := TDAOAmbiente.Read(cdsDadosCodigo.AsInteger)
  else
    vAmbiente := TAmbiente.Create;
  try
    vAmbiente.Codigo         := cdsDadoscodigo.AsInteger;
    vAmbiente.Descricao      := cdsDadosNome.AsString;
    vAmbiente.ValorPadrao    := cdsDadosValorPadrao.AsFloat;
    vAmbiente.ValorNoite     := cdsDadosValorNoite.AsFloat;
    vAmbiente.DescontoPacote := cdsDadosDescontoPacote.AsFloat;
    if self.Operacao = oaAlterar then
    begin
      if TDAOAmbiente.Update(vAmbiente) then
      begin
        Application.MessageBox('Salvo com sucesso', 'OK', MB_ICONASTERISK);
        cxPageControl1.ActivePage := tabPesquisa;
        Self.Operacao := oaSemOperacao;
        Pesquisa;
      end
      else
        Application.MessageBox('Erro ao gravar', 'Erro', MB_ICONERROR);
    end
    else
    begin
      if TDAOAmbiente.Create(vAmbiente) then
      begin
        Application.MessageBox('Salvo com sucesso', 'OK', MB_ICONASTERISK);
        cxPageControl1.ActivePage := tabPesquisa;
        Self.Operacao := oaSemOperacao;
        Pesquisa;
      end
      else
        Application.MessageBox('Erro ao gravar', 'Erro', MB_ICONERROR);
    end;
  finally
    vAmbiente.Free;
  end;
end;

procedure TFormCadastroAmbiente.btnIncluirClick(Sender: TObject);
begin
  cdsDados.EmptyDataSet;
  cdsDados.Append;
  Operacao := oaInserir;
  cxPageControl1.ActivePage := tabDados;
  cxDBTextEdit2.SetFocus;
end;

procedure TFormCadastroAmbiente.btnPesquisarClick(Sender: TObject);
begin
  Pesquisa;
end;

procedure TFormCadastroAmbiente.cxPageControl1PageChanging(Sender: TObject;
  NewPage: TcxTabSheet; var AllowChange: Boolean);
begin
  if (NewPage = tabDados)  and (Self.Operacao = oaSemOperacao) then
    AllowChange := False
  else if NewPage = tabPesquisa then
    Self.Operacao := oaSemOperacao;
end;

procedure TFormCadastroAmbiente.FormCreate(Sender: TObject);
begin
  cdsPesquisa.CreateDataSet;
  cdsDados.CreateDataSet;
end;

procedure TFormCadastroAmbiente.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_RETURN) then
    Perform (CM_DIALOGKEY, VK_TAB, 0)
  else if (Key = VK_ESCAPE) then
    Perform(WM_NEXTDLGCTL,1,0);
end;

procedure TFormCadastroAmbiente.FormShow(Sender: TObject);
begin
  edtPesquisa.SetFocus;
end;

procedure TFormCadastroAmbiente.gridPesquisaDBTableView1DblClick(
  Sender: TObject);
begin
  btnAlterarClick(Sender);
end;

procedure TFormCadastroAmbiente.Pesquisa;
var
  vLista:TList;
  vAmbiente:TAmbiente;
  i: Integer;
begin
  cdsPesquisa.DisableControls;
  try
    cdsPesquisa.EmptyDataSet;
    case rgFiltro.ItemIndex of
    0:
      begin
        vAmbiente := TDAOAmbiente.Read(StrToIntDef(edtPesquisa.Text, 0));
        if Assigned(vAmbiente) then
        begin
          cdsPesquisa.Append;
          cdsPesquisaCodigo.AsInteger := vAmbiente.Codigo;
          cdsPesquisaDescricao.AsString := vAmbiente.Descricao;
          cdsPesquisaValorPadrao.AsFloat := vAmbiente.ValorPadrao;
          cdsPesquisa.Post;
          vAmbiente.Free;
        end;
      end;
    1:
      begin
        vLista := TDAOAmbiente.Read(edtPesquisa.Text);
        if Assigned(vLista) then
        begin
          for i := 0 to vLista.Count - 1 do
          begin
            cdsPesquisa.Append;
            cdsPesquisaCodigo.AsInteger := TAmbiente(vLista[i]).Codigo;
            cdsPesquisaDescricao.AsString := TAmbiente(vLista[i]).Descricao;
            cdsPesquisaValorPadrao.AsFloat := TAmbiente(vLista[i]).ValorPadrao;
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

procedure TFormCadastroAmbiente.SetOperacao(const Value: TOperacaoAmbiente);
begin
  FOperacao := Value;
end;

end.
