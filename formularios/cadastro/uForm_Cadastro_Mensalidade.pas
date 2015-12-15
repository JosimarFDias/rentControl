unit uForm_Cadastro_Mensalidade;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, dxSkinsCore, LiderLaranja,
  dxSkinLiderMarmore, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, cxContainer,
  cxGroupBox, cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, Datasnap.DBClient, cxCheckBox,
  Contnrs, Vcl.Menus, Vcl.StdCtrls, cxButtons, cxLabel, cxTextEdit, cxMaskEdit,
  cxDropDownEdit;

type
  TFormCadastroMensalidade = class(TForm)
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGroupBox1: TcxGroupBox;
    cdsMensalidade: TClientDataSet;
    dsMensalidade: TDataSource;
    cdsMensalidadecodigo: TIntegerField;
    cdsMensalidadecliente_nome: TStringField;
    cdsCliente: TClientDataSet;
    cxGrid1DBTableView1cliente_nome: TcxGridDBColumn;
    cxGrid1DBTableView1mes_ano: TcxGridDBColumn;
    cxGrid1DBTableView1mes_ano1: TcxGridDBColumn;
    cxGrid1DBTableView1mes_ano2: TcxGridDBColumn;
    cxGrid1DBTableView1mes_ano3: TcxGridDBColumn;
    cxGrid1DBTableView1mes_ano4: TcxGridDBColumn;
    cdsMensalidademes_ano: TBooleanField;
    cdsMensalidademes_ano1: TBooleanField;
    cdsMensalidademes_ano2: TBooleanField;
    cdsMensalidademes_ano3: TBooleanField;
    cdsMensalidademes_ano4: TBooleanField;
    cxButton1: TcxButton;
    cxComboBox1: TcxComboBox;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxComboBox2: TcxComboBox;
    cxComboBox3: TcxComboBox;
    cxLabel3: TcxLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
  private
    { Private declarations }
    procedure CarregaMensalidades;
  public
    { Public declarations }
  end;

var
  FormCadastroMensalidade: TFormCadastroMensalidade;

implementation

{$R *.dfm}

uses uCDAO_Cliente, uC_Cliente, uC_Mensalidade, uCDAO_Mensalidade, uC_Receber,
  uc_Sistema, uCDAO_Receber;

procedure TFormCadastroMensalidade.CarregaMensalidades;
var
  vClientes:TList;
  vMensalidades:TObjectList;
  i: Integer;
  dia, mes, ano:Word;
  function GetExisteMensalidade(pCliente, pMes, pAno:Integer):Boolean;
  var
    j:Integer;
  begin
    Result := False;
    for j := 0 to vMensalidades.Count - 1 do
    begin
      if (TMensalidade(vMensalidades[j]).Cliente.Codigo = pCliente) and
         (TMensalidade(vMensalidades[j]).Mes = pMes) and
         (TMensalidade(vMensalidades[j]).Ano = pAno ) then
      begin
        Result := True;
        Break;
      end;
    end;
  end;
