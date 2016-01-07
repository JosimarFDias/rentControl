unit uForm_Cadastro_Cliente;

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
  cxPC, Vcl.ExtCtrls, cxContainer, cxEdit, Vcl.Menus, Vcl.StdCtrls, cxButtons,
  cxTextEdit, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, Data.DB, cxDBData, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, cxGroupBox,
  cxRadioGroup, Datasnap.DBClient, Vcl.Mask, Vcl.DBCtrls, uC_Cliente, cxDBEdit,
  dxSkinsdxStatusBarPainter, dxStatusBar, cxMaskEdit, cxLabel, cxDropDownEdit, cxCalendar,
  cxCheckBox, cxCurrencyEdit;

type
  TFormCadastroCliente = class(TForm)
    cxPageControl1: TcxPageControl;
    tabPesquisa: TcxTabSheet;
    tabDados: TcxTabSheet;
    pnlPesquisa: TPanel;
    pnlBotoesRegistro: TPanel;
    edtPesquisa: TcxTextEdit;
    btnPesquisar: TcxButton;
    btnFechar: TcxButton;
    btnIncluir: TcxButton;
    btnAlterar: TcxButton;
    btnExcluir: TcxButton;
    gridPesquisaDBTableView1: TcxGridDBTableView;
    gridPesquisaLevel1: TcxGridLevel;
    gridPesquisa: TcxGrid;
    rgFiltro: TcxRadioGroup;
    cdsPesquisa: TClientDataSet;
    dsPesquisa: TDataSource;
    cdsPesquisaCodigo: TIntegerField;
    cdsPesquisaNome: TStringField;
    cdsPesquisaTelefone: TStringField;
    gridPesquisaDBTableView1Codigo: TcxGridDBColumn;
    gridPesquisaDBTableView1Nome: TcxGridDBColumn;
    gridPesquisaDBTableView1Telefone: TcxGridDBColumn;
    pnlBotoesEdicao: TPanel;
    btnGravar: TcxButton;
    btnCancelar: TcxButton;
    cdsDados: TClientDataSet;
    cdsDadosCodigo: TIntegerField;
    cdsDadosNome: TStringField;
    cdsDadosTelefone: TStringField;
    dsDados: TDataSource;
    cdsDadosEmail: TStringField;
    cdsDadosEnderecoLogradouro: TStringField;
    cdsDadosEnderecoComplemento: TStringField;
    cdsDadosEnderecoNumero: TStringField;
    cdsDadosEnderecoCEP: TStringField;
    cdsDadosEnderecoBairro: TStringField;
    cdsDadosEnderecoMunicipio: TStringField;
    cdsDadosEnderecoUF: TStringField;
    cxGroupBox1: TcxGroupBox;
    Label4: TLabel;
    Label3: TLabel;
    Label2: TLabel;
    Label1: TLabel;
    DBEdit4: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit1: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    Label9: TLabel;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    Label10: TLabel;
    DBEdit11: TDBEdit;
    Label11: TLabel;
    DBEdit8: TDBEdit;
    Label8: TLabel;
    DBEdit6: TDBEdit;
    Label6: TLabel;
    cdsDadosTipoPessoa: TStringField;
    cdsDadosCpf: TStringField;
    cdsDadosCnpj: TStringField;
    cxDBRadioGroup1: TcxDBRadioGroup;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxDBMaskEdit2: TcxDBMaskEdit;
    cxDBMaskEdit1: TcxDBMaskEdit;
    cdsDadosNascimento: TDateField;
    cxDBDateEdit1: TcxDBDateEdit;
    Label12: TLabel;
    cdsDadosAluno: TBooleanField;
    cdsDadosResponsavel: TStringField;
    DBEdit12: TDBEdit;
    Label13: TLabel;
    cxDBCheckBox1: TcxDBCheckBox;
    Label14: TLabel;
    cxDBCurrencyEdit1: TcxDBCurrencyEdit;
    cdsDadosMensalidade: TCurrencyField;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtPesquisaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure gridPesquisaDBTableView1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxPageControl1PageChanging(Sender: TObject; NewPage: TcxTabSheet;
      var AllowChange: Boolean);
    procedure cxDBRadioGroup1PropertiesEditValueChanged(Sender: TObject);
    procedure gridPesquisaDBTableView1DblClick(Sender: TObject);
    procedure cxDBCheckBox1Click(Sender: TObject);
  private
    FOperacao: TOperacaoCliente;
    procedure SetOperacao(const Value: TOperacaoCliente);
    { Private declarations }
    property Operacao:TOperacaoCliente read FOperacao write SetOperacao;
  public
    { Public declarations }
    procedure Pesquisa;
  end;

