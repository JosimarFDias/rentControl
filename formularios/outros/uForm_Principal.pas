unit uForm_Principal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxBar, dxRibbon, dxRibbonForm, dxRibbonSkins, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxClasses, dxRibbonBackstageView,
  dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, ppReport,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue, dxSkinsdxRibbonPainter,
  dxSkinsdxBarPainter, dxSkinsForm, Vcl.ImgList, dxStatusBar, dxRibbonStatusBar,
  Vcl.Imaging.jpeg, Vcl.ExtCtrls, cxContainer,
  cxEdit, cxGroupBox, ppBands, ppCache, ppClass, ppDesignLayer, ppParameter,
  ppComm, ppRelatv, ppProd;

type
  TFormPrincipal = class(TdxRibbonForm)
    dxBarManager1: TdxBarManager;
    dxBarManager1Bar1: TdxBar;
    dxRibbon1: TdxRibbon;
    tabCadastro: TdxRibbonTab;
    dxRibbonStatusBar1: TdxRibbonStatusBar;
    ImageList1: TImageList;
    cxLookAndFeelController1: TcxLookAndFeelController;
    dxSkinController1: TdxSkinController;
    dxBarManager1Bar2: TdxBar;
    dxBarLargeButton1: TdxBarLargeButton;
    dxBarLargeButton2: TdxBarLargeButton;
    dxBarLargeButton3: TdxBarLargeButton;
    tabLancamento: TdxRibbonTab;
    dxBarManager1Bar3: TdxBar;
    dxBarLargeButton4: TdxBarLargeButton;
    Timer1: TTimer;
    dxBarLargeButton5: TdxBarLargeButton;
    dxBarLargeButton6: TdxBarLargeButton;
    tabOpcoes: TdxRibbonTab;
    dxBarManager1Bar4: TdxBar;
    dxBarLargeButton7: TdxBarLargeButton;
    cxGroupBox1: TcxGroupBox;
    dxBarManager1Bar5: TdxBar;
    dxBarLargeButton8: TdxBarLargeButton;
    dxBarLargeButton9: TdxBarLargeButton;
    dxBarLargeButton10: TdxBarLargeButton;
    tabRelatorio: TdxRibbonTab;
    dxBarManager1Bar6: TdxBar;
    dxBarManager1Bar7: TdxBar;
    dxBarLargeButton11: TdxBarLargeButton;
    dxBarLargeButton12: TdxBarLargeButton;
    dxBarLargeButton13: TdxBarLargeButton;
    dxBarLargeButton14: TdxBarLargeButton;
    dxBarLargeButton15: TdxBarLargeButton;
    dxBarLargeButton16: TdxBarLargeButton;
    dxBarLargeButton17: TdxBarLargeButton;
    dxBarLargeButton18: TdxBarLargeButton;
    dxBarLargeButton19: TdxBarLargeButton;
    dxBarLargeButton20: TdxBarLargeButton;
    ppReport1: TppReport;
    ppParameterList1: TppParameterList;
    ppDesignLayers1: TppDesignLayers;
    ppDesignLayer1: TppDesignLayer;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    dxBarLargeButton21: TdxBarLargeButton;
    procedure dxBarLargeButton4Click(Sender: TObject);
    procedure dxBarLargeButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dxBarLargeButton2Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure dxBarLargeButton5Click(Sender: TObject);
    procedure dxBarLargeButton6Click(Sender: TObject);
    procedure dxBarLargeButton3Click(Sender: TObject);
    procedure dxBarLargeButton7Click(Sender: TObject);
    procedure dxBarLargeButton8Click(Sender: TObject);
    procedure dxBarLargeButton9Click(Sender: TObject);
    procedure dxBarLargeButton10Click(Sender: TObject);
    procedure dxBarLargeButton11Click(Sender: TObject);
    procedure dxBarLargeButton12Click(Sender: TObject);
    procedure dxBarLargeButton13Click(Sender: TObject);
    procedure dxBarLargeButton14Click(Sender: TObject);
    procedure dxBarLargeButton15Click(Sender: TObject);
    procedure dxBarLargeButton16Click(Sender: TObject);
    procedure dxBarLargeButton17Click(Sender: TObject);
    procedure dxBarLargeButton18Click(Sender: TObject);
    procedure dxBarLargeButton19Click(Sender: TObject);
    procedure dxBarLargeButton20Click(Sender: TObject);
    procedure dxRibbon1TabChanged(Sender: TdxCustomRibbon);
    procedure dxBarLargeButton21Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormPrincipal: TFormPrincipal;

