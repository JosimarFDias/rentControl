unit uForm_Cadastro_Aluno;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue, dxSkinscxPCPainter, cxPCdxBarPopupMenu,
  cxContainer, cxEdit, Vcl.Menus, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxNavigator, Data.DB, cxDBData, Vcl.StdCtrls, Vcl.Mask,
  Vcl.DBCtrls, cxGroupBox, Datasnap.DBClient, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxGridCustomView, cxGrid, cxRadioGroup, cxButtons, cxTextEdit, Vcl.ExtCtrls,
  cxPC, ppDesignLayer, ppParameter, ppBands, ppReport, ppStrtch, ppSubRpt,
  ppCtrls, ppPrnabl, ppClass, ppCache, ppProd, ppComm, ppRelatv, ppDB, ppDBPipe,
  ppMemo, uC_Aluno, cxDBEdit, LiderLaranja, dxSkinLiderMarmore;

type
  TForm_Cadastro_Aluno = class(TForm)
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
    cdsPesquisa: TClientDataSet;
    cdsPesquisaCodigo: TIntegerField;
    cdsPesquisaNome: TStringField;
    cdsPesquisaTelefone: TStringField;
    dsPesquisa: TDataSource;
    cdsDados: TClientDataSet;
    cdsDadosCodigo: TIntegerField;
    cdsDadosNome: TStringField;
    cdsDadosTelefone: TStringField;
    cdsDadosEnderecoLogradouro: TStringField;
    cdsDadosEnderecoNumero: TStringField;
    cdsDadosEnderecoCEP: TStringField;
    cdsDadosEnderecoBairro: TStringField;
    cdsDadosEnderecoMunicipio: TStringField;
    cdsDadosEnderecoUF: TStringField;
    dsDados: TDataSource;
    cxGroupBox1: TcxGroupBox;
    Label3: TLabel;
    Label2: TLabel;
    Label1: TLabel;
    DBEdit3: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit1: TDBEdit;
    PopupMenu1: TPopupMenu;
    ImprimirContrato1: TMenuItem;
    ppDBPipeline1: TppDBPipeline;
    ClientDataSet1: TClientDataSet;
    DataSource1: TDataSource;
    ppRe_Vendas_ProdutosPeriodo: TppReport;
    ppHeaderBand3: TppHeaderBand;
    ppLabel12: TppLabel;
    ppDetailBand3: TppDetailBand;
    ppLine41: TppLine;
    ppFooterBand3: TppFooterBand;
    ppLine42: TppLine;
    ppDBText17: TppDBText;
    ppDBText18: TppDBText;
    ppDBText19: TppDBText;
    ppDBText20: TppDBText;
    ppDBText21: TppDBText;
    ppDBText22: TppDBText;
    ppDBText33: TppDBText;
    ppDBText34: TppDBText;
    ppDBText35: TppDBText;
    ppSummaryBand2: TppSummaryBand;
    ppLine50: TppLine;
    ppParameterList3: TppParameterList;
    ppDesignLayers1: TppDesignLayers;
    ppDesignLayer1: TppDesignLayer;
    ppMemo1: TppMemo;
    cdsDadosnascimento: TDateField;
    cdsDadosnaturalidadecidade: TStringField;
    cdsDadosnaturalidadeuf: TStringField;
    cdsDadosdatacadastro: TDateField;
    cdsDadosrg: TStringField;
    cdsDadosorgaorg: TStringField;
    cdsDadosdatarg: TDateField;
    cdsDadoscpf: TStringField;
    cdsDadoscertidao: TStringField;
    cdsDadoscelular: TStringField;
    cdsDadossexo: TStringField;
    cdsDadosnomeresp: TStringField;
    cdsDadosprofresp: TStringField;
    cdsDadostelefoneresp: TStringField;
    cdsDadostiposang: TStringField;
    cdsDadosfatorrh: TStringField;
    Label4: TLabel;
    cxDBTextEdit1: TcxDBTextEdit;
    Label5: TLabel;
    cxDBTextEdit2: TcxDBTextEdit;
    Label6: TLabel;
    cxDBTextEdit3: TcxDBTextEdit;
    Label7: TLabel;
    cxDBTextEdit4: TcxDBTextEdit;
    Label8: TLabel;
    cxDBTextEdit5: TcxDBTextEdit;
    Label9: TLabel;
    cxDBTextEdit6: TcxDBTextEdit;
    procedure btnIncluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FOperacao: TOperacaoAluno;
    procedure SetOperacao(const Value: TOperacaoAluno);
    { Private declarations }
    property Operacao:TOperacaoAluno read FOperacao write SetOperacao;
    procedure Pesquisa;
  public
    { Public declarations }
  end;