var
  FormCadastroCliente: TFormCadastroCliente;

implementation

{$R *.dfm}

uses uCDAO_Cliente, uc_Sistema, uUtils;

{ TFormCadastroCliente }

procedure TFormCadastroCliente.btnAlterarClick(Sender: TObject);
var
  vCliente:TCliente;
begin
  if cdsPesquisa.IsEmpty then
    Exit;
  cdsDados.EmptyDataSet;
  cdsDados.Append;
  vCliente := TDAOCliente.Read(cdsPesquisaCodigo.AsInteger);
  try
    cdsDadosCodigo.AsInteger := vCliente.Codigo;
    cdsDadosNome.AsString := vCliente.Nome;
    cdsDadosTelefone.AsString := vCliente.Telefone;
    cdsDadosEmail.AsString := vCliente.Email;
    cdsDadosEnderecoLogradouro.AsString := vCliente.Endereco.Logradouro;
    cdsDadosEnderecoComplemento.AsString := vCliente.Endereco.Complemento;
    cdsDadosEnderecoNumero.AsString := vCliente.Endereco.Numero;
    cdsDadosEnderecoCEP.AsString := vCliente.Endereco.CEP;
    cdsDadosEnderecoBairro.AsString := vCliente.Endereco.Bairro;
    cdsDadosEnderecoMunicipio.AsString := vCliente.Endereco.Municipio;
    cdsDadosEnderecoUF.AsString := vCliente.Endereco.UF;
    cxLabel1.Visible := True;
    cxDBMaskEdit1.Visible := True;
    if vCliente.CNPJ = '' then
      cdsDadosTipoPessoa.AsString := 'F'
    else
      cdsDadosTipoPessoa.AsString := 'J';
    cdsDadosCpf.AsString := vCliente.CPF;
    cdsDadosCnpj.AsString := vCliente.CNPJ;
    if Double(vCliente.Nascimento)>0 then
      cdsDadosNascimento.AsDateTime := vCliente.Nascimento;
    cdsDadosAluno.AsBoolean := vCliente.Aluno;
    cdsDadosResponsavel.AsString := vCliente.Responsavel;
    cdsDadosMensalidade.AsCurrency := vCliente.ValorMensalidade;
  finally
    vCliente.Free;
  end;
  Operacao := ocAlterar;
  cxPageControl1.ActivePage := tabDados;
  cxDBCheckBox1Click(Sender);
  DBEdit2.SetFocus;
end;

procedure TFormCadastroCliente.btnCancelarClick(Sender: TObject);
begin
  cxPageControl1.ActivePage := tabPesquisa;
  cdsDados.EmptyDataSet;
  Pesquisa;
end;

procedure TFormCadastroCliente.btnExcluirClick(Sender: TObject);
var
  vCliente:TCliente;
begin
  if cdsPesquisa.IsEmpty then
    Exit;
  vCliente := TDAOCliente.Read(cdsPesquisacodigo.AsInteger);
  try
    Self.Operacao := ocExcluir;
    if not TDAOCliente.Delete(vCliente) then
      Application.MessageBox('Erro ao excluir o cliente', 'Erro', MB_ICONERROR)
    else
      cdsPesquisa.Delete;
  finally
    vCliente.Free;
    Self.Operacao := ocSemOperacao;
  end;
