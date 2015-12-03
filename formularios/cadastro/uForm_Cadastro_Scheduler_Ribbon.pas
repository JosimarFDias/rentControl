unit uForm_Cadastro_Scheduler_Ribbon;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, 
  dxBar, dxRibbon, dxRibbonForm, dxRibbonSkins, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxClasses, dxRibbonBackstageView, dxSkinsCore,
  dxSkinOffice2010Silver, dxSkinsdxRibbonPainter, dxSkinsdxBarPainter,
  dxSkinscxSchedulerPainter, Vcl.Menus, cxStyles, cxEdit, cxScheduler,
  cxSchedulerStorage, cxSchedulerCustomControls, cxSchedulerCustomResourceView,
  cxSchedulerDayView, cxSchedulerDateNavigator, cxSchedulerHolidays,
  cxSchedulerTimeGridView, cxSchedulerUtils, cxSchedulerWeekView,
  cxSchedulerYearView, cxSchedulerGanttView, dxStatusBar, dxRibbonStatusBar,
  Datasnap.DBClient, cxSchedulerDBStorage, Data.DB, dxmdaset, dxBarExtDBItems,
  Vcl.StdCtrls, ppDB, ppDBPipe, ppParameter, ppComm, ppRelatv, ppProd, ppClass,
  ppReport, ppStrtch, ppMemo, ppCtrls, ppPrnabl, ppBands, ppCache,
  ppDesignLayer, dxSkinsForm, cxLocalization,
  dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, uC_Agenda, Data.FMTBcd, Datasnap.Provider, Data.SqlExpr,
  LiderLaranja, dxSkinLiderMarmore, Vcl.ImgList, ppVar;

