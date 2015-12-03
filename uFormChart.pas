unit uFormChart;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, VCLTee.TeeData,
  VCLTee.TeEngine, VCLTee.Series, Vcl.ExtCtrls, VCLTee.TeeProcs, VCLTee.Chart,
  VCLTee.DBChart;

type
  TFormChart = class(TForm)
    DBChart1: TDBChart;
    Series1: TBarSeries;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormChart: TFormChart;

implementation

{$R *.dfm}

uses uForm_Rel_AgendasPorDiaSemana;

end.