var
  Form_Cadastro_Aluno: TForm_Cadastro_Aluno;

implementation

{$R *.dfm}

uses uCDAO_Aluno;

procedure TForm_Cadastro_Aluno.btnAlterarClick(Sender: TObject);
var
  vUsuario:TAluno;
begin
  if cdsPesquisa.IsEmpty then
    Exit;
  cdsDados.EmptyDataSet;
  cdsDados.Append;
  vUsuario := TDAO_Aluno.Read(cdsPesquisaCodigo.AsInteger);
  try
    cdsDadosCodigo.AsInteger := vUsuario.Codigo;
    cdsDadosNome.AsString := vUsuario.Nome;
    cdsDadosTelefone.AsString := vUsuario.Telefone;
    cdsDadosEnderecoLogradouro.AsString := vUsuario.Logradouro;
    cdsDadosEnderecoNumero.AsString := vUsuario.Numero;
    cdsDadosEnderecoCEP.AsString := vUsuario.CEP;
    cdsDadosEnderecoBairro.AsString := vUsuario.Bairro;
    cdsDadosEnderecoMunicipio.AsString := vUsuario.Municipio;
    cdsDadosEnderecoUF.AsString := vUsuario.UF;
    cdsDadosnascimento.AsDateTime := vUsuario.Nascimento;
    cdsDadosnaturalidadecidade.AsString := vUsuario.NaturalidadeMunicipio;
    cdsDadosnaturalidadeuf.AsString := vUsuario.NaturalidadeUF;
    cdsDadosdatacadastro.AsDateTime := vUsuario.DataCadastro;
    cdsDadosrg.AsString := vUsuario.RG;
    cdsDadosorgaorg.AsString := vUsuario.OrgaoExpeditorRG;
    cdsDadosdatarg.AsDateTime := vUsuario.DataExpedicaoRG;
    cdsDadoscpf.AsString := vUsuario.CPF;
    cdsDadoscertidao.AsString := vUsuario.CertidaoNascimento;
    cdsDadoscelular.AsString := vUsuario.Celular;
    cdsDadossexo.AsString := vUsuario.Sexo;
    cdsDadosnomeresp.AsString := vUsuario.ResponsavelNome;
    cdsDadosprofresp.AsString := vUsuario.ResponsavelProfissao;
    cdsDadostelefoneresp.AsString := vUsuario.ResponsavelTelefone;
    cdsDadostiposang.AsString := vUsuario.TipoSanguineo;
    cdsDadosfatorrh.AsString := vUsuario.FatorRh;
  finally
    vUsuario.Free;
  end;
  Operacao := oaAlterar;
  cxPageControl1.ActivePage := tabDados;
  DBEdit2.SetFocus;
end;

procedure TForm_Cadastro_Aluno.btnCancelarClick(Sender: TObject);
begin
  cxPageControl1.ActivePage := tabPesquisa;
  cdsDados.EmptyDataSet;
  Pesquisa;
end;

procedure TForm_Cadastro_Aluno.btnExcluirClick(Sender: TObject);
var
  vUsuario:TAluno;
begin
  if cdsPesquisa.IsEmpty then
    Exit;
  vUsuario := TDAO_Aluno.Read(cdsPesquisacodigo.AsInteger);
  try
    Self.Operacao := oaExcluir;
    if not TDAO_Aluno.Delete(vUsuario) then
      Application.MessageBox('Erro ao excluir o aluno', 'Erro', MB_ICONERROR)
    else
      cdsPesquisa.Delete;
  finally
    vUsuario.Free;
    Self.Operacao := oaSemOperacao;
  end;
end;

procedure TForm_Cadastro_Aluno.btnGravarClick(Sender: TObject);
var
  vCliente:TAluno;
