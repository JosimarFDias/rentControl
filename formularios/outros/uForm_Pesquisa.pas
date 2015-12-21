unit uForm_Pesquisa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.FMTBcd, Data.DB,
  Datasnap.DBClient, Datasnap.Provider, Data.SqlExpr, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue, dxSkinscxPCPainter, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, cxDBData, cxGridLevel,
  cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxContainer, Vcl.Menus, Vcl.StdCtrls, cxButtons,
  cxTextEdit, dxSkinsForm;

type
  TFormPesquisa = class(TForm)
    pnlFiltros: TPanel;
    SQLDataSet1: TSQLDataSet;
    DataSetProvider1: TDataSetProvider;
    ClientDataSet1: TClientDataSet;
    DataSource1: TDataSource;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    edtPesquisa: TcxTextEdit;
    btnPesquisa: TcxButton;
    Panel1: TPanel;
    btnSelecionar: TcxButton;
    procedure btnPesquisaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtPesquisaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxGrid1DBTableView1KeyPress(Sender: TObject; var Key: Char);
    procedure btnSelecionarClick(Sender: TObject);
    procedure cxGrid1DBTableView1DblClick(Sender: TObject);
  private
    FIDRetorno: Integer;
    procedure SetIDRetorno(const Value: Integer);
    { Private declarations }
  public
    { Public declarations }
    procedure PreparaPesquisaCliente;
    procedure PreparaPesquisaAmbiente;
    procedure PreparaPesquisaFornecedor;
    property IDRetorno:Integer read FIDRetorno write SetIDRetorno;
  end;

var
  FormPesquisa: TFormPesquisa;

implementation

{$R *.dfm}

uses uDM;

{ TForm2 }

procedure TFormPesquisa.btnPesquisaClick(Sender: TObject);
var
  i:Integer;
begin
  ClientDataSet1.Close;
  ClientDataSet1.Params[0].AsString := '%'+edtPesquisa.Text+'%';
  ClientDataSet1.Open;
  if cxGrid1DBTableView1.ColumnCount = 0 then
  begin
    for i := 0 to ClientDataSet1.Fields.Count - 1 do
    begin
      cxGrid1DBTableView1.CreateColumn;
      cxGrid1DBTableView1.Columns[i].DataBinding.FieldName := ClientDataSet1.Fields[i].FieldName;
    end;
  end;
end;

procedure TFormPesquisa.btnSelecionarClick(Sender: TObject);
begin
  if ClientDataSet1.IsEmpty then
    IDRetorno := 0
  else
    IDRetorno := ClientDataSet1.Fields[0].AsInteger;
  Self.Close;
end;

procedure TFormPesquisa.cxGrid1DBTableView1DblClick(Sender: TObject);
begin
  btnSelecionarClick(Sender);
end;

procedure TFormPesquisa.cxGrid1DBTableView1KeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
    btnSelecionarClick(Sender);
  if Key = #27 then
    edtPesquisa.SetFocus;
end;

procedure TFormPesquisa.edtPesquisaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    btnPesquisaClick(Sender);
  if Key = VK_DOWN then
    cxGrid1.SetFocus;
  if Key = VK_ESCAPE then
  begin
    IDRetorno := 0;
    Self.Close;
  end;
end;

procedure TFormPesquisa.FormShow(Sender: TObject);
begin
  edtPesquisa.SetFocus;
  btnPesquisaClick(Sender);
end;

procedure TFormPesquisa.PreparaPesquisaAmbiente;
begin
  Self.Caption := 'Pesquisa de Ambientes';
  SQLDataSet1.Close;
  SQLDataSet1.CommandText := '';
  SQLDataSet1.Params.Clear;
  ClientDataSet1.Params.Clear;
  SQLDataSet1.CommandText := 'select amb_cd_ambiente as codigo, amb_ds_ambiente as decricao from ambiente where amb_ds_ambiente like :descricao';
  SQLDataSet1.Params.CreateParam(ftString, 'descricao', ptInput);
  ClientDataSet1.Params.CreateParam(ftString, 'descricao', ptInput);
end;

procedure TFormPesquisa.PreparaPesquisaCliente;
begin
  Self.Caption := 'Pesquisa de Clientes';
  SQLDataSet1.Close;
  SQLDataSet1.CommandText := '';
  SQLDataSet1.Params.Clear;
  ClientDataSet1.Params.Clear;
  SQLDataSet1.CommandText := 'select cli_cd_cliente as codigo, cli_ds_cliente as nome from cliente where cli_ds_cliente like :descricao';
  SQLDataSet1.Params.CreateParam(ftString, 'descricao', ptInput);
  ClientDataSet1.Params.CreateParam(ftString, 'descricao', ptInput);
end;

procedure TFormPesquisa.PreparaPesquisaFornecedor;
begin
  Self.Caption := 'Pesquisa de Fornecedores';
  SQLDataSet1.Close;
  SQLDataSet1.CommandText := '';
  SQLDataSet1.Params.Clear;
  ClientDataSet1.Params.Clear;
  SQLDataSet1.CommandText := 'select for_cd_fornecedor as codigo, for_ds_fornecedor as nome from fornecedor where for_ds_fornecedor like :descricao';
  SQLDataSet1.Params.CreateParam(ftString, 'descricao', ptInput);
  ClientDataSet1.Params.CreateParam(ftString, 'descricao', ptInput);
end;

procedure TFormPesquisa.SetIDRetorno(const Value: Integer);
begin
  FIDRetorno := Value;
end;

end.
