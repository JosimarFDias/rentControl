unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, cxLookAndFeels, dxSkinsForm, Vcl.ExtCtrls, Vcl.Imaging.jpeg,
  cxGraphics, cxControls, cxLookAndFeelPainters, dxSkinsdxStatusBarPainter,
  dxStatusBar, Vcl.ImgList, dxRibbonSkins, dxSkinsdxRibbonPainter,
  dxRibbonStatusBar, cxClasses, dxRibbon, dxSkinsdxBarPainter, dxBar;

type
  TFormPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    Cadastros1: TMenuItem;
    Clientes1: TMenuItem;
    Ambientes1: TMenuItem;
    N1: TMenuItem;
    Sair1: TMenuItem;
    Lanamentos1: TMenuItem;
    Agenda1: TMenuItem;
    cxLookAndFeelController1: TcxLookAndFeelController;
    dxSkinController1: TdxSkinController;
    Usurios1: TMenuItem;
    Image1: TImage;
    Alunos1: TMenuItem;
    ImageList1: TImageList;
    dxRibbon1Tab1: TdxRibbonTab;
    dxRibbon1: TdxRibbon;
    dxRibbonStatusBar1: TdxRibbonStatusBar;
    dxBarManager1: TdxBarManager;
    procedure Agenda1Click(Sender: TObject);
    procedure Clientes1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure Alunos1Click(Sender: TObject);
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
  uForm_Cadastro_Usuario, uForm_Cadastro_Aluno, uc_Sistema;

procedure TFormPrincipal.Agenda1Click(Sender: TObject);
begin
  if not Assigned(Form_Cadastro_Scheduler_Ribbon) then
    Form_Cadastro_Scheduler_Ribbon := TForm_Cadastro_Scheduler_Ribbon.Create(nil);
  Form_Cadastro_Scheduler_Ribbon.ShowModal;
end;

procedure TFormPrincipal.Alunos1Click(Sender: TObject);
begin
  Form_Cadastro_Aluno := TForm_Cadastro_Aluno.Create(Self);
  Form_Cadastro_Aluno.ShowModal;
  Form_Cadastro_Aluno.Free;
end;

procedure TFormPrincipal.Clientes1Click(Sender: TObject);
begin
  FormCadastroCliente := TFormCadastroCliente.Create(Self);
  FormCadastroCliente.ShowModal;
  FormCadastroCliente.Free;
end;

procedure TFormPrincipal.FormCreate(Sender: TObject);
begin
  Form_Login := TForm_Login.Create(Self);
  Form_Login.ShowModal;
  Form_Login.Free;
end;

procedure TFormPrincipal.Sair1Click(Sender: TObject);
begin
  Application.Terminate;
end;

end.
