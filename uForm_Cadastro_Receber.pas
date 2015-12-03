unit uForm_Cadastro_Receber;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, LiderLaranja,
  dxSkinLiderMarmore, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue, dxSkinscxPCPainter, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData,
  Datasnap.DBClient, cxGridChartView, cxGridDBChartView, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, cxContainer, Vcl.Menus, cxCurrencyEdit, cxDBEdit, Vcl.StdCtrls,
  cxButtons, cxLabel, cxMaskEdit, cxDropDownEdit, cxCalendar, cxTextEdit;

type
  TFormCadastroReceber = class(TForm)
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
    dsDados: TDataSource;
    cdsDadosHistorico: TStringField;
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
  FormCadastroReceber: TFormCadastroReceber;

implementation

{$R *.dfm}

uses uC_Cliente, uCDAO_Cliente, uC_Receber, uCDAO_Receber, uForm_Pesquisa;

{ TForm2 }

procedure TFormCadastroReceber.cxButton1Click(Sender: TObject);
var
  vCliente:TCliente;
  vCodigo:Integer;
begin
  inherited;
  FormPesquisa := TFormPesquisa.Create(nil);
  FormPesquisa.PreparaPesquisaCliente;
  FormPesquisa.ShowModal;
  vCodigo := FormPesquisa.IDRetorno;
  FormPesquisa.Free;
  if vCodigo > 0 then
  begin
    try
      vCliente := TDAOCliente.Read(vCodigo);
      cdsDadosClienteCodigo.AsInteger := vCliente.Codigo;
      cdsDadosClienteNome.AsString := vCliente.Nome;
      Perform(CM_DialogKey, VK_TAB, 0);
    finally
      vCliente.Free;;
    end;
  end;
end;

procedure TFormCadastroReceber.cxButton2Click(Sender: TObject);
var
  vReceber:TReceber;
begin
  if not ValidaDados then
    Exit;
  vReceber := TReceber.Create;
  try
    if Self.Operacao = 'I' then
    begin
      vReceber.Codigo := 0;
      vReceber.DataTitulo := Date;
      vReceber.Cliente.Codigo := cdsDadosClienteCodigo.AsInteger;
      vReceber.Vencimento := cdsDadosVencimento.AsDateTime;
      vReceber.Valor := cdsDadosValor.AsFloat;
      vReceber.Status := 'A';
      vReceber.DataPagamento := 0;
      vReceber.ValorPago := 0;
      vReceber.CodigoContaOrigem := 0;
      vReceber.Historico := cdsDadosHistorico.AsString;
      if TDAOReceber.Create(vReceber) then
      begin
        Application.MessageBox('Salvo com sucesso!', 'RentControl', MB_ICONASTERISK);
        Self.Close;
      end
      else
        Application.MessageBox('Erro ao salvar!', 'RentControl', MB_ICONERROR);
    end
    else
    begin
      vReceber.Codigo := cdsDadosCodigo.AsInteger;
      vReceber.DataTitulo := cdsDadosDataTitulo.AsDateTime;
      vReceber.Cliente.Codigo := cdsDadosClienteCodigo.AsInteger;
      vReceber.Vencimento := cdsDadosVencimento.AsDateTime;
      vReceber.Valor := cdsDadosValor.AsFloat;
      vReceber.Status := 'A';
      vReceber.DataPagamento := 0;
      vReceber.ValorPago := 0;
      vReceber.CodigoContaOrigem := 0;
      vReceber.Historico := cdsDadosHistorico.AsString;
      if TDAOReceber.Update(vReceber) then
      begin
        Application.MessageBox('Salvo com sucesso!', 'RentControl', MB_ICONASTERISK);
        Self.Close;
      end
      else
        Application.MessageBox('Erro ao salvar!', 'RentControl', MB_ICONERROR);
    end;
  finally
    vReceber.Free;
  end;
end;

procedure TFormCadastroReceber.cxButton3Click(Sender: TObject);
begin
  Self.Close;
end;

procedure TFormCadastroReceber.cxDBTextEdit1KeyPress(Sender: TObject; var Key: Char);
var
  vCliente:TCliente;
begin
  if Key = #13 then
  begin
    vCliente := nil;
    if (cxDBTextEdit1.Text = '') or (cxDBTextEdit1.Text = '')then
    begin
      FormPesquisa := TFormPesquisa.Create(nil);
      FormPesquisa.PreparaPesquisaCliente;
      FormPesquisa.ShowModal;
      vCliente := TDAOCliente.Read(FormPesquisa.IDRetorno);
      FormPesquisa.Free;
    end;
    if Assigned(vCliente) then
    begin
      cdsDadosClienteCodigo.AsInteger := vCliente.Codigo;
      cdsDadosClienteNome.AsString := vCliente.Nome;
      FreeAndNil(vCliente);
    end
    else
    begin
      vCliente := TDAOCliente.Read(StrToIntDef(cxDBTextEdit1.Text, 0));

      if not Assigned(vCliente) then
      begin
        cxDBTextEdit1.SetFocus;
        ShowMessage('Atenção!'+#13+#10+'Cliente não encontrado');
      end
      else
      begin
        cdsDadosClienteNome.AsString := vCliente.Nome;
        vCliente.Free;
      end;
    end;
  end;
end;

procedure TFormCadastroReceber.FormCreate(Sender: TObject);
begin
  cdsDados.CreateDataSet;
end;

procedure TFormCadastroReceber.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_RETURN) then
    Perform (CM_DIALOGKEY, VK_TAB, 0)
  else if (Key = VK_ESCAPE) then
    Perform(WM_NEXTDLGCTL,1,0);
end;

procedure TFormCadastroReceber.FormShow(Sender: TObject);
var
  vTitulo:TReceber;
begin
  if Self.Operacao = 'A' then
  begin
    vTitulo := TDAOReceber.Read(Self.Titulo);
    if Assigned(vTitulo) then
    begin
      cdsDados.Edit;
      cdsDadosCodigo.AsInteger := vTitulo.Codigo;
      cdsDadosDataTitulo.AsDateTime := vTitulo.DataTitulo;
      cdsDadosClienteCodigo.AsInteger := vTitulo.Cliente.Codigo;
      cdsDadosClienteNome.AsString := vTitulo.Cliente.Nome;
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

procedure TFormCadastroReceber.SetOperacao(const Value: string);
begin
  FOperacao := Value;
end;

procedure TFormCadastroReceber.SetTitulo(const Value: Integer);
begin
  FTitulo := Value;
end;

function TFormCadastroReceber.ValidaDados: Boolean;
var
  vCliente:TCliente;
begin
  Result := False;
  vCliente := TDAOCliente.Read(cdsDadosClienteCodigo.AsInteger);
  if not Assigned(vCliente) then
  begin
    cxDBTextEdit1.SetFocus;
    raise Exception.Create('Cliente inválido');
  end;
  if cdsDadosValor.AsFloat <= 0 then
  begin
    cxDBCurrencyEdit1.SetFocus;
    raise Exception.Create('Valor inválido');
  end;
  Result := True;
end;

end.