begin
  vCliente := TAluno.Create;
  try
    vCliente.Codigo := cdsDadoscodigo.AsInteger;
    vCliente.Nome := cdsDadosNome.AsString;
    vCliente.Telefone := cdsDadosTelefone.AsString;
    vCliente.Logradouro := cdsDadosEnderecoLogradouro.AsString;
    vCliente.Numero := cdsDadosEnderecoNumero.AsString;
    vCliente.Bairro := cdsDadosEnderecoCEP.AsString;
    vCliente.Municipio := cdsDadosEnderecoMunicipio.AsString;
    vCliente.UF := cdsDadosEnderecoUF.AsString;
    vCliente.CEP := cdsDadosEnderecoCEP.AsString;
    vCliente.Nascimento := cdsDadosnascimento.AsDateTime;
    vCliente.NaturalidadeMunicipio := cdsDadosnaturalidadecidade.AsString;
    vCliente.NaturalidadeUF := cdsDadosnaturalidadeuf.AsString;
    vCliente.DataCadastro := cdsDadosdatacadastro.AsDateTime;
    vCliente.RG := cdsDadosrg.AsString;
    vCliente.OrgaoExpeditorRG := cdsDadosorgaorg.AsString;
    vCliente.DataExpedicaoRG := cdsDadosdatarg.AsDateTime;
    vCliente.CPF := cdsDadoscpf.AsString;
    vCliente.CertidaoNascimento := cdsDadoscertidao.AsString;
    vCliente.Celular := cdsDadoscelular.AsString;
    vCliente.Telefone := cdsDadosTelefone.AsString;
    vCliente.Sexo := cdsDadossexo.AsString;
    vCliente.ResponsavelNome := cdsDadosnomeresp.AsString;
    vCliente.ResponsavelProfissao := cdsDadosprofresp.AsString;
    vCliente.ResponsavelTelefone := cdsDadostelefoneresp.AsString;
    vCliente.TipoSanguineo := cdsDadostiposang.AsString;
    vCliente.FatorRh := cdsDadosfatorrh.AsString;


    if Self.Operacao = oaAlterar then
    begin
      if TDAO_Aluno.Update(vCliente) then
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
      if TDAO_Aluno.Create(vCliente) then
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
    vCliente.Free;
  end;
end;

procedure TForm_Cadastro_Aluno.btnIncluirClick(Sender: TObject);
begin
  cdsDados.EmptyDataSet;
  cdsDados.Append;
  Operacao := oaInserir;
  cxPageControl1.ActivePage := tabDados;
  DBEdit2.SetFocus;
end;

procedure TForm_Cadastro_Aluno.btnPesquisarClick(Sender: TObject);
begin
  Pesquisa;
end;

procedure TForm_Cadastro_Aluno.FormCreate(Sender: TObject);
begin
  cdsDados.CreateDataSet;
  cdsPesquisa.CreateDataSet;
end;

procedure TForm_Cadastro_Aluno.Pesquisa;
var
  vLista:TList;
  vCliente:TAluno;
begin
  cdsPesquisa.DisableControls;
  try
    cdsPesquisa.EmptyDataSet;
    case rgFiltro.ItemIndex of
    0:
      begin
        vCliente := TDAO_Aluno.Read(StrToIntDef(edtPesquisa.Text, 0));
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
    {1:
      begin
        vLista := TDAOCliente.Read(edtPesquisa.Text);
        if Assigned(vLista) then
        begin
          for i := 0 to vLista.Count - 1 do
          begin
            cdsPesquisa.Append;
            cdsPesquisaCodigo.AsInteger := TaCliente(vLista[i]).Codigo;
            cdsPesquisaNome.AsString := TCliente(vLista[i]).Nome;
            cdsPesquisaTelefone.AsString := TCliente(vLista[i]).Telefone;
            cdsPesquisa.Post;
          end;
          vLista.Free;
        end;
      end;}
    end;
  finally
    cdsPesquisa.EnableControls;
  end;
end;

procedure TForm_Cadastro_Aluno.SetOperacao(const Value: TOperacaoAluno);
begin
  FOperacao := Value;
end;

end.
