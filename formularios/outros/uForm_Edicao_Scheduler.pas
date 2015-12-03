unit uForm_Edicao_Scheduler;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
  dxSkinOffice2010Silver, Data.DB, Datasnap.DBClient, dxBevel, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.Mask, Vcl.DBCtrls, cxGroupBox, cxRadioGroup, cxDBEdit,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, DateUtils, Vcl.Menus,
  cxButtons, Vcl.ExtCtrls, dxSkinBlack,
  dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue, uC_Agenda,
  LiderLaranja, dxSkinLiderMarmore, cxLabel;

type
  TForm_Edicao_Scheduler = class(TForm)
    cxDBDateEdit2: TcxDBDateEdit;
    cxDBDateEdit1: TcxDBDateEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    dxBevel1: TdxBevel;
    Label1: TLabel;
    Panel1: TPanel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    cdsDados: TClientDataSet;
    dsDados: TDataSource;
    cdsDadosCODIGO: TIntegerField;
    cdsDadosCODCLIENTE: TIntegerField;
    cdsDadosNOMECLIENTE: TStringField;
    cdsDadosINICIO: TDateTimeField;
    cdsDadosFIM: TDateTimeField;
    cdsDadosDATAAGENDA: TDateField;
    cdsDadosDESCRICAO: TStringField;
    cdsDadosCODAMBIENTE: TIntegerField;
    cdsDadosSTATUS: TStringField;
    cdsDadosPACOTE: TStringField;
    cdsDadosVALOR: TFloatField;
    cxDBRadioGroup2: TcxDBRadioGroup;
    cxComboBox1: TcxComboBox;
    Label6: TLabel;
    cxLabel1: TcxLabel;
    cxDBTextEdit1: TcxDBTextEdit;
    cxDBTextEdit2: TcxDBTextEdit;
    cxButton3: TcxButton;
    cxDBTextEdit3: TcxDBTextEdit;
    cxDBTextEdit4: TcxDBTextEdit;
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cxDBTextEdit2KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    function Valida:Boolean;
  public
    { Public declarations }
    function Gravar():boolean;
    function Editar(pCodigo:string):boolean;
    function Incluir():boolean;
    function Novo(vAmbiente:Integer; pInicio, pFim:TDateTime):boolean;
    function Cancelar():boolean;
  end;

var
  vAgenda:TAgenda;
  Form_Edicao_Scheduler: TForm_Edicao_Scheduler;
  Incluindo: Boolean;

implementation

{$R *.dfm}

uses udm, uC_Cliente, uC_Ambiente, uForm_Cadastro_Scheduler_Ribbon,
  uCDAO_Agenda, uForm_Pesquisa, uCDAO_Cliente, uCDAO_Ambiente,
  uFormAgendamentoPacote;

{ TForm_Edicao_Scheduler }

procedure TForm_Edicao_Scheduler.BitBtn1Click(Sender: TObject);
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
      cdsDadosCODCLIENTE.AsInteger := vCliente.Codigo;
      cdsDadosNOMECLIENTE.AsString := vCliente.Nome;
      Perform(CM_DialogKey, VK_TAB, 0);
    finally
      vCliente.Free;;
    end;

  end;
end;

procedure TForm_Edicao_Scheduler.btnCancelarClick(Sender: TObject);
begin
  Cancelar();
  Self.Close;
end;

procedure TForm_Edicao_Scheduler.btnConfirmarClick(Sender: TObject);
begin
  if not Valida then
    Exit;
  if cdsDados.State in [dsEdit,dsinsert] then
    if cdsDados.State = dsEdit then
      Incluindo := False;
  if Incluindo then
    Incluir()
  else
    Gravar();
  Self.Close;
end;

function TForm_Edicao_Scheduler.Cancelar: boolean;
begin
  if not (vAgenda = nil) then
    vAgenda.Free;
end;

procedure TForm_Edicao_Scheduler.cxDBTextEdit2KeyPress(Sender: TObject;
  var Key: Char);
var
  vCliente:TCliente;
