unit uForm_Cadastro_Fornecedor;

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
  cxButtons, cxTextEdit, Vcl.ExtCtrls, cxPC, Datasnap.DBClient, uC_Fornecedor,
  cxMaskEdit, cxDBEdit;

type
  TFormCadastroFornecedor = class(TForm)
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
    gridPesquisaDBTableView1Telefone: TcxGridDBColumn;
    gridPesquisaLevel1: TcxGridLevel;
    tabDados: TcxTabSheet;
    pnlBotoesEdicao: TPanel;
    btnGravar: TcxButton;
    btnCancelar: TcxButton;
    cxGroupBox1: TcxGroupBox;
    Label4: TLabel;
    Label3: TLabel;
    Label2: TLabel;
    Label1: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label8: TLabel;
    Label6: TLabel;
    cdsPesquisa: TClientDataSet;
    cdsPesquisaCodigo: TIntegerField;
    cdsPesquisaNome: TStringField;
    cdsPesquisaTelefone: TStringField;
    dsPesquisa: TDataSource;
    cdsDados: TClientDataSet;
    cdsDadosCodigo: TIntegerField;
    cdsDadosNome: TStringField;
    cdsDadosTelefone: TStringField;
    cdsDadosEmail: TStringField;
    cdsDadosEnderecoLogradouro: TStringField;
    cdsDadosEnderecoComplemento: TStringField;
    cdsDadosEnderecoNumero: TStringField;
    cdsDadosEnderecoCEP: TStringField;
    cdsDadosEnderecoBairro: TStringField;
    cdsDadosEnderecoMunicipio: TStringField;
    cdsDadosEnderecoUF: TStringField;
    dsDados: TDataSource;
    cxDBTextEdit1: TcxDBTextEdit;
    cxDBMaskEdit1: TcxDBMaskEdit;
    cxDBTextEdit2: TcxDBTextEdit;
    cxDBTextEdit4: TcxDBTextEdit;
    cxDBTextEdit5: TcxDBTextEdit;
    cxDBTextEdit6: TcxDBTextEdit;
    cxDBTextEdit7: TcxDBTextEdit;
    cxDBTextEdit8: TcxDBTextEdit;
    cxDBTextEdit9: TcxDBTextEdit;
    cxDBTextEdit10: TcxDBTextEdit;
    cxDBMaskEdit2: TcxDBMaskEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnPesquisarClick(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure cxPageControl1PageChanging(Sender: TObject; NewPage: TcxTabSheet;
      var AllowChange: Boolean);
    procedure edtPesquisaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure gridPesquisaDBTableView1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure gridPesquisaDBTableView1DblClick(Sender: TObject);
  private
    FOperacao: TOperacaoFornecedor;
    procedure SetOperacao(const Value: TOperacaoFornecedor);
    { Private declarations }
    property Operacao:TOperacaoFornecedor read FOperacao write SetOperacao;
  public
    { Public declarations }
    procedure Pesquisa;
  end;

var
  FormCadastroFornecedor: TFormCadastroFornecedor;

implementation

{$R *.dfm}

uses uCDAO_Fornecedor;

procedure TFormCadastroFornecedor.btnAlterarClick(Sender: TObject);
var
  vFornecedor:TFornecedor;
begin
  if cdsPesquisa.IsEmpty then
    Exit;
  cdsDados.EmptyDataSet;
  cdsDados.Append;
  vFornecedor := TDAOFornecedor.Read(cdsPesquisaCodigo.AsInteger);
  try
    cdsDadosCodigo.AsInteger := vFornecedor.Codigo;
    cdsDadosNome.AsString := vFornecedor.Nome;
    cdsDadosTelefone.AsString := vFornecedor.Telefone;
    cdsDadosEmail.AsString := vFornecedor.Email;
    cdsDadosEnderecoLogradouro.AsString := vFornecedor.Endereco.Logradouro;
    cdsDadosEnderecoComplemento.AsString := vFornecedor.Endereco.Complemento;
    cdsDadosEnderecoNumero.AsString := vFornecedor.Endereco.Numero;
    cdsDadosEnderecoCEP.AsString := vFornecedor.Endereco.CEP;
    cdsDadosEnderecoBairro.AsString := vFornecedor.Endereco.Bairro;
    cdsDadosEnderecoMunicipio.AsString := vFornecedor.Endereco.Municipio;
    cdsDadosEnderecoUF.AsString := vFornecedor.Endereco.UF;
  finally
    vFornecedor.Free;
  end;
  Operacao := ofAlterar;
  cxPageControl1.ActivePage := tabDados;
  cxDBTextEdit2.SetFocus;
end;

procedure TFormCadastroFornecedor.btnCancelarClick(Sender: TObject);
begin
  cxPageControl1.ActivePage := tabPesquisa;
  cdsDados.EmptyDataSet;
  Self.Operacao := ofSemOperacao;
  Pesquisa;
end;

procedure TFormCadastroFornecedor.btnExcluirClick(Sender: TObject);
var
  vFornecedor:TFornecedor;
begin
  if cdsPesquisa.IsEmpty then
    Exit;
  if Application.MessageBox('Deseja excluir o fornecedor selecionado?', 'RentControl', MB_ICONQUESTION+MB_YESNO)=IDNO then
    Exit;
  vFornecedor := TDAOFornecedor.Read(cdsPesquisacodigo.AsInteger);
  try
    Self.Operacao := ofExcluir;
    if not TDAOFornecedor.Delete(vFornecedor) then
      Application.MessageBox('Erro ao excluir o fornecedor', 'Erro', MB_ICONERROR)
    else
      cdsPesquisa.Delete;
  finally
    vFornecedor.Free;
    Self.Operacao := ofSemOperacao;
  end;
end;

procedure TFormCadastroFornecedor.btnFecharClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TFormCadastroFornecedor.btnGravarClick(Sender: TObject);
var
  vFornecedor:TFornecedor;
begin
  vFornecedor := TFornecedor.Create;
  try
    vFornecedor.Codigo := cdsDadoscodigo.AsInteger;
    vFornecedor.Nome := cdsDadosNome.AsString;
    vFornecedor.Telefone := cdsDadosTelefone.AsString;
    vFornecedor.Email := cdsDadosEmail.AsString;
    vFornecedor.Endereco.Logradouro := cdsDadosEnderecoLogradouro.AsString;
    vFornecedor.Endereco.Complemento := cdsDadosEnderecoComplemento.AsString;
    vFornecedor.Endereco.Numero := cdsDadosEnderecoNumero.AsString;
    vFornecedor.Endereco.CEP := cdsDadosEnderecoCEP.AsString;
    vFornecedor.Endereco.Bairro := cdsDadosEnderecoBairro.AsString;
    vFornecedor.Endereco.Municipio := cdsDadosEnderecoMunicipio.AsString;
    vFornecedor.Endereco.UF := cdsDadosEnderecoUF.AsString;
    if Self.Operacao = ofAlterar then
    begin
      if TDAOFornecedor.Update(vFornecedor) then
      begin
          Application.MessageBox('Salvo com sucesso', 'OK', MB_ICONASTERISK);
          cxPageControl1.ActivePage := tabPesquisa;
          Self.Operacao := ofSemOperacao;
          Pesquisa;
      end
      else
          Application.MessageBox('Erro ao gravar', 'Erro', MB_ICONERROR);
    end
    else
    begin
      if TDAOFornecedor.Create(vFornecedor) then
      begin
          Application.MessageBox('Salvo com sucesso', 'OK', MB_ICONASTERISK);
          cxPageControl1.ActivePage := tabPesquisa;
          Self.Operacao := ofSemOperacao;
          Pesquisa;
      end
      else
          Application.MessageBox('Erro ao gravar', 'Erro', MB_ICONERROR);
    end;
  finally
    vFornecedor.Free;
  end;
end;

procedure TFormCadastroFornecedor.btnIncluirClick(Sender: TObject);
begin
  cdsDados.EmptyDataSet;
  cdsDados.Append;
  Operacao := ofInserir;
  cxPageControl1.ActivePage := tabDados;
  cxDBTextEdit2.SetFocus;
end;

procedure TFormCadastroFornecedor.btnPesquisarClick(Sender: TObject);
begin
  Pesquisa;
end;

procedure TFormCadastroFornecedor.cxPageControl1PageChanging(Sender: TObject;
  NewPage: TcxTabSheet; var AllowChange: Boolean);
begin
  if (NewPage = tabDados)  and (Self.Operacao = ofSemOperacao) then
    AllowChange := False
  else if NewPage = tabPesquisa then
    Self.Operacao := ofSemOperacao;
end;

procedure TFormCadastroFornecedor.edtPesquisaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key=VK_RETURN then
    btnPesquisarClick(Sender)
  else if Key=VK_DOWN then
    gridPesquisa.SetFocus;
end;

procedure TFormCadastroFornecedor.FormCreate(Sender: TObject);
begin
  cdsPesquisa.CreateDataSet;
  cdsDados.CreateDataSet;
end;

procedure TFormCadastroFornecedor.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_RETURN) then
  begin
    Perform (CM_DIALOGKEY, VK_TAB, 0);
  end
  else if (Key = VK_ESCAPE) then
    Perform(WM_NEXTDLGCTL,1,0);