type
  TForm_Cadastro_Scheduler_Ribbon = class(TdxRibbonForm)
    dxBarManager1: TdxBarManager;
    dxBarManager1Bar1: TdxBar;
    dxRibbon1: TdxRibbon;
    dxRibbon1Tab1: TdxRibbonTab;
    cxScheduler1: TcxScheduler;
    dxBarManager1Bar2: TdxBar;
    rbbtnNovo: TdxBarLargeButton;
    rbbtnEditar: TdxBarLargeButton;
    rbbtnExcluir: TdxBarLargeButton;
    dxmdScheduler: TdxMemData;
    dxmdSchedulerCODIGO: TIntegerField;
    dxmdSchedulerINICIO: TDateTimeField;
    dxmdSchedulerFIM: TDateTimeField;
    dxmdSchedulerOptions: TIntegerField;
    dxmdSchedulerEventType: TIntegerField;
    dxmdSchedulerCODCLIENTE: TIntegerField;
    dxmdSchedulerNOMECLIENTE: TStringField;
    dsScheduler: TDataSource;
    cxsdbScheduler: TcxSchedulerDBStorage;
    cdsPesquisa: TClientDataSet;
    cdsPesquisaCODIGO: TIntegerField;
    cdsPesquisaCODCLIENTE: TIntegerField;
    cdsPesquisaNOMECLIENTE: TStringField;
    cdsPesquisaINICIO: TDateTimeField;
    cdsPesquisaFIM: TDateTimeField;
    cdsPesquisaOld: TClientDataSet;
    cdsAgenda: TClientDataSet;
    cdsAgendaCODIGO: TIntegerField;
    cdsAgendaCODCLIENTE: TIntegerField;
    cdsAgendaNOMECLIENTE: TStringField;
    cdsAgendaINICIO: TDateTimeField;
    cdsAgendaFIM: TDateTimeField;
    dsAmbiente: TDataSource;
    dxBarManager1Bar3: TdxBar;
    dxBarLookupCombo1: TdxBarLookupCombo;
    cdsPesquisaCODAMBIENTE: TIntegerField;
    cdsAgendaCODAMBIENTE: TIntegerField;
    dsAgenda: TDataSource;
    Label1: TLabel;
    cdsAgendaRESULTADO: TMemoField;
    cdsPesquisaRESULTADO: TMemoField;
    dxmdSchedulerRESULTADO: TMemoField;
    dxBarLargeButton1: TdxBarLargeButton;
    cdsRelatorio: TClientDataSet;
    dsRelatorio: TDataSource;
    cdsAgendaLABELCOLOR: TIntegerField;
    cdsPesquisaLABELCOLOR: TIntegerField;
    dxmdSchedulerlabelcolor: TIntegerField;
    dxmdSchedulerDATAAGENDA: TDateField;
    cdsAgendaDATAAGENDA: TDateField;
    cdsPesquisaDATAAGENDA: TDateField;
    cxLocalizer1: TcxLocalizer;
    sqldsAmbiente: TSQLDataSet;
    dspAmbiente: TDataSetProvider;
    cdsAmbiente: TClientDataSet;
    sqldsAmbienteAMB_CD_AMBIENTE: TIntegerField;
    sqldsAmbienteAMB_DS_AMBIENTE: TStringField;
    cdsAmbienteAMB_CD_AMBIENTE: TIntegerField;
    cdsAmbienteAMB_DS_AMBIENTE: TStringField;
    cdsPesquisaDESCRICAO: TStringField;
    cdsPesquisaSTATUS: TStringField;
    cdsPesquisaOldCODIGO: TIntegerField;
    cdsPesquisaOldCODCLIENTE: TIntegerField;
    cdsPesquisaOldNOMECLIENTE: TStringField;
    cdsPesquisaOldCODAMBIENTE: TIntegerField;
    cdsPesquisaOldINICIO: TDateTimeField;
    cdsPesquisaOldFIM: TDateTimeField;
    cdsPesquisaOldSTATUS: TStringField;
    cdsPesquisaOldDESCRICAO: TStringField;
    cdsPesquisaOldDATAAGENDA: TDateField;
    cdsPesquisaOldRESULTADO: TMemoField;
    cdsPesquisaOldLABELCOLOR: TIntegerField;
    dxmdSchedulerDESCRICAO: TStringField;
    dxmdSchedulerSTATUS: TStringField;
    cdsAgendaDESCRICAO: TStringField;
    cdsAgendaSTATUS: TStringField;
    dxmdSchedulersitu: TIntegerField;
    PopupMenu1: TPopupMenu;
    Finalizaragendamento1: TMenuItem;
    cdsPesquisaVALOR: TFloatField;
    cdsPesquisaOldVALOR: TFloatField;
    cdsAgendaVALOR: TFloatField;
    dxmdSchedulerVALOR: TStringField;
    ImageList1: TImageList;
    cdsRelatorioClienteNome: TStringField;
    cdsRelatorioNomeAmbiente: TStringField;
    cdsRelatorioValorAgenda: TFloatField;
    ppDBRelatorio: TppDBPipeline;
    rbbtnImprimirAgendasDia: TdxBarLargeButton;
    ppRelatorio: TppReport;
    ppParameterList2: TppParameterList;
    ppDesignLayers2: TppDesignLayers;
    ppDesignLayer2: TppDesignLayer;
    ppHeaderBand2: TppHeaderBand;
    ppDetailBand2: TppDetailBand;
    ppFooterBand2: TppFooterBand;
    ppLine11: TppLine;
    ppLine12: TppLine;
    ppLine13: TppLine;
    ppLabel6: TppLabel;
    ppImage2: TppImage;
    ppLine14: TppLine;
    ppLine15: TppLine;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLine16: TppLine;
    ppLine17: TppLine;
    ppLine18: TppLine;
    ppShape2: TppShape;
    ppLine19: TppLine;
    ppLine20: TppLine;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    cdsRelatorioDataHoraInicio: TTimeField;
    cdsRelatorioDataHoraFim: TTimeField;
    ppLine1: TppLine;
    ppLabel1: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppSummaryBand1: TppSummaryBand;
    ppLine2: TppLine;
    ppLine3: TppLine;
    ppLine4: TppLine;
    ppLine5: TppLine;
    procedure rbbtnNovoClick(Sender: TObject);
    procedure rbbtnEditarClick(Sender: TObject);
    procedure rbbtnExcluirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dxBarLookupCombo1Change(Sender: TObject);
    procedure cxScheduler1DblClick(Sender: TObject);
    procedure dxBarLargeButton1Click(Sender: TObject);
    procedure cxScheduler1EventPopupMenuPopup(
      Sender: TcxSchedulerEventPopupMenu; ABuiltInMenu: TPopupMenu;
      var AHandled: Boolean);
    procedure cxScheduler1DateNavigatorPeriodChanged(Sender: TObject;
      const AStart, AFinish: TDateTime);
    procedure Finalizaragendamento1Click(Sender: TObject);
    procedure cxScheduler1BeforeSizingEvent(Sender: TcxCustomScheduler;
      AEvent: TcxSchedulerControlEvent; X, Y: Integer; var Allow: Boolean);
    procedure cxScheduler1StartDrag(Sender: TObject;
      var DragObject: TDragObject);
    procedure rbbtnImprimirAgendasDiaClick(Sender: TObject);
    procedure ppDetailBand2BeforePrint(Sender: TObject);
  private
    function Excluir():Boolean;
    function Novo():boolean;
  public
    function Editar():boolean;
    function Pesquisar():boolean;
    function ComparaRegistrosCDS(pNumeroCampos:Integer; pCds1, pCds2 : TClientDataSet):boolean;
    procedure AtualizaCDSPesquisa();
    procedure AtualizaBDScheduler();
    procedure ImprimeAgenda;
  protected
    ObjetoEdit:TAgenda;
    Incluindo:boolean;
    ObjetoPesquisa:TAgenda;
  end;

