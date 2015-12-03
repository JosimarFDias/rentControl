unit uForm_Cadastro_Pagar;

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
  dxSkinWhiteprint, dxSkinXmas2008Blue, Vcl.Menus, Data.DB, Datasnap.DBClient,
  cxCurrencyEdit, cxDBEdit, Vcl.StdCtrls, cxButtons, cxLabel, cxMaskEdit,
  cxDropDownEdit, cxCalendar, cxTextEdit;

type
  TFormCadastroPagar = class(TForm)
    cxDBTextEdit1: TcxDBTextEdit;
    cxDBDateEdit1: TcxDBDateEdit;
    cxLabel1: TcxLabel;
    cxDBTextEdit2: TcxDBTextEdit;
    cxButton1: TcxButton;
    cxLabel2: TcxLabel;
    cxDBCurrencyEdit1: TcxDBCurrencyEdit;
    cxLabel3: TcxLabel;
    cxDBTextEdit3: TcxDBTextEdit;
    cxLabel4: TcxLabel;
    cxButton2: TcxButton;
    cxButton3: TcxButton;
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
    cdsDadosFornecedorNome: TStringField;
    cdsDadosFornecedorCodigo: TIntegerField;
    procedure cxButton2Click(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton3Click(Sender: TObject);
    procedure cxDBTextEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    FOperacao: string;
    FTitulo: Integer;
    { Private declarations }
    function ValidaDados:Boolean;
    procedure SetOperacao(const Value: string);
    procedure SetTitulo(const Value: Integer);
  public
    { Public declarations }
    property Operacao:string read FOperacao write SetOperacao;
    property Titulo:Integer read FTitulo write SetTitulo;
  end;

var
  FormCadastroPagar: TFormCadastroPagar;

implementation

{$R *.dfm}

uses uC_Pagar, uC_Fornecedor, uCDAO_Fornecedor, uCDAO_Pagar, uForm_Pesquisa;

procedure TFormCadastroPagar.cxButton1Click(Sender: TObject);
var
  vFornecedor:TFornecedor;
  vCodigo:Integer;
begin
  inherited;
  FormPesquisa := TFormPesquisa.Create(nil);
  FormPesquisa.PreparaPesquisaFornecedor;
  FormPesquisa.ShowModal;
  vCodigo := FormPesquisa.IDRetorno;
  FormPesquisa.Free;
  if vCodigo > 0 then
  begin
    try
      vFornecedor := TDAOFornecedor.Read(vCodigo);
      cdsDadosFornecedorCodigo.AsInteger := vFornecedor.Codigo;
      cdsDadosFornecedorNome.AsString := vFornecedor.Nome;
      Perform(CM_DialogKey, VK_TAB, 0);
    finally
      vFornecedor.Free;;
    end;
  end;
end;

procedure TFormCadastroPagar.cxButton2Click(Sender: TObject);
var
  vPagar:TPagar;
begin
  if not ValidaDados then
    Exit;
  vPagar := TPagar.Create;
  try
    if Self.Operacao = 'I' then
    begin
      vPagar.Codigo := 0;
      vPagar.DataTitulo := Date;
      vPagar.Fornecedor.Codigo := cdsDadosFornecedorCodigo.AsInteger;
      vPagar.Vencimento := cdsDadosVencimento.AsDateTime;
      vPagar.Valor := cdsDadosValor.AsFloat;
      vPagar.Status := 'A';
      vPagar.DataPagamento := 0;
      vPagar.ValorPago := 0;
      vPagar.Historico := cdsDadosHistorico.AsString;
      if TDAOPagar.Create(vPagar) then
      begin
        Application.MessageBox('Salvo com sucesso!', 'RentControl', MB_ICONASTERISK);
        Self.Close;
      end
      else
        Application.MessageBox('Erro ao salvar!', 'RentControl', MB_ICONERROR);
    end
    else
    begin
      vPagar.Codigo := cdsDadosCodigo.AsInteger;
      vPagar.DataTitulo := cdsDadosDataTitulo.AsDateTime;
      vPagar.Fornecedor.Codigo := cdsDadosFornecedorCodigo.AsInteger;
      vPagar.Vencimento := cdsDadosVencimento.AsDateTime;
      vPagar.Valor := cdsDadosValor.AsFloat;
      vPagar.Status := 'A';
      vPagar.DataPagamento := 0;
      vPagar.ValorPago := 0;
      vPagar.Historico := cdsDadosHistorico.AsString;
      if TDAOPagar.Update(vPagar) then
      begin
        Application.MessageBox('Salvo com sucesso!', 'RentControl', MB_ICONASTERISK);
        Self.Close;
      end
      else
        Application.MessageBox('Erro ao salvar!', 'RentControl', MB_ICONERROR);
    end;
  finally
    vPagar.Free;
  end;
end;

procedure TFormCadastroPagar.cxButton3Click(Sender: TObject);
begin
  Self.Close;
end;

procedure TFormCadastroPagar.cxDBTextEdit1KeyPress(Sender: TObject; var Key: Char);
var
  vFornecedor:TFornecedor;
begin
  if Key = #13 then
  begin
    vFornecedor := nil;
    if (cxDBTextEdit1.Text = '') or (cxDBTextEdit1.Text = '')then
    begin
      FormPesquisa := TFormPesquisa.Create(nil);
      FormPesquisa.PreparaPesquisaFornecedor;
      FormPesquisa.ShowModal;
      vFornecedor := TDAOFornecedor.Read(FormPesquisa.IDRetorno);
      FormPesquisa.Free;
    end;

    if Assigned(vFornecedor) then
    begin
      cdsDadosFornecedorCodigo.AsInteger := vFornecedor.Codigo;
      cdsDadosFornecedorNome.AsString := vFornecedor.Nome;
      FreeAndNil(vFornecedor);
    end
    else
    begin
      vFornecedor := TDAOFornecedor.Read(StrToIntDef(cxDBTextEdit1.Text, 0));

      if not Assigned(vFornecedor) then
      begin
        cxDBTextEdit1.SetFocus;
        ShowMessage('Atenção!'+#13+#10+'Fornecedor não encontrado');
      end
      else
      begin
        cdsDadosFornecedorNome.AsString := vFornecedor.Nome;
        vFornecedor.Free;
      end;
    end;
  end;
end;

procedure TFormCadastroPagar.FormCreate(Sender: TObject);
begin
  cdsDados.CreateDataSet;
end;

procedure TFormCadastroPagar.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_RETURN) then
    Perform (CM_DIALOGKEY, VK_TAB, 0)
  else if (Key = VK_ESCAPE) then
    Perform(WM_NEXTDLGCTL,1,0);
end;

procedure TFormCadastroPagar.FormShow(Sender: TObject);
var
  vTitulo:TPagar;
begin
  if Self.Operacao = 'A' then
  begin
    vTitulo := TDAOPagar.Read(Self.Titulo);
    if Assigned(vTitulo) then
    begin
      cdsDados.Edit;
      cdsDadosCodigo.AsInteger := vTitulo.Codigo;
      cdsDadosDataTitulo.AsDateTime := vTitulo.DataTitulo;
      cdsDadosFornecedorCodigo.AsInteger := vTitulo.Fornecedor.Codigo;
      cdsDadosFornecedorNome.AsString := vTitulo.Fornecedor.Nome;
      cdsDadosVencimento.AsDateTime := vTitulo.Vencimento;
      cdsDadosValor.AsCurrency := vTitulo.Valor;
      cdsDadosStatus.AsString := vTitulo.Status;
      cdsDadosValorPago.AsCurrency := vTitulo.ValorPago;
      cdsDadosHistorico.AsString := vTitulo.Historico;
      vTitulo.Free;
    end;
  end
  else
  begin
    cdsDados.Append;
    cdsDadosDataTitulo.AsDateTime := Date;
    cdsDadosVencimento.AsDateTime := Date+30;
  end;
  cxDBTextEdit1.SetFocus;
end;

procedure TFormCadastroPagar.SetOperacao(const Value: string);
begin
  FOperacao := Value;
end;

procedure TFormCadastroPagar.SetTitulo(const Value: Integer);
begin
  FTitulo := Value;
end;

function TFormCadastroPagar.ValidaDados: Boolean;
var
  vFornecedor:TFornecedor;
begin
  Result := False;
  vFornecedor := TDAOFornecedor.Read(cdsDadosFornecedorCodigo.AsInteger);
  if not Assigned(vFornecedor) then
  begin
    cxDBTextEdit1.SetFocus;
    raise Exception.Create('Fornecedor inválido');
  end;
  if cdsDadosValor.AsFloat <= 0 then
  begin
    cxDBCurrencyEdit1.SetFocus;
    raise Exception.Create('Valor inválido');
  end;
  Result := True;
end;

end.