begin
  inherited;
  if Key = #13 then
  begin
    vCliente := nil;
    if (cxDBTextEdit2.Text = '') or (cxDBTextEdit2.Text = '')then
    begin
      FormPesquisa := TFormPesquisa.Create(nil);
      FormPesquisa.PreparaPesquisaCliente;
      FormPesquisa.ShowModal;
      vCliente := TDAOCliente.Read(FormPesquisa.IDRetorno);
      FormPesquisa.Free;
    end;

    if Assigned(vCliente) then
    begin
      cdsDadosCODCLIENTE.AsInteger := vCliente.Codigo;
      cdsDadosNOMECLIENTE.AsString := vCliente.Nome;
      FreeAndNil(vCliente);
    end
    else
    begin
      vCliente := TDAOCliente.Read(StrToIntDef(cxDBTextEdit2.Text, 0));

      if not Assigned(vCliente) then
      begin
        cxDBTextEdit2.SetFocus;
        ShowMessage('Atenção!'+#13+#10+'Cliente não encontrado');
      end
      else
      begin
        cdsDadosNOMECLIENTE.AsString := vCliente.Nome;
        vCliente.Free;
      end;
    end;
  end;
end;

function TForm_Edicao_Scheduler.Editar(pCodigo: string): boolean;
begin
  try
    vAgenda := TDAOAgenda.Read(StrToIntDef(pCodigo, 0));
    cdsDados.EmptyDataSet;
    cdsDados.Append;
    cdsDadosCODIGO.AsInteger := vAgenda.Codigo;
    cdsDadosCODCLIENTE.AsInteger := vAgenda.Cliente.Codigo;
    cdsDadosNOMECLIENTE.AsString := vAgenda.Cliente.Nome;;
    cdsDadosINICIO.AsDateTime := vAgenda.DataHoraInicio;
    cdsDadosFIM.AsDateTime := vAgenda.DataHoraFim;
    cdsDadosCODAMBIENTE.AsInteger := vAgenda.Ambiente.Codigo;
    cdsDadosDATAAGENDA.AsDateTime := vAgenda.DataAgendamento;
    cdsDadosDESCRICAO.AsString := vAgenda.Observacoes;
    cdsDadosSTATUS.AsString := vAgenda.Status;
    cdsDados.Post;
  except
    vAgenda.Free;
  raise;
  end;
  cdsDados.Edit;
end;

procedure TForm_Edicao_Scheduler.FormCreate(Sender: TObject);
begin
  cdsDados.CreateDataSet;
  vAgenda := TAgenda.Create;
end;

procedure TForm_Edicao_Scheduler.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_RETURN) then
    Perform (CM_DIALOGKEY, VK_TAB, 0)
  else if (Key = VK_ESCAPE) then
    Perform(WM_NEXTDLGCTL,1,0);
end;

procedure TForm_Edicao_Scheduler.FormShow(Sender: TObject);
begin
  cxDBTextEdit2.SetFocus;
end;

function TForm_Edicao_Scheduler.Gravar: boolean;
begin
  Result := True;
  try
    vAgenda.Codigo := cdsDadosCODIGO.AsInteger;
    vAgenda.Ambiente.Codigo := cdsDadosCODAMBIENTE.AsInteger;
    vAgenda.Cliente.Codigo := cdsDadosCODCLIENTE.AsInteger;
    vAgenda.DataHoraInicio := cdsDadosINICIO.AsDateTime;
    vAgenda.DataHoraFim := cdsDadosFIM.AsDateTime;
    vAgenda.DataAgendamento := cdsDadosDATAAGENDA.AsDateTime;
    vAgenda.Observacoes := cdsDadosDESCRICAO.AsString;
    vAgenda.Status := cdsDadosSTATUS.AsString;

    if not TDAOAgenda.Update(vAgenda) then
      Exception.Create('Erro ao gravar');
  except
    Result := False;
  end;
  vAgenda.Free;
end;

function TForm_Edicao_Scheduler.Incluir: boolean;
var
  vQtde:Integer;
  i: Integer;
  aValorAgenda, aValorPadrao, aValorNoite, aPercDesconto:Currency;
  aHoraInicial, aHoraFinal:TTime;
  aDia, aMes, aAno, aHora, aMinuto, aSegundo, aMilisegundo:Word;
  vAmbiente:TAmbiente;
  vArray, vArrayFinal:array[1..8]of TDateTime;