end;

procedure TFormCadastroCliente.btnFecharClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TFormCadastroCliente.btnGravarClick(Sender: TObject);
var
  vCliente:TCliente;
begin
  TelaEspera('Gravando, aguarde...');
  vCliente := TCliente.Create;
  try
    vCliente.Codigo := cdsDadoscodigo.AsInteger;
    vCliente.Nome := cdsDadosNome.AsString;
    vCliente.Telefone := cdsDadosTelefone.AsString;
    vCliente.Email := cdsDadosEmail.AsString;
    vCliente.Endereco.Logradouro := cdsDadosEnderecoLogradouro.AsString;
    vCliente.Endereco.Complemento := cdsDadosEnderecoComplemento.AsString;
    vCliente.Endereco.Numero := cdsDadosEnderecoNumero.AsString;
    vCliente.Endereco.CEP := cdsDadosEnderecoCEP.AsString;
    vCliente.Endereco.Bairro := cdsDadosEnderecoBairro.AsString;
    vCliente.Endereco.Municipio := cdsDadosEnderecoMunicipio.AsString;
    vCliente.Endereco.UF := cdsDadosEnderecoUF.AsString;
    vCliente.Nascimento := cdsDadosNascimento.AsDateTime;
    vCliente.Aluno := cdsDadosAluno.AsBoolean;
    vCliente.Responsavel := cdsDadosResponsavel.AsString;
    vCliente.ValorMensalidade := cdsDadosMensalidade.AsCurrency;
    if cdsDadosTipoPessoa.AsString = 'F' then
      cdsDadosCnpj.AsString := ''
    else
      cdsDadosCpf.AsString := '';
    vCliente.CPF := cdsDadosCpf.AsString;
    vCliente.CNPJ := cdsDadosCnpj.AsString;
    if Self.Operacao = ocAlterar then
    begin
      if TDAOCliente.Update(vCliente) then
      begin
          Application.MessageBox('Salvo com sucesso', 'OK', MB_ICONASTERISK);
          cxPageControl1.ActivePage := tabPesquisa;
          Self.Operacao := ocSemOperacao;
          Pesquisa;
      end
      else
          Application.MessageBox('Erro ao gravar', 'Erro', MB_ICONERROR);
    end
    else
    begin
      if TDAOCliente.Create(vCliente) then
      begin
          Application.MessageBox('Salvo com sucesso', 'OK', MB_ICONASTERISK);
          cxPageControl1.ActivePage := tabPesquisa;
          Self.Operacao := ocSemOperacao;
          Pesquisa;
      end
      else
          Application.MessageBox('Erro ao gravar', 'Erro', MB_ICONERROR);
    end;
  finally
    vCliente.Free;
    TelaEspera('', False);
  end;
end;

procedure TFormCadastroCliente.btnIncluirClick(Sender: TObject);
begin
  cdsDados.EmptyDataSet;
  cdsDados.Append;
  cdsDadosTipoPessoa.AsString := 'F';
  Operacao := ocInserir;
  cxPageControl1.ActivePage := tabDados;
  cxDBCheckBox1Click(Sender);
  DBEdit2.SetFocus;
end;

procedure TFormCadastroCliente.btnPesquisarClick(Sender: TObject);
begin
  Pesquisa;
end;

procedure TFormCadastroCliente.cxDBCheckBox1Click(Sender: TObject);
begin
  Label13.Visible := cxDBCheckBox1.Checked;
  DBEdit12.Visible := cxDBCheckBox1.Checked;
  Label14.Visible := cxDBCheckBox1.Checked;
  cxDBCurrencyEdit1.Visible := cxDBCheckBox1.Checked;
  if cdsDadosMensalidade.AsCurrency <= 0 then
    cdsDadosMensalidade.AsCurrency := Sistema.ValorMensalidadeEscolinha;
end;

procedure TFormCadastroCliente.cxDBRadioGroup1PropertiesEditValueChanged(
  Sender: TObject);