end;

procedure TFormCadastroFornecedor.FormShow(Sender: TObject);
begin
  cxPageControl1.ActivePage := tabPesquisa;
  edtPesquisa.SetFocus;
end;

procedure TFormCadastroFornecedor.gridPesquisaDBTableView1DblClick(
  Sender: TObject);
begin
  btnAlterarClick(Sender);
end;

procedure TFormCadastroFornecedor.gridPesquisaDBTableView1KeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key=VK_ESCAPE then
    edtPesquisa.SetFocus
  else if Key=VK_RETURN then
    btnAlterarClick(Sender);
end;

procedure TFormCadastroFornecedor.Pesquisa;
var
  vLista:TList;
  vFornecedor:TFornecedor;
  i: Integer;
begin
  cdsPesquisa.DisableControls;
  try
    cdsPesquisa.EmptyDataSet;
    case rgFiltro.ItemIndex of
    0:
      begin
        vFornecedor := TDAOFornecedor.Read(StrToIntDef(edtPesquisa.Text, 0));
        if Assigned(vFornecedor) then
        begin
          cdsPesquisa.Append;
          cdsPesquisaCodigo.AsInteger := vFornecedor.Codigo;
          cdsPesquisaNome.AsString := vFornecedor.Nome;
          cdsPesquisaTelefone.AsString := vFornecedor.Telefone;
          cdsPesquisa.Post;
          vFornecedor.Free;
        end;
      end;
    1:
      begin
        vLista := TDAOFornecedor.Read(edtPesquisa.Text);
        if Assigned(vLista) then
        begin
          for i := 0 to vLista.Count - 1 do
          begin
            cdsPesquisa.Append;
            cdsPesquisaCodigo.AsInteger := TFornecedor(vLista[i]).Codigo;
            cdsPesquisaNome.AsString := TFornecedor(vLista[i]).Nome;
            cdsPesquisaTelefone.AsString := TFornecedor(vLista[i]).Telefone;
            cdsPesquisa.Post;
          end;
          vLista.Free;
        end;
      end;
    end;
  finally
    cdsPesquisa.EnableControls;
    edtPesquisa.SetFocus;
  end;
end;

procedure TFormCadastroFornecedor.SetOperacao(const Value: TOperacaoFornecedor);
begin
  FOperacao := Value;
end;

end.