implementation

{$R *.dfm}

uses uForm_Cadastro_Scheduler_Ribbon, uForm_Cadastro_Cliente, uForm_Login,
  uc_Sistema, uForm_Cadastro_Usuario, uForm_MovimentoConta,
  uForm_Cadastro_Conta, uCDAO_Conta, uForm_Cadastro_Ambiente,
  uForm_ConfiguracoesSistema, uDM, uForm_ContasReceber,
  uForm_Cadastro_Fornecedor, uForm_ContasPagar, uform_base_relatorio,
  uclSalvaRelatorio, uForm_Cadastro_Mensalidade;

procedure TFormPrincipal.dxBarLargeButton10Click(Sender: TObject);
begin
  if not Assigned(FormPagar) then
    FormPagar := TFormPagar.Create(Self);
  if not FormPagar.Showing then
  begin
    FormPagar.Parent := cxGroupBox1;
    FormPagar.Align := alClient;
    FormPagar.Show;
  end;
end;

procedure TFormPrincipal.dxBarLargeButton11Click(Sender: TObject);
begin
  if Assigned(form_base_relatorio) then
  begin
    if form_base_relatorio.ppRelatorio.Visible then
    begin
      if Assigned(TppReport(form_base_relatorio.ppRelatorio.Report)) then
      begin
        form_base_relatorio.sd1.Filter := 'PDF|*.pdf';
        form_base_relatorio.sd1.DefaultExt := '*.pdf';
        if form_base_relatorio.sd1.Execute then
          TSalvaRelatorio.SalvaRelatorioExtensao((TppReport(form_base_relatorio.ppRelatorio.Report)), tePDF, form_base_relatorio.sd1.FileName);
      end;
    end;
  end;
end;

procedure TFormPrincipal.dxBarLargeButton12Click(Sender: TObject);
begin
  if Assigned(form_base_relatorio) then
  begin
    if form_base_relatorio.ppRelatorio.Visible then
    begin
      if Assigned(TppReport(form_base_relatorio.ppRelatorio.Report)) then
      begin
        form_base_relatorio.sd1.Filter := 'XLS|*.xls';
        form_base_relatorio.sd1.DefaultExt := '*.xls';
        if form_base_relatorio.sd1.Execute then
          TSalvaRelatorio.SalvaRelatorioExtensao((TppReport(form_base_relatorio.ppRelatorio.Report)), teXLS, form_base_relatorio.sd1.FileName);
      end;
    end;
  end;
end;

procedure TFormPrincipal.dxBarLargeButton13Click(Sender: TObject);
begin
  if Assigned(form_base_relatorio) then
  begin
    if form_base_relatorio.ppRelatorio.Visible then
    begin
      if Assigned(TppReport(form_base_relatorio.ppRelatorio.Report)) then
      begin
        form_base_relatorio.sd1.Filter := 'DOC|*.doc';
        form_base_relatorio.sd1.DefaultExt := '*.doc';
        if form_base_relatorio.sd1.Execute then
          TSalvaRelatorio.SalvaRelatorioExtensao((TppReport(form_base_relatorio.ppRelatorio.Report)), teDOC, form_base_relatorio.sd1.FileName);
      end;
    end;
  end;
end;

procedure TFormPrincipal.dxBarLargeButton14Click(Sender: TObject);
var
  vSalvaRelatorio:TSalvaRelatorio;
