object FormChart: TFormChart
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'FormChart'
  ClientHeight = 480
  ClientWidth = 600
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object DBChart1: TDBChart
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 594
    Height = 474
    Title.Text.Strings = (
      'TDBChart')
    Align = alClient
    TabOrder = 0
    ColorPaletteIndex = 13
    object Series1: TBarSeries
      Marks.Arrow.Visible = True
      Marks.Callout.Brush.Color = clBlack
      Marks.Callout.Arrow.Visible = True
      Marks.Visible = True
      DataSource = Frm_Rel_AgendasPorDiaSemana.cdsRelatorio
      XLabelsSource = 'DIA'
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Bar'
      YValues.Order = loNone
      YValues.ValueSource = 'QUANTIDADE'
    end
  end
end
