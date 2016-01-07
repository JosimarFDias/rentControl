unit uFormEspera;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, cxGroupBox, cxLabel;

type
  TFormEspera = class(TForm)
    cxGroupBox1: TcxGroupBox;
    cxLabel1: TcxLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormEspera: TFormEspera;

implementation

{$R *.dfm}

end.
