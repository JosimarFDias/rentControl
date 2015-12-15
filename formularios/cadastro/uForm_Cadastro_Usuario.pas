unit uForm_Cadastro_Usuario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
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
  cxNavigator, Data.DB, cxDBData, Datasnap.DBClient, cxDBEdit, Vcl.StdCtrls,
  Vcl.Mask, Vcl.DBCtrls, cxGroupBox, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid,
  cxRadioGroup, cxButtons, cxTextEdit, Vcl.ExtCtrls, cxPC, uC_Usuario,
  cxCheckBox, LiderLaranja, dxSkinLiderMarmore;

type
  TFormCadastroUsuario = class(TForm)
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
    gridPesquisaDBTableView1Nome: TcxGridDBColumn;
    gridPesquisaLevel1: TcxGridLevel;
    tabDados: TcxTabSheet;
    pnlBotoesEdicao: TPanel;
    btnGravar: TcxButton;
    btnCancelar: TcxButton;
    cdsPesquisa: TClientDataSet;
    cdsPesquisaCodigo: TIntegerField;
    cdsPesquisaNome: TStringField;
    dsPesquisa: TDataSource;
    cdsDados: TClientDataSet;
    cdsDadosCodigo: TIntegerField;
    cdsDadosNome: TStringField;
    dsDados: TDataSource;
    cdsDadosLogin: TStringField;
    cdsDadosSenha: TStringField;
    cxGroupBox1: TcxGroupBox;
    Label4: TLabel;
    Label3: TLabel;
    Label2: TLabel;
    Label1: TLabel;
    cdsDadosNivel: TIntegerField;
    cxDBRadioGroup1: TcxDBRadioGroup;
    cxDBTextEdit1: TcxDBTextEdit;
    cxDBTextEdit2: TcxDBTextEdit;
    cxDBTextEdit3: TcxDBTextEdit;
    cxDBTextEdit4: TcxDBTextEdit;
    cxDBCheckBox1: TcxDBCheckBox;
    cdsDadosAtivo: TBooleanField;
    procedure btnIncluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure cxPageControl1PageChanging(Sender: TObject; NewPage: TcxTabSheet;
      var AllowChange: Boolean);
    procedure gridPesquisaDBTableView1DblClick(Sender: TObject);
  private
    FOperacao: TOperacaoUsuario;
    procedure SetOperacao(const Value: TOperacaoUsuario);
    procedure Pesquisa;
    { Private declarations }
    property Operacao:TOperacaoUsuario read FOperacao write SetOperacao;
  public
    { Public declarations }
  end;

var
  FormCadastroUsuario: TFormCadastroUsuario;

implementation

{$R *.dfm}

uses uCDAO_Usuario, uc_Sistema;

procedure TFormCadastroUsuario.btnAlterarClick(Sender: TObject);
var
  vUsuario:TUsuario;
begin
  if cdsPesquisa.IsEmpty then
    Exit;
  if Sistema.UsuarioLogado.Nivel <> 1 then
    raise Exception.Create('Você não possui permissão para alterar este registro');
  cdsDados.EmptyDataSet;
  cdsDados.Append;
  vUsuario := TDAO_Usuario.Read(cdsPesquisaCodigo.AsInteger);
  try
    cdsDadosCodigo.AsInteger := vUsuario.Codigo;
    cdsDadosNome.AsString    := vUsuario.Nome;
    cdsDadosLogin.AsString   := vUsuario.Login;
    cdsDadosSenha.AsString   := vUsuario.Senha;
    cdsDadosNivel.AsInteger  := vUsuario.Nivel;
    cdsDadosAtivo.AsBoolean  := vUsuario.Ativo;
  finally
    vUsuario.Free;
  end;
  Operacao := ouAlterar;
  cxPageControl1.ActivePage := tabDados;
  cxDBTextEdit2.SetFocus;
end;

procedure TFormCadastroUsuario.btnCancelarClick(Sender: TObject);
begin
  cxPageControl1.ActivePage := tabPesquisa;
  cdsDados.EmptyDataSet;
  Pesquisa;
end;

procedure TFormCadastroUsuario.btnExcluirClick(Sender: TObject);
var
  vUsuario:TUsuario;
begin
  if cdsPesquisa.IsEmpty then
    Exit;
  vUsuario := TDAO_Usuario.Read(cdsPesquisacodigo.AsInteger);
  try
    Self.Operacao := ouExcluir;
    if not TDAO_Usuario.Delete(vUsuario) then
      Application.MessageBox('Erro ao excluir o usuario', 'Erro', MB_ICONERROR)
    else
      cdsPesquisa.Delete;
  finally
    vUsuario.Free;
    Self.Operacao := ouSemOperacao;
  end;