begin
  Result := False;
  try
    if not TDAOAgenda.VerificaHorarioDisponivel(cdsDadosINICIO.AsDateTime, cdsDadosFIM.AsDateTime, cdsDadosCODAMBIENTE.AsInteger) then
    begin
      cxDBDateEdit1.SetFocus;
      raise Exception.Create('Já existe um agendamento marcado neste ambiente no período selecionado');
    end;
    vAmbiente := TDAOAmbiente.Read(cdsDadosCODAMBIENTE.AsInteger);
    try
      aValorPadrao := vAmbiente.ValorPadrao;
      aValorNoite  := vAmbiente.ValorNoite;
      aPercDesconto := vAmbiente.DescontoPacote;
    finally
      vAmbiente.Free;
    end;

    if cdsDadosPACOTE.AsString = 'S' then
    begin
      FormAgendamentoPacote := TFormAgendamentoPacote.Create(nil);
      FormAgendamentoPacote.cxDateEdit1.Date := cdsDadosINICIO.AsDateTime;
      FormAgendamentoPacote.cxDateEdit9.Date := cdsDadosFIM.AsDateTime;

      if StrToInt(cxComboBox1.Text) = 8 then
      begin
        FormAgendamentoPacote.cxDateEdit5.Visible := True;
        FormAgendamentoPacote.cxDateEdit6.Visible := True;
        FormAgendamentoPacote.cxDateEdit7.Visible := True;
        FormAgendamentoPacote.cxDateEdit8.Visible := True;

        FormAgendamentoPacote.cxDateEdit13.Visible := True;
        FormAgendamentoPacote.cxDateEdit14.Visible := True;
        FormAgendamentoPacote.cxDateEdit15.Visible := True;
        FormAgendamentoPacote.cxDateEdit16.Visible := True;
      end;
      if StrToInt(cxComboBox1.Text) = 7 then
      begin
        FormAgendamentoPacote.cxDateEdit5.Visible := True;
        FormAgendamentoPacote.cxDateEdit6.Visible := True;
        FormAgendamentoPacote.cxDateEdit7.Visible := True;

        FormAgendamentoPacote.cxDateEdit13.Visible := True;
        FormAgendamentoPacote.cxDateEdit14.Visible := True;
        FormAgendamentoPacote.cxDateEdit15.Visible := True;
      end;
      if StrToInt(cxComboBox1.Text) = 6 then
      begin
        FormAgendamentoPacote.cxDateEdit5.Visible := True;
        FormAgendamentoPacote.cxDateEdit6.Visible := True;

        FormAgendamentoPacote.cxDateEdit13.Visible := True;
        FormAgendamentoPacote.cxDateEdit14.Visible := True;
      end;
      if StrToInt(cxComboBox1.Text) = 5 then
      begin
        FormAgendamentoPacote.cxDateEdit5.Visible := True;

        FormAgendamentoPacote.cxDateEdit13.Visible := True;
      end;

      FormAgendamentoPacote.ShowModal;
      vArray[1] := FormAgendamentoPacote.cxDateEdit1.Date;
      vArray[2] := FormAgendamentoPacote.cxDateEdit2.Date;
      vArray[3] := FormAgendamentoPacote.cxDateEdit3.Date;
      vArray[4] := FormAgendamentoPacote.cxDateEdit4.Date;
      vArray[5] := FormAgendamentoPacote.cxDateEdit5.Date;
      vArray[6] := FormAgendamentoPacote.cxDateEdit6.Date;
      vArray[7] := FormAgendamentoPacote.cxDateEdit7.Date;
      vArray[8] := FormAgendamentoPacote.cxDateEdit8.Date;

      vArrayFinal[1] := FormAgendamentoPacote.cxDateEdit9.Date;
      vArrayFinal[2] := FormAgendamentoPacote.cxDateEdit10.Date;
      vArrayFinal[3] := FormAgendamentoPacote.cxDateEdit11.Date;
      vArrayFinal[4] := FormAgendamentoPacote.cxDateEdit12.Date;
      vArrayFinal[5] := FormAgendamentoPacote.cxDateEdit13.Date;
      vArrayFinal[6] := FormAgendamentoPacote.cxDateEdit14.Date;
      vArrayFinal[7] := FormAgendamentoPacote.cxDateEdit15.Date;
      vArrayFinal[8] := FormAgendamentoPacote.cxDateEdit16.Date;

      FreeAndNil(FormAgendamentoPacote);
      vQtde := StrToInt(cxComboBox1.Text);

      for i := 1 to StrToInt(cxComboBox1.Text) do
      begin
        DecodeDateTime(vArray[i], aAno, aMes, aDia, aHora, aMinuto, aSegundo, aMilisegundo);
        if (aHora) >= 18 then
          aValorAgenda := (aValorNoite  - (aValorNoite * (aPercDesconto/100)))
        else
          aValorAgenda := (aValorPadrao - (aValorPadrao * (aPercDesconto/100)));

        if HoursBetween(vArray[i], vArrayFinal[i]) <= 0 then
          aValorAgenda := aValorAgenda
        else
          aValorAgenda := aValorAgenda * HoursBetween(vArray[i], vArrayFinal[i]);

        vAgenda.Codigo := 0;
        vAgenda.Ambiente.Codigo := cdsDadosCODAMBIENTE.AsInteger;
        vAgenda.Cliente.Codigo  := cdsDadosCODCLIENTE.AsInteger;
        vAgenda.DataHoraInicio  := vArray[i];
        vAgenda.DataHoraFim     := vArrayFinal[i];
        vAgenda.DataAgendamento := cdsDadosDATAAGENDA.AsDateTime;
        vAgenda.Observacoes     := cdsDadosDESCRICAO.AsString;
        vAgenda.Status          := cdsDadosSTATUS.AsString;
        vAgenda.Pacote          := (cdsDadosPACOTE.AsString = 'S');
        vAgenda.Valor           := aValorAgenda;
        if not TDAOAgenda.Create(vAgenda) then
          raise Exception.Create('Erro ao Incluir');
      end;
    end
    else
    begin
      vQtde := 1;
      DecodeDateTime(cdsDadosINICIO.AsDateTime, aAno, aMes, aDia, aHora, aMinuto, aSegundo, aMilisegundo);
      if (aHora) >= 18 then
        aValorAgenda := aValorNoite
      else
        aValorAgenda := aValorPadrao;
      if HoursBetween(cdsDadosINICIO.AsDateTime, cdsDadosFIM.AsDateTime) <= 0 then
        aValorAgenda := aValorAgenda
      else
        aValorAgenda := aValorAgenda * HoursBetween(cdsDadosINICIO.AsDateTime, cdsDadosFIM.AsDateTime);
      vAgenda.Codigo := 0;
      vAgenda.Ambiente.Codigo := cdsDadosCODAMBIENTE.AsInteger;
      vAgenda.Cliente.Codigo  := cdsDadosCODCLIENTE.AsInteger;
      vAgenda.DataHoraInicio  := cdsDadosINICIO.AsDateTime;
      vAgenda.DataHoraFim     := cdsDadosFIM.AsDateTime;
      vAgenda.DataAgendamento := cdsDadosDATAAGENDA.AsDateTime;
      vAgenda.Observacoes     := cdsDadosDESCRICAO.AsString;
      vAgenda.Status          := cdsDadosSTATUS.AsString;
      vAgenda.Pacote          := (cdsDadosPACOTE.AsString = 'S');
      vAgenda.Valor           := aValorAgenda;
      if not TDAOAgenda.Create(vAgenda) then
        raise Exception.Create('Erro ao Incluir');
    end;
    Result := True;
    vAgenda.Free;
  finally

  end;