var
  Form_Cadastro_Scheduler_Ribbon: TForm_Cadastro_Scheduler_Ribbon;
  vAmbiente: Integer;
implementation

{$R *.dfm}

uses udm, uForm_Edicao_Scheduler, uC_Cliente, uC_Ambiente, uCDAO_Agenda,
  uCDAO_Cliente, uc_Sistema;

{ TForm1 }

procedure TForm_Cadastro_Scheduler_Ribbon.AtualizaBDScheduler;
var
  vScheduler:TAgenda;
begin
  cdsPesquisa.First;
  while not(cdsPesquisa.eof) do
  begin
    if cdsPesquisaOld.Locate('CODIGO', cdsPesquisaCODIGO.AsInteger, []) then
    begin
      if not(ComparaRegistrosCDS(10, cdsPesquisa, cdsPesquisaOld)) then
      begin
        cdsAgenda.Append;
        cdsAgendaCODIGO.AsInteger      := cdsPesquisaCODIGO.AsInteger;
        cdsAgendaCODCLIENTE.AsInteger  := cdsPesquisaCODCLIENTE.AsInteger;
        cdsAgendaNOMECLIENTE.AsString  := cdsPesquisaNOMECLIENTE.AsString;
        cdsAgendaCODAMBIENTE.AsInteger := cdsPesquisaCODAMBIENTE.AsInteger;
        cdsAgendaINICIO.AsDateTime     := cdsPesquisaINICIO.AsDateTime;
        cdsAgendaFIM.AsDateTime        := cdsPesquisaFIM.AsDateTime;
        cdsAgendaDESCRICAO.AsString    := cdsPesquisaDESCRICAO.AsString;
        cdsAgendaSTATUS.AsString       := cdsPesquisaSTATUS.AsString;
        cdsAgendaRESULTADO.AsString    := cdsPesquisaRESULTADO.AsString;
        cdsAgendaDATAAGENDA.AsDateTime := cdsPesquisaDATAAGENDA.AsDateTime;
        cdsAgendaVALOR.AsCurrency      := cdsPesquisaVALOR.AsCurrency;

        if cdsAgendaSTATUS.AsString = 'A' then
          cdsAgendaLABELCOLOR.AsInteger := 1
        else
          cdsAgendaLABELCOLOR.AsInteger := 2;
        cdsAgenda.Post;

        vScheduler := TAgenda.Create;
        try
          vScheduler.Codigo          := cdsAgendaCODIGO.AsInteger;
          vScheduler.Ambiente.Codigo := cdsAgendaCODAMBIENTE.AsInteger;
          vScheduler.Cliente.Codigo  := cdsAgendaCODCLIENTE.AsInteger;
          vScheduler.DataHoraInicio  := cdsAgendaINICIO.AsDateTime;
          vScheduler.DataHoraFim     := cdsAgendaFIM.AsDateTime;
          vScheduler.DataAgendamento := cdsAgendaDATAAGENDA.AsDateTime;
          vScheduler.Observacoes     := cdsAgendaDESCRICAO.AsString;
          vScheduler.Status          := cdsAgendaSTATUS.AsString;
          vScheduler.Valor           := cdsAgendaVALOR.AsCurrency;
          TDAOAgenda.Update(vScheduler);
        finally
          vScheduler.Free;
        end;
        cdsAgenda.EmptyDataSet;
      end;
      cdsPesquisa.Next;
    end;
  end;