end;

procedure TFormCadastroUsuario.btnFecharClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TFormCadastroUsuario.btnGravarClick(Sender: TObject);
var
  vUsuario:TUsuario;
begin
  vUsuario := TUsuario.Create;
  try
    vUsuario.Codigo := cdsDadoscodigo.AsInteger;
    vUsuario.Nome   := cdsDadosNome.AsString;
    vUsuario.Login  := cdsDadosLogin.AsString;
    vUsuario.Senha  := cdsDadosSenha.AsString;
    vUsuario.Nivel  := cdsDadosNivel.AsInteger;
    vUsuario.Ativo  := cdsDadosAtivo.AsBoolean;
    if Self.Operacao = ouAlterar then
    begin
      if TDAO_Usuario.Update(vUsuario) then
      begin
        Application.MessageBox('Salvo com sucesso', 'OK', MB_ICONASTERISK);
        cxPageControl1.ActivePage := tabPesquisa;
        Self.Operacao := ouSemOperacao;
        Pesquisa;
      end
      else
        Application.MessageBox('Erro ao gravar', 'Erro', MB_ICONERROR);
    end
    else
    begin
      if TDAO_Usuario.Create(vUsuario) then
      begin
        Application.MessageBox('Salvo com sucesso', 'OK', MB_ICONASTERISK);
        cxPageControl1.ActivePage := tabPesquisa;
        Self.Operacao := ouSemOperacao;
        Pesquisa;
      end
      else
        Application.MessageBox('Erro ao gravar', 'Erro', MB_ICONERROR);
    end;
  finally
    vUsuario.Free;
  end;
end;

procedure TFormCadastroUsuario.btnIncluirClick(Sender: TObject);
begin
  cdsDados.EmptyDataSet;
  cdsDados.Append;
  cdsDadosNivel.AsInteger := 3;
  Operacao := ouInserir;
  cxPageControl1.ActivePage := tabDados;
  cxDBTextEdit2.SetFocus;
end;

procedure TFormCadastroUsuario.btnPesquisarClick(Sender: TObject);
begin
  Pesquisa;
end;

procedure TFormCadastroUsuario.cxPageControl1PageChanging(Sender: TObject;
  NewPage: TcxTabSheet; var AllowChange: Boolean);
begin
  if (NewPage = tabDados)  and (Self.Operacao = ouSemOperacao) then
    AllowChange := False
  else if NewPage = tabPesquisa then
    Self.Operacao := ouSemOperacao;
end;

procedure TFormCadastroUsuario.FormCreate(Sender: TObject);
begin
  cdsPesquisa.CreateDataSet;
  cdsDados.CreateDataSet;
end;

procedure TFormCadastroUsuario.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_RETURN) then
    Perform (CM_DIALOGKEY, VK_TAB, 0)
  else if (Key = VK_ESCAPE) then
    Perform(WM_NEXTDLGCTL,1,0);
end;

procedure TFormCadastroUsuario.FormShow(Sender: TObject);
begin
  edtPesquisa.SetFocus;
end;

procedure TFormCadastroUsuario.gridPesquisaDBTableView1DblClick(
  Sender: TObject);
begin
  btnAlterarClick(Sender);
end;

procedure TFormCadastroUsuario.Pesquisa;
var
  vLista:TList;
  vUsuario:TUsuario;
  i: Integer;
begin
  cdsPesquisa.DisableControls;
  try
    cdsPesquisa.EmptyDataSet;
    case rgFiltro.ItemIndex of
    0:
      begin
        vUsuario := TDAO_Usuario.Read(StrToIntDef(edtPesquisa.Text, 0));
        if Assigned(vUsuario) then
        begin
          cdsPesquisa.Append;
          cdsPesquisaCodigo.AsInteger := vUsuario.Codigo;
          cdsPesquisaNome.AsString := vUsuario.Nome;
          cdsPesquisa.Post;
          vUsuario.Free;
        end;
      end;
    1:
      begin
        vLista := TDAO_Usuario.Read(edtPesquisa.Text);
        if Assigned(vLista) then
        begin
          for i := 0 to vLista.Count - 1 do
          begin
            cdsPesquisa.Append;
            cdsPesquisaCodigo.AsInteger := TUsuario(vLista[i]).Codigo;
            cdsPesquisaNome.AsString := TUsuario(vLista[i]).Nome;
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

procedure TFormCadastroUsuario.SetOperacao(const Value: TOperacaoUsuario);
begin
  FOperacao := Value;
end;

end.