begin
  vClientes := TDAOCliente.Read('');
  if Assigned(vClientes) then
  begin
    cdsMensalidade.DisableControls;
    try
      cdsMensalidade.EmptyDataSet;
      for i := 0 to vClientes.Count - 1 do
      begin
        cdsMensalidade.Append;
        cdsMensalidadecodigo.AsInteger := TCliente(vClientes[i]).Codigo;
        cdsMensalidadecliente_nome.AsString := TCliente(vClientes[i]).Nome;
        cdsMensalidade.Post;
      end;
      vMensalidades := TDAOMensalidade.Read();
      if Assigned(vMensalidades) then
      begin
        try
          cdsMensalidade.First;
          while not cdsMensalidade.Eof do
          begin
            cdsMensalidade.Edit;
            DecodeDate(IncMonth(Date, -1), ano, mes, dia);
            cdsMensalidademes_ano.AsBoolean := GetExisteMensalidade(cdsMensalidadecodigo.AsInteger, mes, ano);
            DecodeDate(Date, ano, mes, dia);
            cdsMensalidademes_ano1.AsBoolean := GetExisteMensalidade(cdsMensalidadecodigo.AsInteger, mes, ano);
            DecodeDate(IncMonth(Date), ano, mes, dia);
            cdsMensalidademes_ano2.AsBoolean := GetExisteMensalidade(cdsMensalidadecodigo.AsInteger, mes, ano);
            DecodeDate(IncMonth(Date, 2), ano, mes, dia);
            cdsMensalidademes_ano3.AsBoolean := GetExisteMensalidade(cdsMensalidadecodigo.AsInteger, mes, ano);
            DecodeDate(IncMonth(Date, 3), ano, mes, dia);
            cdsMensalidademes_ano4.AsBoolean := GetExisteMensalidade(cdsMensalidadecodigo.AsInteger, mes, ano);
            cdsMensalidade.Post;
          end;
        finally
          vMensalidades.Free;
        end;
      end;
    finally
      vClientes.Free;
      cdsMensalidade.EnableControls;
    end;
  end;
end;

procedure TFormCadastroMensalidade.cxButton1Click(Sender: TObject);
var
  vTitulo:TReceber;
  vMensalidade:TMensalidade;
begin
  if cdsMensalidade.IsEmpty then
    Exit;
  vTitulo := TReceber.Create;
  try
    vTitulo.DataTitulo := Date;
    vTitulo.Cliente.GetValues(cdsMensalidadecodigo.AsInteger);
    vTitulo.Vencimento := StrToDate(cxComboBox2.Text+'/'+IntToStr(cxComboBox1.ItemIndex+1)+'/'+cxComboBox3.Text);
    vTitulo.Valor := Sistema.ValorMensalidadeEscolinha;
    vTitulo.Status := 'A';
    vTitulo.Historico := 'MENSALIDADE ESCOLINHA '+cxComboBox1.Text+'/'+cxComboBox3.Text;
    TDAOReceber.Create(vTitulo);
    vMensalidade := TMensalidade.Create;
    try
      vMensalidade.Cliente.GetValues(cdsMensalidadecodigo.AsInteger);
      vMensalidade.Mes := cxComboBox1.ItemIndex+1;
      vMensalidade.Ano := StrToInt(cxComboBox3.Text);
      vMensalidade.Titulo.GetValues(vTitulo.Codigo);
      TDAOMensalidade.Create(vMensalidade);
    finally
      vMensalidade.Free;
    end;
  finally
    vTitulo.Free;
  end;

end;

procedure TFormCadastroMensalidade.FormCreate(Sender: TObject);
begin
  cdsMensalidade.CreateDataSet;
  cdsCliente.CreateDataSet;
end;

procedure TFormCadastroMensalidade.FormShow(Sender: TObject);
var
  dia, mes, ano: Word;
begin
  DecodeDate(IncMonth(Date, -1), ano, mes, dia);
  cxGrid1DBTableView1mes_ano.Caption := IntToStr(mes)+'/'+IntToStr(ano);
  DecodeDate(Date, ano, mes, dia);
  cxGrid1DBTableView1mes_ano1.Caption := IntToStr(mes)+'/'+IntToStr(ano);
  DecodeDate(IncMonth(Date), ano, mes, dia);
  cxGrid1DBTableView1mes_ano2.Caption := IntToStr(mes)+'/'+IntToStr(ano);
  DecodeDate(IncMonth(Date, 2), ano, mes, dia);
  cxGrid1DBTableView1mes_ano3.Caption := IntToStr(mes)+'/'+IntToStr(ano);
  DecodeDate(IncMonth(Date, 3), ano, mes, dia);
  cxGrid1DBTableView1mes_ano4.Caption := IntToStr(mes)+'/'+IntToStr(ano);
end;

end.