end;

procedure TForm_Cadastro_Scheduler_Ribbon.AtualizaCDSPesquisa;
begin
  cdsPesquisa.EmptyDataSet;
  dxmdScheduler.First;
  while not(dxmdScheduler.Eof) do
  begin
    cdsPesquisa.Append;
    cdsPesquisaCODIGO.AsInteger      := dxmdSchedulerCODIGO.AsInteger;
    cdsPesquisaINICIO.AsDateTime     := dxmdSchedulerINICIO.AsDateTime;
    cdsPesquisaFIM.AsDateTime        := dxmdSchedulerFIM.AsDateTime;
    cdsPesquisaDESCRICAO.AsString    := dxmdSchedulerDESCRICAO.AsString;
    cdsPesquisaSTATUS.AsString       := dxmdSchedulerSTATUS.AsString;
    cdsPesquisaCODCLIENTE.AsInteger  := dxmdSchedulerCODCLIENTE.AsInteger;
    cdsPesquisaNOMECLIENTE.AsString  := dxmdSchedulerNOMECLIENTE.AsString;
    cdsPesquisaCODAMBIENTE.AsInteger := vAmbiente;
    cdsPesquisaRESULTADO.AsString    := dxmdSchedulerRESULTADO.AsString;
    cdsPesquisaDATAAGENDA.AsDateTime := dxmdSchedulerDATAAGENDA.AsDateTime;
    cdsPesquisaVALOR.AsCurrency      := StrToFloatDef(dxmdSchedulerVALOR.AsString, 0);

    if cdsPesquisaSTATUS.AsString = 'A' then
      cdsPesquisaLABELCOLOR.AsInteger := 1
    else
      cdsPesquisaLABELCOLOR.AsInteger := 2;
    cdsPesquisa.Post;
    dxmdScheduler.Next;
  end;
  dxmdScheduler.Active := True;
end;

function TForm_Cadastro_Scheduler_Ribbon.ComparaRegistrosCDS(pNumeroCampos: Integer; pCds1,
  pCds2: TClientDataSet): boolean;
var
  i: Integer;
begin
  Result := True;
  for i := 0 to (pNumeroCampos - 1) do
  begin
    if pCds1.Fields[i].AsVariant <> pCds2.Fields[i].AsVariant then
    begin
      Result := False;
      Break;
    end;
  end;
end;

procedure TForm_Cadastro_Scheduler_Ribbon.cxScheduler1BeforeSizingEvent(
  Sender: TcxCustomScheduler; AEvent: TcxSchedulerControlEvent; X, Y: Integer;
  var Allow: Boolean);
begin
  if cxScheduler1.SelectedEventCount > 0 then
    if cxScheduler1.SelectedEvents[0].State = 1 then
      raise Exception.Create('Agendamento já finalizado');
end;

procedure TForm_Cadastro_Scheduler_Ribbon.cxScheduler1DateNavigatorPeriodChanged(
  Sender: TObject; const AStart, AFinish: TDateTime);
begin
  if Assigned(dxBarLookupCombo1) then
    Pesquisar;
end;

procedure TForm_Cadastro_Scheduler_Ribbon.cxScheduler1DblClick(Sender: TObject);
begin
  AtualizaCDSPesquisa;
  AtualizaBDScheduler;
  if cxScheduler1.SelectedEventCount = 0 then
    Novo()
  else
  begin
    Incluindo := False;
    Editar();
  end;
end;

procedure TForm_Cadastro_Scheduler_Ribbon.cxScheduler1EventPopupMenuPopup(
  Sender: TcxSchedulerEventPopupMenu; ABuiltInMenu: TPopupMenu;
  var AHandled: Boolean);