end;

function TForm_Edicao_Scheduler.Novo(vAmbiente:Integer; pInicio, pFim:TDateTime): boolean;
begin
  vAgenda := TAgenda.Create;
  Incluindo := True;

  if not(cdsDados.IsEmpty) then
    cdsDados.EmptyDataSet;

  vAmbiente := Form_Cadastro_Scheduler_Ribbon.dxBarLookupCombo1.KeyValue;

  cdsDados.Append;
  cdsDadosCODAMBIENTE.AsInteger := vAmbiente;
  cdsDadosINICIO.AsDateTime     := pInicio;
  cdsDadosFIM.AsDateTime        := pFim-0.00001;
  cdsDadosSTATUS.AsString       := 'A';
  cdsDadosDATAAGENDA.AsDateTime := EncodeDate(YearOf(cdsDadosINICIO.AsDateTime), MonthOf(cdsDadosINICIO.AsDateTime), DayOf(cdsDadosINICIO.AsDateTime));
  cdsDadosPACOTE.AsString       := 'N';
end;

function TForm_Edicao_Scheduler.Valida: Boolean;
var
  vCliente:TCliente;
begin
  Result := False;
  vCliente := TDAOCliente.Read(cdsDadosCODCLIENTE.AsInteger);
  if Assigned(vCliente) then
    vCliente.Free
  else
    raise Exception.Create('Cliente inválido!');
  if cdsDadosINICIO.AsDateTime >= cdsDadosFIM.AsDateTime then
    raise Exception.Create('Data/hora de inícial maior ou igual que horário final');
  Result := True;
end;

end.

