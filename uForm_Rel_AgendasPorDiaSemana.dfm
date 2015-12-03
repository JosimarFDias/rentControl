inherited Frm_Rel_AgendasPorDiaSemana: TFrm_Rel_AgendasPorDiaSemana
  Caption = 'Frm_Rel_AgendasPorDiaSemana'
  ExplicitWidth = 297
  ExplicitHeight = 586
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel2: TPanel
    Top = 217
    Height = 328
    ExplicitTop = 217
    ExplicitHeight = 328
  end
  inherited cxGroupBox1: TcxGroupBox
    inherited cxLabel1: TcxLabel
      Caption = 'Relat'#243'rio de Agendas por Dia da Semana'
      Style.IsFontAssigned = True
      AnchorX = 170
      AnchorY = 34
    end
  end
  object cxGroupBox3: TcxGroupBox [4]
    Left = 0
    Top = 79
    Align = alTop
    Caption = 'Per'#237'odo'
    TabOrder = 3
    Height = 82
    Width = 297
    object cxLabel2: TcxLabel
      Left = 3
      Top = 16
      Caption = 'In'#237'cio'
      Transparent = True
    end
    object cxDateEdit1: TcxDateEdit
      Left = 3
      Top = 39
      TabOrder = 1
      Width = 110
    end
    object cxDateEdit2: TcxDateEdit
      Left = 147
      Top = 39
      TabOrder = 2
      Width = 110
    end
    object Fim: TcxLabel
      Left = 147
      Top = 16
      Caption = 'Fim'
      Transparent = True
    end
    object cxLabel3: TcxLabel
      Left = 127
      Top = 40
      Caption = #224
      Transparent = True
    end
  end
  object cxRadioGroup1: TcxRadioGroup [5]
    Left = 0
    Top = 161
    Align = alTop
    Caption = 'Tipo Sa'#237'da do Relat'#243'rio'
    Properties.Columns = 2
    Properties.Items = <
      item
        Caption = 'Rela'#231#227'o'
        Value = 'R'
      end
      item
        Caption = 'Gr'#225'fico'
        Value = 'G'
      end>
    ItemIndex = 0
    TabOrder = 4
    Height = 56
    Width = 297
  end
  inherited cdsRelatorio: TClientDataSet
    object cdsRelatorioDIA: TStringField
      FieldName = 'DIA'
      Size = 15
    end
    object cdsRelatorioQUANTIDADE: TIntegerField
      FieldName = 'QUANTIDADE'
    end
  end
  inherited ppDBRelatorio: TppDBPipeline
    object ppDBRelatorioppField1: TppField
      FieldAlias = 'DIA'
      FieldName = 'DIA'
      FieldLength = 15
      DisplayWidth = 15
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppDBRelatorioppField2: TppField
      FieldAlias = 'QUANTIDADE'
      FieldName = 'QUANTIDADE'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
  end
  inherited ppRelatorio: TppReport
    AutoStop = False
    DataPipeline = ppDBRelatorio
    DataPipelineName = 'ppDBRelatorio'
    inherited ppTitleBand1: TppTitleBand
      inherited ppLabel1: TppLabel
        SaveOrder = -1
        Caption = 'Relat'#243'rio de Agendas por Dia da Semana'
        mmHeight = 11218
        mmLeft = 21885
        mmWidth = 153543
        LayerName = Foreground
      end
      inherited ppSystemVariable1: TppSystemVariable
        SaveOrder = -1
        LayerName = Foreground
      end
      inherited ppImage1: TppImage
        LayerName = Foreground
      end
      inherited ppLine1: TppLine
        LayerName = Foreground
      end
      inherited ppLine2: TppLine
        LayerName = Foreground
      end
      inherited ppLine3: TppLine
        LayerName = Foreground
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        Caption = 'Label6'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3260
        mmLeft = 94456
        mmTop = 16669
        mmWidth = 8467
        BandType = 1
        LayerName = Foreground
      end
    end
    inherited ppHeaderBand1: TppHeaderBand
      inherited ppShape2: TppShape
        LayerName = Foreground
      end
      inherited ppLabel3: TppLabel
        SaveOrder = -1
        Caption = 'Dia da Semana'
        TextAlignment = taCentered
        mmHeight = 3768
        mmLeft = 37629
        mmWidth = 18669
        LayerName = Foreground
      end
      inherited ppLine4: TppLine
        LayerName = Foreground
      end
      inherited ppLine5: TppLine
        LayerName = Foreground
      end
      inherited ppLine6: TppLine
        LayerName = Foreground
      end
      inherited ppLine7: TppLine
        LayerName = Foreground
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = 'Quantidade de Agendas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Segoe UI'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3768
        mmLeft = 122631
        mmTop = 529
        mmWidth = 30184
        BandType = 0
        LayerName = Foreground
      end
    end
    inherited ppDetailBand1: TppDetailBand
      inherited ppShape1: TppShape
        LayerName = Foreground
      end
      inherited ppLine8: TppLine
        LayerName = Foreground
      end
      inherited ppLine9: TppLine
        LayerName = Foreground
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'DIA'
        DataPipeline = ppDBRelatorio
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDBRelatorio'
        mmHeight = 3598
        mmLeft = 3969
        mmTop = 265
        mmWidth = 89694
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'QUANTIDADE'
        DataPipeline = ppDBRelatorio
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBRelatorio'
        mmHeight = 3598
        mmLeft = 101600
        mmTop = 265
        mmWidth = 89694
        BandType = 4
        LayerName = Foreground
      end
    end
    inherited ppFooterBand1: TppFooterBand
      inherited ppLabel2: TppLabel
        SaveOrder = -1
        LayerName = Foreground
      end
      inherited ppSystemVariable2: TppSystemVariable
        SaveOrder = -1
        LayerName = Foreground
      end
    end
    inherited ppSummaryBand1: TppSummaryBand
      mmHeight = 8202
      inherited ppLine10: TppLine
        LayerName = Foreground
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        Caption = 'Quantidade Total'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 137848
        mmTop = 1588
        mmWidth = 25665
        BandType = 7
        LayerName = Foreground
      end
      object ppDBCalc1: TppDBCalc
        UserName = 'DBCalc1'
        DataField = 'QUANTIDADE'
        DataPipeline = ppDBRelatorio
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBRelatorio'
        mmHeight = 3810
        mmLeft = 170657
        mmTop = 1588
        mmWidth = 24606
        BandType = 7
        LayerName = Foreground
      end
    end
  end
  object ppGrafico: TppReport
    AutoStop = False
    DataPipeline = ppDBRelatorio
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'Envelope #9'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.SaveDeviceSettings = False
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 98400
    PrinterSetup.mmPaperWidth = 225400
    PrinterSetup.PaperSize = 19
    ArchiveFileName = '($MyDocuments)\ReportArchive.raf'
    DeviceType = 'Screen'
    DefaultFileDeviceType = 'PDF'
    EmailSettings.ReportFormat = 'PDF'
    LanguageID = 'Default'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = True
    PDFSettings.EmbedFontOptions = [efUseSubset]
    PDFSettings.EncryptSettings.AllowCopy = True
    PDFSettings.EncryptSettings.AllowInteract = True
    PDFSettings.EncryptSettings.AllowModify = True
    PDFSettings.EncryptSettings.AllowPrint = True
    PDFSettings.EncryptSettings.Enabled = False
    PDFSettings.FontEncoding = feAnsi
    PDFSettings.ImageCompressionLevel = 25
    RTFSettings.DefaultFont.Charset = DEFAULT_CHARSET
    RTFSettings.DefaultFont.Color = clWindowText
    RTFSettings.DefaultFont.Height = -13
    RTFSettings.DefaultFont.Name = 'Arial'
    RTFSettings.DefaultFont.Style = []
    TextFileName = '($MyDocuments)\Report.pdf'
    TextSearchSettings.DefaultString = '<Texto a localizar>'
    TextSearchSettings.Enabled = True
    XLSSettings.AppName = 'ReportBuilder'
    XLSSettings.Author = 'ReportBuilder'
    XLSSettings.Subject = 'Report'
    XLSSettings.Title = 'Report'
    Left = 224
    Top = 312
    Version = '14.07'
    mmColumnWidth = 0
    DataPipelineName = 'ppDBRelatorio'
    object ppDetailBand2: TppDetailBand
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppSummaryBand2: TppSummaryBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 78581
      mmPrintPosition = 0
      object ppDPTeeChart1: TppDPTeeChart
        UserName = 'DPTeeChart1'
        mmHeight = 75936
        mmLeft = 1588
        mmTop = 794
        mmWidth = 209815
        BandType = 7
        LayerName = Foreground1
        object ppDPTeeChartControl1: TppDPTeeChartControl
          Left = 0
          Top = 0
          Width = 400
          Height = 250
          BackWall.Color = clWhite
          Title.Font.Color = 4259584
          Title.Font.Height = -13
          Title.Text.Strings = (
            'Agendas por Dia da Semana')
          BackColor = clWhite
          MaxPointsPerPage = 0
          Page = 1
          ScaleLastPage = True
          BevelOuter = bvNone
          BorderStyle = bsNone
          Color = clWhite
          PrintMargins = (
            15
            19
            15
            19)
          ColorPaletteIndex = 13
          object Series1: TBarSeries
            ColorEachPoint = True
            Marks.Arrow.Visible = True
            Marks.Callout.Brush.Color = clBlack
            Marks.Callout.Arrow.Visible = True
            Marks.Visible = True
            DataSource = ppDBRelatorio
            Title = 'Agendas por Dia da Semana'
            XLabelsSource = 'DIA'
            XValues.Name = 'X'
            XValues.Order = loAscending
            YValues.Name = 'Bar'
            YValues.Order = loNone
            YValues.ValueSource = 'QUANTIDADE'
          end
        end
      end
    end
    object ppDesignLayers2: TppDesignLayers
      object ppDesignLayer2: TppDesignLayer
        UserName = 'Foreground1'
        LayerType = ltBanded
        Index = 0
      end
    end
    object ppParameterList2: TppParameterList
    end
  end
end