var
  teste1, teste2:TDateTime;
begin
  teste1 := Now;
  teste2 := Now;
end;

procedure TForm_Cadastro_Scheduler_Ribbon.cxScheduler1StartDrag(Sender: TObject;
  var DragObject: TDragObject);
begin
  if cxScheduler1.SelectedEventCount > 0 then
    if cxScheduler1.SelectedEvents[0].State = 1 then
      raise Exception.Create('Agendamento já finalizado');
end;

procedure TForm_Cadastro_Scheduler_Ribbon.rbbtnNovoClick(
  Sender: TObject);
var
  vData:TDateTime;
begin
  vData := cxScheduler1.SelStart;
  vData := cxScheduler1.SelFinish;

  AtualizaCDSPesquisa;
  AtualizaBDScheduler;
  Novo();
end;

procedure TForm_Cadastro_Scheduler_Ribbon.rbbtnEditarClick(
  Sender: TObject);
begin
  AtualizaCDSPesquisa;
  AtualizaBDScheduler;
  Editar();
end;

procedure TForm_Cadastro_Scheduler_Ribbon.rbbtnExcluirClick(
  Sender: TObject);
begin
  AtualizaCDSPesquisa;
  AtualizaBDScheduler;
  Excluir();
end;

procedure TForm_Cadastro_Scheduler_Ribbon.rbbtnImprimirAgendasDiaClick(
  Sender: TObject);
begin
  ImprimeAgenda;
end;

procedure TForm_Cadastro_Scheduler_Ribbon.dxBarLargeButton1Click(
  Sender: TObject);
begin
  ImprimeAgenda;
end;

procedure TForm_Cadastro_Scheduler_Ribbon.dxBarLookupCombo1Change(
  Sender: TObject);
begin
  AtualizaCDSPesquisa;
  AtualizaBDScheduler;
  vAmbiente := dxBarLookupCombo1.KeyValue;
  Pesquisar();
end;

function TForm_Cadastro_Scheduler_Ribbon.Editar: boolean;
var
  aAgenda:TAgenda;
begin
  if dxmdScheduler.IsEmpty then
    Exit;
  if cxScheduler1.SelectedEventCount = 0 then
    Exit;
  aAgenda := TDAOAgenda.Read(Integer(cxScheduler1.SelectedEvents[0].ID));
  try
    if aAgenda.Status = 'F' then
    begin
      Application.MessageBox('Esta agenda já foi finalizada', 'RentControl', MB_ICONEXCLAMATION);
      Exit;
    end;
  finally
    aAgenda.Free;
  end;
  Form_Edicao_Scheduler := TForm_Edicao_Scheduler.Create(Self);
  Form_Edicao_Scheduler.Editar(cxScheduler1.SelectedEvents[0].ID);
  Form_Edicao_Scheduler.ShowModal;
  Pesquisar();
end;

function TForm_Cadastro_Scheduler_Ribbon.Excluir: Boolean;
var
  Objeto:TAgenda;