begin
  if Assigned(form_base_relatorio) then
  begin
    if form_base_relatorio.ppRelatorio.Visible then
    begin
      if Assigned(TppReport(form_base_relatorio.ppRelatorio.Report)) then
      begin
        vSalvaRelatorio := TSalvaRelatorio.Create;
        try
          vSalvaRelatorio.PrepareImpressoraPrinter(TppReport(form_base_relatorio.ppRelatorio.Report));
          form_base_relatorio.ppRelatorio.Print
        finally
          vSalvaRelatorio.Free;
        end;
      end;
    end;
  end;
end;

procedure TFormPrincipal.dxBarLargeButton15Click(Sender: TObject);
begin
  if Assigned(form_base_relatorio) then
  begin
    if (form_base_relatorio.ppRelatorio.ZoomPercentage = 300) then
      Exit
    else
      form_base_relatorio.ppRelatorio.ZoomPercentage := form_base_relatorio.ppRelatorio.ZoomPercentage + 10;
  end;
end;

procedure TFormPrincipal.dxBarLargeButton16Click(Sender: TObject);
begin
  if Assigned(form_base_relatorio) then
  begin
    if (form_base_relatorio.ppRelatorio.ZoomPercentage = 50) then
      Exit
    else
      form_base_relatorio.ppRelatorio.ZoomPercentage := form_base_relatorio.ppRelatorio.ZoomPercentage - 10;
  end;
end;

procedure TFormPrincipal.dxBarLargeButton17Click(Sender: TObject);
begin
  if Assigned(form_base_relatorio) then
  begin
    if form_base_relatorio.ppRelatorio.Visible then
      form_base_relatorio.ppRelatorio.FirstPage;
  end;
end;

procedure TFormPrincipal.dxBarLargeButton18Click(Sender: TObject);
begin
  if Assigned(form_base_relatorio) then
  begin
    if form_base_relatorio.ppRelatorio.Visible then
      form_base_relatorio.ppRelatorio.PriorPage;
  end;
end;

procedure TFormPrincipal.dxBarLargeButton19Click(Sender: TObject);
begin
  if Assigned(form_base_relatorio) then
  begin
    if form_base_relatorio.ppRelatorio.Visible then
      form_base_relatorio.ppRelatorio.NextPage;
  end;
end;

procedure TFormPrincipal.dxBarLargeButton1Click(Sender: TObject);
begin
  FormCadastroCliente := TFormCadastroCliente.Create(Self);
  FormCadastroCliente.ShowModal;
  FormCadastroCliente.Free;
end;

procedure TFormPrincipal.dxBarLargeButton20Click(Sender: TObject);
begin
  if Assigned(form_base_relatorio) then
  begin
    if form_base_relatorio.ppRelatorio.Visible then
      form_base_relatorio.ppRelatorio.LastPage;
  end;
end;

procedure TFormPrincipal.dxBarLargeButton21Click(Sender: TObject);
begin
  FormCadastroMensalidade := TFormCadastroMensalidade.Create(Self);
  FormCadastroMensalidade.ShowModal;
  FormCadastroMensalidade.Free;
end;

procedure TFormPrincipal.dxBarLargeButton2Click(Sender: TObject);
begin
  FormCadastroUsuario := TFormCadastroUsuario.Create(Self);
  FormCadastroUsuario.ShowModal;
  FormCadastroUsuario.Free;
end;

procedure TFormPrincipal.dxBarLargeButton3Click(Sender: TObject);
begin
  FormCadastroAmbiente := TFormCadastroAmbiente.Create(Self);
  FormCadastroAmbiente.ShowModal;
  FormCadastroAmbiente.Free;
end;

procedure TFormPrincipal.dxBarLargeButton4Click(Sender: TObject);
begin
  if not Assigned(Form_Cadastro_Scheduler_Ribbon) then
    Form_Cadastro_Scheduler_Ribbon := TForm_Cadastro_Scheduler_Ribbon.Create(nil);
  Form_Cadastro_Scheduler_Ribbon.ShowModal;
