unit uForm_ConfiguracoesSistema;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Vcl.Menus, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue, cxControls, cxContainer, cxEdit,
  cxLabel, cxTextEdit, cxMaskEdit, cxSpinEdit, cxTimeEdit, cxGroupBox,
  Vcl.StdCtrls, cxButtons, Vcl.ExtCtrls, cxCurrencyEdit, Data.DB,
  Datasnap.DBClient, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox;

type
  TFormConfiguracoesSistema = class(TForm)
    Panel1: TPanel;
    btnGravar: TcxButton;
    gbHorarioExpediente: TcxGroupBox;
    tmInicioExpediente: TcxTimeEdit;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    tmFimExpediente: TcxTimeEdit;
    gbEscolinha: TcxGroupBox;
    edtValorEscolinha: TcxCurrencyEdit;
    cxLabel3: TcxLabel;
    gbFinanceiro: TcxGroupBox;
    cdsContas: TClientDataSet;
    dsContas: TDataSource;
    cdsContascodigo: TIntegerField;
    cdsContasdescricao: TStringField;
    dblIDContaPrincipal: TcxDBLookupComboBox;
    cxLabel4: TcxLabel;
    ClientDataSet1: TClientDataSet;
    IntegerField1: TIntegerField;
    DataSource1: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure ListaContas;
  public
    { Public declarations }
  end;

var
  FormConfiguracoesSistema: TFormConfiguracoesSistema;

implementation

{$R *.dfm}

uses uc_Sistema, uCDAO_Sistema, uC_Conta, uCDAO_Conta;

procedure TFormConfiguracoesSistema.btnGravarClick(Sender: TObject);
begin
  Sistema.InicioExpediente := tmInicioExpediente.Time;
  Sistema.FimExpediente := tmFimExpediente.Time;
  Sistema.ValorMensalidadeEscolinha := edtValorEscolinha.Value;
  Sistema.IdContaPricipal := IntegerField1.AsInteger;
  if TDAOSistema.Update(Sistema) then
  begin
    Application.MessageBox('Atualizado com sucesso!', 'RentControl', MB_ICONASTERISK);
    Self.Close;
  end;
end;

procedure TFormConfiguracoesSistema.FormCreate(Sender: TObject);
begin
  ClientDataSet1.CreateDataSet;
  ClientDataSet1.Edit;
  cdsContas.CreateDataSet;
  ListaContas;
  tmInicioExpediente.Time := Sistema.InicioExpediente;
  tmFimExpediente.Time := Sistema.FimExpediente;
  edtValorEscolinha.Value := Sistema.ValorMensalidadeEscolinha;
  IntegerField1.AsInteger := Sistema.IdContaPricipal;
end;

procedure TFormConfiguracoesSistema.FormShow(Sender: TObject);
begin
  tmInicioExpediente.SetFocus;
end;

procedure TFormConfiguracoesSistema.ListaContas;
var
  vLista:TList;
  i: Integer;
begin
  cdsContas.EmptyDataSet;
  vLista := TDAO_Conta.Read('');
  if Assigned(vLista) then
  begin
    cdsContas.DisableControls;
    try
      for i := 0 to vLista.Count - 1 do
      begin
        cdsContas.Append;
        cdsContascodigo.AsInteger := TConta(vLista[i]).Codigo;
        cdsContasdescricao.AsString := TConta(vLista[i]).Descricao;
        cdsContas.Post
      end;
    finally
      cdsContas.EnableControls;
    end;
  end;
end;

end.
