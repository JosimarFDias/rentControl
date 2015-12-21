inherited Frm_Rel_AgendasPorCliente: TFrm_Rel_AgendasPorCliente
  Caption = 'Frm_Rel_AgendasPorCliente'
  ExplicitWidth = 297
  ExplicitHeight = 586
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel2: TPanel
    Top = 293
    Height = 252
    ExplicitTop = 293
    ExplicitHeight = 252
  end
  inherited cxGroupBox1: TcxGroupBox
    inherited cxLabel1: TcxLabel
      Caption = 'Relat'#243'rio de Agendas por Cliente'
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
  object cxGroupBox4: TcxGroupBox [5]
    Left = 0
    Top = 161
    Align = alTop
    Caption = 'Status'
    TabOrder = 4
    DesignSize = (
      297
      76)
    Height = 76
    Width = 297
    object cxComboBox1: TcxComboBox
      Left = 3
      Top = 29
      Anchors = [akLeft, akTop, akRight]
      Properties.DropDownListStyle = lsFixedList
      Properties.Items.Strings = (
        'Todas'
        'Finalizadas'
        'Em Aberto')
      TabOrder = 0
      Text = 'Todas'
      Width = 291
    end
  end
  object cxRadioGroup1: TcxRadioGroup [6]
    Left = 0
    Top = 237
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
    TabOrder = 5
    Height = 56
    Width = 297
  end
  inherited cdsRelatorio: TClientDataSet
    object cdsRelatorioCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object cdsRelatorioNome: TStringField
      FieldName = 'Nome'
      Size = 100
    end
    object cdsRelatorioAgendas: TIntegerField
      FieldName = 'Agendas'
    end
  end
  inherited ppDBRelatorio: TppDBPipeline
    object ppDBRelatorioppField1: TppField
      FieldAlias = 'Codigo'
      FieldName = 'Codigo'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppDBRelatorioppField2: TppField
      FieldAlias = 'Nome'
      FieldName = 'Nome'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppDBRelatorioppField3: TppField
      FieldAlias = 'Agendas'
      FieldName = 'Agendas'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
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
        Caption = 'Relat'#243'rio de Agendas por Cliente'
        mmHeight = 11218
        mmLeft = 36895
        mmWidth = 123529
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
        Caption = 'C'#243'digo'
        TextAlignment = taCentered
        mmHeight = 3704
        mmWidth = 12171
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
        Caption = 'Nome'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Segoe UI'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3768
        mmLeft = 79360
        mmTop = 529
        mmWidth = 7705
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = 'Quantidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Segoe UI'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 153194
        mmTop = 529
        mmWidth = 42069
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
        DataField = 'Codigo'
        DataPipeline = ppDBRelatorio
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDBRelatorio'
        mmHeight = 3175
        mmLeft = 1852
        mmTop = 529
        mmWidth = 12171
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'Nome'
        DataPipeline = ppDBRelatorio
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBRelatorio'
        mmHeight = 3175
        mmLeft = 16933
        mmTop = 529
        mmWidth = 132557
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'Agendas'
        DataPipeline = ppDBRelatorio
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBRelatorio'
        mmHeight = 3260
        mmLeft = 153194
        mmTop = 529
        mmWidth = 42333
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
      mmHeight = 6615
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
        DataField = 'Agendas'
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
    PrinterSetup.PaperName = 'Envelope n'#186' 9'
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
    TextSearchSettings.DefaultString = '<FindText>'
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
          Title.Font.Color = clBlack
          Title.Font.Height = -21
          Title.Font.Style = [fsBold]
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
            XLabelsSource = 'Nome'
            XValues.Name = 'X'
            XValues.Order = loAscending
            YValues.Name = 'Bar'
            YValues.Order = loNone
            YValues.ValueSource = 'Agendas'
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