end;

procedure TFormPrincipal.dxBarLargeButton5Click(Sender: TObject);
var
  vLista:TList;
begin
  vLista := TDAO_Conta.Read('%');
  if not Assigned(vLista) then
  begin
    Application.MessageBox(PWideChar('Não exite conta cadastrada!'+#13+#10+
                                     'Para iniciar o movimento é necessário que se cadastre uma conta antes'),
                                     'RentControl', MB_ICONERROR);
    Exit;
  end
  else
    vLista.Free;
  if not Assigned(FormMovimentoConta) then
    FormMovimentoConta := TFormMovimentoConta.Create(nil);
  FormMovimentoConta.ShowModal;
end;

procedure TFormPrincipal.dxBarLargeButton6Click(Sender: TObject);
begin
  if not Assigned(FormCadastroConta) then
    FormCadastroConta := TFormCadastroConta.Create(nil);
  FormCadastroConta.ShowModal;
end;

procedure TFormPrincipal.dxBarLargeButton7Click(Sender: TObject);
begin
  FormConfiguracoesSistema := TFormConfiguracoesSistema.Create(Self);
  FormConfiguracoesSistema.ShowModal;
  FormConfiguracoesSistema.Free;
end;

procedure TFormPrincipal.dxBarLargeButton8Click(Sender: TObject);
begin
  if not Assigned(FormReceber) then
    FormReceber := TFormReceber.Create(Self);
  if not FormReceber.Showing then
  begin
    FormReceber.Parent := cxGroupBox1;
    FormReceber.Align := alClient;
    FormReceber.Show;
  end;
end;

procedure TFormPrincipal.dxBarLargeButton9Click(Sender: TObject);
begin
  FormCadastroFornecedor := TFormCadastroFornecedor.Create(Self);
  FormCadastroFornecedor.ShowModal;
  FormCadastroFornecedor.Free;
end;

procedure TFormPrincipal.dxRibbon1TabChanged(Sender: TdxCustomRibbon);
begin
  if dxRibbon1.ActiveTab = tabRelatorio then
  begin
    if not Assigned(form_base_relatorio) then
      form_base_relatorio := Tform_base_relatorio.Create(nil);
    form_base_relatorio.Parent := cxGroupBox1;
    form_base_relatorio.Show;
  end
  else
  begin
    if Assigned(form_base_relatorio) then
      form_base_relatorio.Close;
  end;
end;

procedure TFormPrincipal.FormCreate(Sender: TObject);
begin
  Form_Login := TForm_Login.Create(Self);
  Form_Login.ShowModal;
  Form_Login.Free;
end;

procedure TFormPrincipal.FormShow(Sender: TObject);
begin
  {if FileExists(Sys_Dir_Principal+Sys_Arq_Logo) then
    Image1.Picture.LoadFromFile(Sys_Dir_Principal+Sys_Arq_Logo);}
  if Assigned(Sistema) then
    dxRibbonStatusBar1.Panels[0].Text := 'Usuário Logado: '+Sistema.UsuarioLogado.Nome;
  case Sistema.UsuarioLogado.Nivel of
    1: dxRibbonStatusBar1.Panels[1].Text := 'Nível: Administrador';
    2: dxRibbonStatusBar1.Panels[1].Text := 'Nível: Financeiro';
    3: dxRibbonStatusBar1.Panels[1].Text := 'Nível: Operacional';
  end;
  dxRibbonStatusBar1.Panels[3].Text := 'Servidor: '+DM.Servidor;
  dxRibbon1.ActiveTab := tabCadastro;
end;

procedure TFormPrincipal.Timer1Timer(Sender: TObject);
begin
  dxRibbonStatusBar1.Panels[2].Text := FormatDateTime('dd/mm/yyyy hh:mm:ss', Now);
end;

end.