begin
  if dxmdScheduler.IsEmpty then
    Exit;
  if cxScheduler1.SelectedEventCount = 0 then
    Exit;
  vAgenda := TDAOAgenda.Read(Integer(cxScheduler1.SelectedEvents[0].ID));
  try
    if vAgenda.Status = 'F' then
    begin
      Application.MessageBox('Esta agenda já foi finalizada', 'RentControl', MB_ICONEXCLAMATION);
      Exit;
    end;
  finally
    vAgenda.Free;
  end;
  if Application.MessageBox('Confirma Exclusão?', 'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDNO then
    Exit;
  Objeto:= TAgenda.create;
  Objeto := TDAOAgenda.Read(StrToInt(cxScheduler1.SelectedEvents[0].ID));
  TDAOAgenda.Delete(Objeto);
  Objeto.Free;
  Pesquisar();
end;

procedure TForm_Cadastro_Scheduler_Ribbon.Finalizaragendamento1Click(
  Sender: TObject);
var
  aAgenda:TAgenda;
begin
  if dxmdScheduler.IsEmpty then
    Exit;
  if cxScheduler1.SelectedEvents[0].State = 1 then
    Exit;
  if Sistema.UsuarioLogado.Nivel = 3 then
    raise Exception.Create('Usuário não autorizado');
  if Application.MessageBox('Deseja finalizar esse agendamento?', 'RentControl', MB_ICONQUESTION+MB_YESNO)=6 then
  begin
    AtualizaCDSPesquisa;
    AtualizaBDScheduler;
    aAgenda := TDAOAgenda.Read(Integer(cxScheduler1.SelectedEvents[0].ID));
    try
      if aAgenda.Finaliza then
      begin
        Application.MessageBox('Finalizado com sucesso!', 'RentControl', MB_ICONINFORMATION);
        Pesquisar;
      end;
    finally
      aAgenda.Free;
    end;
  end;
end;

procedure TForm_Cadastro_Scheduler_Ribbon.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  AtualizaCDSPesquisa;
  AtualizaBDScheduler;
  Action := caFree;
end;

procedure TForm_Cadastro_Scheduler_Ribbon.FormCreate(Sender: TObject);
begin
  cdsAgenda.CreateDataSet;
  cdsRelatorio.CreateDataSet;
  cdsPesquisa.CreateDataSet;
  cxScheduler1.OptionsView.WorkStart  := Sistema.InicioExpediente;
  cxScheduler1.OptionsView.WorkFinish := Sistema.FimExpediente;
end;

procedure TForm_Cadastro_Scheduler_Ribbon.FormDestroy(Sender: TObject);
begin
  Form_Cadastro_Scheduler_Ribbon := nil;
end;

procedure TForm_Cadastro_Scheduler_Ribbon.FormShow(Sender: TObject);
begin
  ObjetoPesquisa := TAgenda.Create;
  cdsAmbiente.Close;
  cdsAmbiente.Open;
  dxBarLookupCombo1.KeyValue := cdsAmbienteAMB_CD_AMBIENTE.AsInteger;
  vAmbiente := dxBarLookupCombo1.KeyValue;
  Pesquisar();
end;

procedure TForm_Cadastro_Scheduler_Ribbon.ImprimeAgenda;
var
  vList:TList;
  i: Integer;
begin
  vList := TDAOAgenda.Read(dxBarLookupCombo1.KeyValue, Date);
  if Assigned(vList) then
  begin
    cdsRelatorio.EmptyDataSet;
    for i := 0 to vList.Count - 1 do
    begin
      cdsRelatorio.Append;
      cdsRelatorioClienteNome.AsString := TAgenda(vList[i]).Cliente.Nome;
      cdsRelatorioDataHoraInicio.AsDateTime := TAgenda(vList[i]).DataHoraInicio;
      cdsRelatorioDataHoraFim.AsDateTime := TAgenda(vList[i]).DataHoraFim;
      cdsRelatorioNomeAmbiente.AsString := TAgenda(vList[i]).Ambiente.Descricao;
      cdsRelatorioValorAgenda.AsFloat := TAgenda(vList[i]).Valor;
      cdsRelatorio.Post;
    end;
    vList.Free;
    if FileExists(Sys_Dir_Principal+Sys_Arq_Logo) then
      ppImage2.Picture.LoadFromFile(Sys_Dir_Principal+Sys_Arq_Logo);
    ppLabel1.Caption := 'Agendas do dia: '+DateToStr(Date);
    ppRelatorio.PrintReport;
  end
  else
    Application.MessageBox('Não existem agendas marcadas para o dia de hoje!', 'RentControl', MB_ICONEXCLAMATION);
end;

function TForm_Cadastro_Scheduler_Ribbon.Novo: boolean;
var
  vdata:TDateTime;
  i:integer;
begin
  Form_Edicao_Scheduler := TForm_Edicao_Scheduler.Create(Self);
  Form_Edicao_Scheduler.Novo(vAmbiente, cxScheduler1.SelStart, cxScheduler1.SelFinish);
  Form_Edicao_Scheduler.ShowModal;
  Pesquisar();
end;

function TForm_Cadastro_Scheduler_Ribbon.Pesquisar: boolean;
var
  vListaAgenda:TList;
  i: Integer;
  data:TDate;
begin
  if VarIsNull(dxBarLookupCombo1.KeyValue) then
    Exit;
  vListaAgenda := TDAOAgenda.Read(IntToStr(dxBarLookupCombo1.KeyValue),
                                  cxScheduler1.DateNavigator.FirstDate,
                                  cxScheduler1.DateNavigator.LastDate);
  if Assigned(vListaAgenda) then
  begin
    cdsPesquisa.DisableControls;
    cdsPesquisa.EmptyDataSet;
    for i := 0 to vListaAgenda.Count - 1 do
    begin
      cdsPesquisa.Append;
      cdsPesquisaCODIGO.AsInteger      := TAgenda(vListaAgenda[i]).Codigo;
      cdsPesquisaCODCLIENTE.AsInteger  := TAgenda(vListaAgenda[i]).Cliente.Codigo;
      cdsPesquisaNOMECLIENTE.AsString  := TAgenda(vListaAgenda[i]).Cliente.Nome;
      cdsPesquisaINICIO.AsDateTime     := TAgenda(vListaAgenda[i]).DataHoraInicio;
      cdsPesquisaFIM.AsDateTime        := TAgenda(vListaAgenda[i]).DataHoraFim;
      cdsPesquisaCODAMBIENTE.AsInteger := TAgenda(vListaAgenda[i]).Ambiente.Codigo;
      cdsPesquisaDATAAGENDA.AsDateTime := TAgenda(vListaAgenda[i]).DataAgendamento;
      cdsPesquisaDESCRICAO.AsString    := TAgenda(vListaAgenda[i]).Observacoes;
      cdsPesquisaSTATUS.AsString       := TAgenda(vListaAgenda[i]).Status;
      cdsPesquisaVALOR.AsCurrency      := TAgenda(vListaAgenda[i]).Valor;
      cdsPesquisa.Post;
    end;
    cdsPesquisa.EnableControls;
    cdsPesquisaOld.Data := cdsPesquisa.Data;
    vListaAgenda.Free;
  end;

  dxmdScheduler.Close;
  dxmdScheduler.Open;
  cdsPesquisa.First;
  while not(cdsPesquisa.Eof) do
  begin
    dxmdScheduler.Append;
    dxmdSchedulerCODIGO.AsInteger      := cdsPesquisaCODIGO.AsInteger;
    dxmdSchedulerINICIO.AsDateTime     := cdsPesquisaINICIO.AsDateTime;
    dxmdSchedulerFIM.AsDateTime        := cdsPesquisaFIM.AsDateTime;
    dxmdSchedulerDESCRICAO.AsString    := cdsPesquisaDESCRICAO.AsString;
    dxmdSchedulerSTATUS.AsString       := cdsPesquisaSTATUS.AsString;
    dxmdSchedulerOptions.AsInteger     := 0;
    dxmdSchedulerEventType.AsInteger   := 0;
    dxmdSchedulerCODCLIENTE.AsInteger  := cdsPesquisaCODCLIENTE.AsInteger;
    dxmdSchedulerNOMECLIENTE.AsString  := cdsPesquisaNOMECLIENTE.AsString;
    dxmdSchedulerRESULTADO.AsString    := cdsPesquisaRESULTADO.AsString;
    dxmdSchedulerDATAAGENDA.AsDateTime := cdsPesquisaDATAAGENDA.AsDateTime;
    dxmdSchedulerVALOR.AsString        := FormatFloat('#0.00', cdsPesquisaVALOR.AsCurrency);
    if dxmdSchedulerSTATUS.AsString = 'A' then
    begin
      dxmdSchedulersitu.AsInteger := 0;
      dxmdSchedulerlabelcolor.AsInteger := StrToInt('$006A6AFF')
    end
    else
    begin
      dxmdSchedulersitu.AsInteger := 1;
      dxmdSchedulerlabelcolor.AsInteger := StrToInt('$0057DD91');
    end;

    dxmdScheduler.Post;
    cdsPesquisa.Next;
  end;
  dxmdScheduler.Active := True;
end;

procedure TForm_Cadastro_Scheduler_Ribbon.ppDetailBand2BeforePrint(
  Sender: TObject);
begin
  ppShape2.Visible := Odd(cdsRelatorio.RecNo);
end;

end.
