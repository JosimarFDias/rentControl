inherited Frm_Rel_ReceitasDespesas: TFrm_Rel_ReceitasDespesas
  Caption = 'Frm_Rel_ReceitasDespesas'
  ExplicitWidth = 297
  ExplicitHeight = 586
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel2: TPanel
    Top = 217
    Height = 328
  end
  inherited cxGroupBox1: TcxGroupBox
    inherited cxLabel1: TcxLabel
      Caption = 'Receitas x Despesas'
      Style.IsFontAssigned = True
      AnchorX = 170
      AnchorY = 34
    end
  end
  object cxGroupBox3: TcxGroupBox [4]
    Left = 0
    Top = 161
    Align = alTop
    Caption = 'Conta'
    TabOrder = 3
    Height = 56
    Width = 297
    object cxLookupComboBox1: TcxLookupComboBox
      AlignWithMargins = True
      Left = 5
      Top = 21
      Align = alTop
      Properties.ImmediatePost = True
      Properties.KeyFieldNames = 'Codigo'
      Properties.ListColumns = <
        item
          FieldName = 'Decricao'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListOptions.SyncMode = True
      Properties.ListSource = dsComboConta
      TabOrder = 0
      ExplicitTop = 44
      Width = 287
    end
  end
  object cxGroupBox4: TcxGroupBox [5]
    Left = 0
    Top = 79
    Align = alTop
    Caption = 'Per'#237'odo'
    TabOrder = 4
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
  inherited cdsRelatorio: TClientDataSet
    object cdsRelatorioTIPO: TStringField
      FieldName = 'TIPO'
      Size = 7
    end
    object cdsRelatorioTOTAL: TCurrencyField
      FieldName = 'TOTAL'
    end
  end
  inherited ppDBRelatorio: TppDBPipeline
    object ppDBRelatorioppField1: TppField
      FieldAlias = 'TIPO'
      FieldName = 'TIPO'
      FieldLength = 7
      DisplayWidth = 7
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppDBRelatorioppField2: TppField
      FieldAlias = 'TOTAL'
      FieldName = 'TOTAL'
      FieldLength = 0
      DataType = dtCurrency
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
  end
  inherited ppRelatorio: TppReport
    inherited ppTitleBand1: TppTitleBand
      inherited ppLabel1: TppLabel
        SaveOrder = -1
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
    end
    inherited ppHeaderBand1: TppHeaderBand
      inherited ppShape2: TppShape
        LayerName = Foreground
      end
      inherited ppLabel3: TppLabel
        SaveOrder = -1
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
      inherited ppLine10: TppLine
        LayerName = Foreground
      end
    end
  end
  object cdsComboConta: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 269
    Top = 224
    object cdsComboContaCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object cdsComboContaDecricao: TStringField
      FieldName = 'Decricao'
      Size = 50
    end
  end
  object dsComboConta: TDataSource
    DataSet = cdsComboConta
    Left = 269
    Top = 232
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
          Title.Font.Color = clBlack
          Title.Font.Height = -19
          Title.Font.Style = [fsBold]
          Title.Text.Strings = (
            'Receitas x Despesas')
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
            Title = 'Receitas x Despesas'
            XLabelsSource = 'TIPO'
            XValues.Name = 'X'
            XValues.Order = loAscending
            YValues.Name = 'Bar'
            YValues.Order = loNone
            YValues.ValueSource = 'TOTAL'
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