begin
  if cdsDados.State in [dsEdit, dsInsert] then
  begin
    cxLabel1.Visible := cdsDadosTipoPessoa.AsString = 'F';
    cxLabel2.Visible := cdsDadosTipoPessoa.AsString = 'J';
    cxDBMaskEdit1.Visible := cdsDadosTipoPessoa.AsString = 'F';
    cxDBMaskEdit2.Visible := cdsDadosTipoPessoa.AsString = 'J';
    if cdsDadosTipoPessoa.AsString = 'F' then
      cdsDadosCnpj.AsString := ''
    else
      cdsDadosCpf.AsString := '';
  end;
end;

procedure TFormCadastroCliente.cxPageControl1PageChanging(Sender: TObject;
  NewPage: TcxTabSheet; var AllowChange: Boolean);
begin
  if (NewPage = tabDados)  and (Self.Operacao = ocSemOperacao) then
    AllowChange := False
  else if NewPage = tabPesquisa then
    Self.Operacao := ocSemOperacao;
end;

procedure TFormCadastroCliente.edtPesquisaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key=VK_RETURN then
    btnPesquisarClick(Sender)
  else if Key=VK_DOWN then
    gridPesquisa.SetFocus;
end;

procedure TFormCadastroCliente.FormCreate(Sender: TObject);
begin
  cdsPesquisa.CreateDataSet;
  cdsDados.CreateDataSet;
end;

procedure TFormCadastroCliente.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_RETURN) then
  begin
    Perform (CM_DIALOGKEY, VK_TAB, 0);
  end
  else if (Key = VK_ESCAPE) then
    Perform(WM_NEXTDLGCTL,1,0);
end;

procedure TFormCadastroCliente.FormShow(Sender: TObject);
begin
  cxPageControl1.ActivePage := tabPesquisa;
  edtPesquisa.SetFocus;
end;

procedure TFormCadastroCliente.gridPesquisaDBTableView1DblClick(
  Sender: TObject);
begin
  btnAlterarClick(Sender);
end;

procedure TFormCadastroCliente.gridPesquisaDBTableView1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key=VK_ESCAPE then
    edtPesquisa.SetFocus
  else if Key=VK_RETURN then
    btnAlterarClick(Sender);
end;

procedure TFormCadastroCliente.Pesquisa;
var
  vLista:TList;
  vCliente:TCliente;
  i: Integer;
begin
  cdsPesquisa.DisableControls;
  TelaEspera('Pesquisando, aguarde...');
  try
    cdsPesquisa.EmptyDataSet;
    case rgFiltro.ItemIndex of
    0:
      begin
        vCliente := TDAOCliente.Read(StrToIntDef(edtPesquisa.Text, 0));
        if Assigned(vCliente) then
        begin
          cdsPesquisa.Append;
          cdsPesquisaCodigo.AsInteger := vCliente.Codigo;
          cdsPesquisaNome.AsString := vCliente.Nome;
          cdsPesquisaTelefone.AsString := vCliente.Telefone;
          cdsPesquisa.Post;
          vCliente.Free;
        end;
      end;
    1:
      begin
        vLista := TDAOCliente.Read(edtPesquisa.Text);
        if Assigned(vLista) then
        begin
          for i := 0 to vLista.Count - 1 do
          begin
            cdsPesquisa.Append;
            cdsPesquisaCodigo.AsInteger := TCliente(vLista[i]).Codigo;
            cdsPesquisaNome.AsString := TCliente(vLista[i]).Nome;
            cdsPesquisaTelefone.AsString := TCliente(vLista[i]).Telefone;
            cdsPesquisa.Post;
          end;
          vLista.Free;
        end;
      end;
    end;
  finally
    TelaEspera('', False);
    cdsPesquisa.EnableControls;
    edtPesquisa.SetFocus;
  end;
end;

procedure TFormCadastroCliente.SetOperacao(const Value: TOperacaoCliente);
begin
  FOperacao := Value;
end;

end.
