inherited Frm_Rel_ContasAPagar: TFrm_Rel_ContasAPagar
  Caption = 'Frm_Rel_ContasAPagar'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel2: TPanel
    Top = 339
    Height = 206
    ExplicitTop = 339
    ExplicitHeight = 206
  end
  inherited cxGroupBox1: TcxGroupBox
    inherited cxLabel1: TcxLabel
      Caption = 'Relat'#243'rio de Contas '#224' Pagar'
      Style.IsFontAssigned = True
      AnchorX = 170
      AnchorY = 34
    end
  end
  object cxRadioGroup1: TcxRadioGroup [4]
    Left = 0
    Top = 79
    Align = alTop
    Caption = 'Status'
    Properties.Columns = 2
    Properties.Items = <
      item
        Caption = #192' Pagar'
        Value = 'A'
      end
      item
        Caption = 'Pagas '
        Value = 'P'
      end>
    ItemIndex = 0
    TabOrder = 3
    OnClick = cxRadioGroup1Click
    Height = 65
    Width = 297
  end
  object cxRadioGroup2: TcxRadioGroup [5]
    Left = 0
    Top = 144
    Align = alTop
    Caption = 'Tipo de Data'
    Properties.Columns = 3
    Properties.Items = <
      item
        Caption = 'Data do T'#237'tulo'
        Value = 'T'
      end
      item
        Caption = 'Vencimento'
      end
      item
        Caption = 'Pagamento'
        Value = 'P'
      end>
    ItemIndex = 0
    TabOrder = 4
    Height = 65
    Width = 297
  end
  object cxGroupBox3: TcxGroupBox [6]
    Left = 0
    Top = 209
    Align = alTop
    Caption = 'Data'
    TabOrder = 5
    Height = 65
    Width = 297
    object cxLabel2: TcxLabel
      Left = 20
      Top = 9
      Caption = 'In'#237'cio'
      Transparent = True
    end
    object cxDateEdit1: TcxDateEdit
      Left = 20
      Top = 32
      TabOrder = 1
      Width = 110
    end
    object cxDateEdit2: TcxDateEdit
      Left = 164
      Top = 32
      TabOrder = 2
      Width = 110
    end
    object Fim: TcxLabel
      Left = 164
      Top = 9
      Caption = 'Fim'
      Transparent = True
    end
    object cxLabel3: TcxLabel
      Left = 144
      Top = 33
      Caption = #224
      Transparent = True
    end
  end
  object cxGroupBox4: TcxGroupBox [7]
    Left = 0
    Top = 274
    Align = alTop
    Caption = 'Fornecedor'
    TabOrder = 6
    DesignSize = (
      297
      65)
    Height = 65
    Width = 297
    object cxTextEdit1: TcxTextEdit
      Left = 3
      Top = 24
      TabOrder = 0
      OnKeyPress = cxTextEdit1KeyPress
      Width = 62
    end
    object cxButton1: TcxButton
      Left = 71
      Top = 22
      Width = 34
      Height = 25
      OptionsImage.Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FF4D74AB234179C5ABA7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF4173AF008EEC009AF41F4B80FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFF2F6EB22BA7
        F516C0FF00A0F3568BC3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFEFFFF2974BB68C4F86BD4FF279CE66696C8FFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3D8FD5A4E3FEB5EEFF4CAA
        E7669DD2FFFFFFFFFFFFFFFFFFFFFFFFFEFEFEA188898A6A6A93736E866567B0
        9595BAA8B1359EE8BDF5FF77C4EF63A1DAFFFFFFFFFFFFFFFFFFFFFFFFD7CDCD
        7E5857DFD3CBFFFFF7FFFFE7FFFEDBD6BB9E90584D817B8E1794E46BB5E9FFFF
        FFFFFFFFFFFFFFFFFFFFEDE9E9886565FFFFFFFFFFFFFDF8E8FAF2DCF8EDCFFF
        F1CFF6DEBA9F5945C0C7D5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA38889F6EFEA
        FFFFFFFEFBF5FBF7E8F9F4DAF5EBCCE6CEACF3DAB8E2BD99AB8B8EFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFF937674FFFFFFFDFBF1FCF8EEFAF3E1FCF5E3F7F0D7F0
        DFC1E7C9A9F0D1ABA87E75F8F6F6FFFFFFFFFFFFFFFFFFFFFFFF997D7AFFFFFC
        F9F2E1FAF3DEFAF7E5FAF1DCF1DFC0EDD9BAECD8B9EDCAA5AF8679EDE8E9FFFF
        FFFFFFFFFFFFFFFFFFFF9C807BFFFFEBF9EED5FAF1D7F9F2DAF2E3C6FEFBF9FF
        FFF0EFDFC0E9C69EB0857BF5F2F3FFFFFFFFFFFFFFFFFFFFFFFFAF9596F7EAC8
        F9EBCCEFDCBEF4E4C7F0E1C5FDFCECFAF5DDEFDCBCDFB087B59A9AFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFDED4D7BA998CFDECC4EDD4B0E5CAA8EFDBBFF2E3C4F2
        DEBCEABF93BB8E7DE7DFE2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCEBFC5
        BE9A8DE6C7A5EFCBA3ECC8A2E8BE94DCAA86BE9585DFD6D7FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE9E4E6C9B3B4B99C93C3A097BF9F96CC
        B9B7F1EEEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      SpeedButtonOptions.CanBeFocused = False
      TabOrder = 1
      TabStop = False
      OnClick = cxButton1Click
    end
    object cxTextEdit2: TcxTextEdit
      Left = 111
      Top = 24
      TabStop = False
      Anchors = [akLeft, akTop, akRight]
      Enabled = False
      TabOrder = 2
      Width = 183
    end
  end
  inherited cdsRelatorio: TClientDataSet
    Left = 48
    Top = 368
    object cdsRelatorioDataTitulo: TDateField
      FieldName = 'DataTitulo'
    end
    object cdsRelatorioNomeFornecedor: TStringField
      FieldName = 'NomeFornecedor'
      Size = 100
    end
    object cdsRelatorioVencimento: TDateField
      FieldName = 'Vencimento'
    end
    object cdsRelatorioValor: TCurrencyField
      FieldName = 'Valor'
    end
    object cdsRelatorioStatus: TStringField
      FieldName = 'Status'
      Size = 1
    end
    object cdsRelatorioDataPagamento: TDateField
      FieldName = 'DataPagamento'
    end
    object cdsRelatorioValorPago: TCurrencyField
      FieldName = 'ValorPago'
    end
    object cdsRelatorioHistorico: TStringField
      FieldName = 'Historico'
      Size = 100
    end
  end
  inherited dsRelatorio: TDataSource
    Left = 96
    Top = 368
  end
  inherited ppDBRelatorio: TppDBPipeline
    Left = 152
    Top = 368
    object ppDBRelatorioppField1: TppField
      FieldAlias = 'DataTitulo'
      FieldName = 'DataTitulo'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppDBRelatorioppField2: TppField
      FieldAlias = 'NomeFornecedor'
      FieldName = 'NomeFornecedor'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppDBRelatorioppField3: TppField
      FieldAlias = 'Vencimento'
      FieldName = 'Vencimento'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppDBRelatorioppField4: TppField
      FieldAlias = 'Valor'
      FieldName = 'Valor'
      FieldLength = 0
      DataType = dtCurrency
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppDBRelatorioppField5: TppField
      FieldAlias = 'Status'
      FieldName = 'Status'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppDBRelatorioppField6: TppField
      FieldAlias = 'DataPagamento'
      FieldName = 'DataPagamento'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object ppDBRelatorioppField7: TppField
      FieldAlias = 'ValorPago'
      FieldName = 'ValorPago'
      FieldLength = 0
      DataType = dtCurrency
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object ppDBRelatorioppField8: TppField
      FieldAlias = 'Historico'
      FieldName = 'Historico'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
  end
  inherited ppRelatorio: TppReport
    AutoStop = False
    DataPipeline = ppDBRelatorio
    Left = 208
    Top = 368
    DataPipelineName = 'ppDBRelatorio'
    inherited ppTitleBand1: TppTitleBand
      inherited ppLabel1: TppLabel
        SaveOrder = -1
        Caption = 'Relat'#243'rio de Contas '#224' Pagar'
        mmHeight = 11218
        mmLeft = 47010
        mmWidth = 103294
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
      object ppLabel18: TppLabel
        UserName = 'Label18'
        Caption = 'Label18'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Segoe UI'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3768
        mmLeft = 93863
        mmTop = 15610
        mmWidth = 9652
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
        Caption = 'Vencimento'
        mmHeight = 3704
        mmLeft = 21431
        mmTop = 794
        mmWidth = 14817
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
        Caption = 'Data T'#237'tulo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Segoe UI'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3768
        mmLeft = 1852
        mmTop = 794
        mmWidth = 13674
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = 'Fornecedor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Segoe UI'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3768
        mmLeft = 42333
        mmTop = 794
        mmWidth = 14182
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        Caption = 'Hist'#243'rico'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Segoe UI'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3768
        mmLeft = 103188
        mmTop = 794
        mmWidth = 11134
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        Caption = 'Valor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Segoe UI'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3768
        mmLeft = 174096
        mmTop = 794
        mmWidth = 6308
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
        DataField = 'DataTitulo'
        DataPipeline = ppDBRelatorio
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Segoe UI'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDBRelatorio'
        mmHeight = 3768
        mmLeft = 1852
        mmTop = 794
        mmWidth = 17198
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'Vencimento'
        DataPipeline = ppDBRelatorio
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Segoe UI'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDBRelatorio'
        mmHeight = 3768
        mmLeft = 20902
        mmTop = 794
        mmWidth = 17198
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'NomeFornecedor'
        DataPipeline = ppDBRelatorio
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Segoe UI'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBRelatorio'
        mmHeight = 3704
        mmLeft = 40217
        mmTop = 794
        mmWidth = 57944
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'Historico'
        DataPipeline = ppDBRelatorio
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Segoe UI'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBRelatorio'
        mmHeight = 3704
        mmLeft = 99748
        mmTop = 794
        mmWidth = 67204
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'Valor'
        DataPipeline = ppDBRelatorio
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Segoe UI'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBRelatorio'
        mmHeight = 3768
        mmLeft = 168805
        mmTop = 794
        mmWidth = 26723
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
      mmHeight = 7673
      inherited ppLine10: TppLine
        LayerName = Foreground
      end
      object ppLabel17: TppLabel
        UserName = 'Label17'
        Caption = 'Total '#224' Pagar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Segoe UI'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4657
        mmLeft = 146771
        mmTop = 1323
        mmWidth = 21505
        BandType = 7
        LayerName = Foreground
      end
      object ppDBCalc2: TppDBCalc
        UserName = 'DBCalc2'
        DataField = 'Valor'
        DataPipeline = ppDBRelatorio
        DisplayFormat = 'R$ #0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Segoe UI'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBRelatorio'
        mmHeight = 3768
        mmLeft = 171715
        mmTop = 2117
        mmWidth = 23813
        BandType = 7
        LayerName = Foreground
      end
    end
  end
  object ppReport1: TppReport
    AutoStop = False
    DataPipeline = ppDBRelatorio
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.SaveDeviceSettings = False
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Units = utScreenPixels
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
    Left = 264
    Top = 368
    Version = '14.07'
    mmColumnWidth = 0
    DataPipelineName = 'ppDBRelatorio'
    object ppTitleBand2: TppTitleBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 21167
      mmPrintPosition = 0
      object ppLabel8: TppLabel
        UserName = 'Label1'
        Caption = 'Relat'#243'rio de Contas Pagas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Segoe UI'
        Font.Size = 24
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 11218
        mmLeft = 50015
        mmTop = 3969
        mmWidth = 97282
        BandType = 1
        LayerName = Foreground1
      end
      object ppSystemVariable3: TppSystemVariable
        UserName = 'SystemVariable1'
        VarType = vtPrintDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Segoe UI'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3503
        mmLeft = 171715
        mmTop = 15610
        mmWidth = 23813
        BandType = 1
        LayerName = Foreground1
      end
      object ppImage2: TppImage
        OnPrint = ppImage2Print
        UserName = 'Image1'
        AlignHorizontal = ahCenter
        AlignVertical = avCenter
        MaintainAspectRatio = False
        Stretch = True
        mmHeight = 16140
        mmLeft = 1852
        mmTop = 2910
        mmWidth = 16140
        BandType = 1
        LayerName = Foreground1
      end
      object ppLine11: TppLine
        UserName = 'Line1'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 21167
        mmLeft = 0
        mmTop = 0
        mmWidth = 1588
        BandType = 1
        LayerName = Foreground1
      end
      object ppLine12: TppLine
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.750000000000000000
        mmHeight = 529
        mmLeft = 0
        mmTop = 0
        mmWidth = 197300
        BandType = 1
        LayerName = Foreground1
      end
      object ppLine13: TppLine
        UserName = 'Line3'
        ParentHeight = True
        Position = lpRight
        Weight = 0.750000000000000000
        mmHeight = 21167
        mmLeft = 195792
        mmTop = 0
        mmWidth = 1588
        BandType = 1
        LayerName = Foreground1
      end
      object ppLabel19: TppLabel
        UserName = 'Label19'
        Caption = 'Label19'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Segoe UI'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3768
        mmLeft = 93863
        mmTop = 15610
        mmWidth = 9652
        BandType = 1
        LayerName = Foreground1
      end
    end
    object ppHeaderBand2: TppHeaderBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 5027
      mmPrintPosition = 0
      object ppShape3: TppShape
        UserName = 'Shape2'
        Brush.Color = 15059122
        Gradient.EndColor = clSilver
        ParentHeight = True
        ParentWidth = True
        Pen.Style = psClear
        Pen.Width = 0
        mmHeight = 5027
        mmLeft = 0
        mmTop = 0
        mmWidth = 197300
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel9: TppLabel
        UserName = 'Label3'
        Caption = 'Vencimento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Segoe UI'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 26194
        mmTop = 794
        mmWidth = 16140
        BandType = 0
        LayerName = Foreground1
      end
      object ppLine14: TppLine
        UserName = 'Line4'
        ParentWidth = True
        Position = lpBottom
        Weight = 0.750000000000000000
        mmHeight = 529
        mmLeft = 0
        mmTop = 4498
        mmWidth = 197300
        BandType = 0
        LayerName = Foreground1
      end
      object ppLine15: TppLine
        UserName = 'Line5'
        ParentWidth = True
        Weight = 0.750000000000000000
        mmHeight = 529
        mmLeft = 0
        mmTop = 0
        mmWidth = 197300
        BandType = 0
        LayerName = Foreground1
      end
      object ppLine16: TppLine
        UserName = 'Line6'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 5027
        mmLeft = 0
        mmTop = 0
        mmWidth = 1588
        BandType = 0
        LayerName = Foreground1
      end
      object ppLine17: TppLine
        UserName = 'Line7'
        ParentHeight = True
        Position = lpRight
        Weight = 0.750000000000000000
        mmHeight = 5027
        mmLeft = 195792
        mmTop = 0
        mmWidth = 1588
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel10: TppLabel
        UserName = 'Label4'
        Caption = 'Data Pagamento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Segoe UI'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3768
        mmLeft = 1852
        mmTop = 794
        mmWidth = 22754
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel11: TppLabel
        UserName = 'Label5'
        Caption = 'Fornecedor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Segoe UI'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3768
        mmLeft = 43921
        mmTop = 794
        mmWidth = 14182
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel12: TppLabel
        UserName = 'Label6'
        Caption = 'Hist'#243'rico'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Segoe UI'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3768
        mmLeft = 98690
        mmTop = 794
        mmWidth = 11134
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel13: TppLabel
        UserName = 'Label7'
        Caption = 'Valor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Segoe UI'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3768
        mmLeft = 163136
        mmTop = 794
        mmWidth = 6308
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel15: TppLabel
        UserName = 'Label15'
        Caption = 'Valor Pago'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Segoe UI'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3768
        mmLeft = 178594
        mmTop = 794
        mmWidth = 16933
        BandType = 0
        LayerName = Foreground1
      end
    end
    object ppDetailBand2: TppDetailBand
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 4498
      mmPrintPosition = 0
      object ppShape4: TppShape
        OnPrint = ppShape4Print
        UserName = 'Shape1'
        Brush.Color = 15917525
        ParentHeight = True
        ParentWidth = True
        Pen.Color = 15917525
        Pen.Width = 0
        mmHeight = 4498
        mmLeft = 0
        mmTop = 0
        mmWidth = 197300
        BandType = 4
        LayerName = Foreground1
      end
      object ppLine18: TppLine
        UserName = 'Line8'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 4498
        mmLeft = 0
        mmTop = 0
        mmWidth = 1588
        BandType = 4
        LayerName = Foreground1
      end
      object ppLine19: TppLine
        UserName = 'Line9'
        ParentHeight = True
        Position = lpRight
        Weight = 0.750000000000000000
        mmHeight = 4498
        mmLeft = 195792
        mmTop = 0
        mmWidth = 1588
        BandType = 4
        LayerName = Foreground1
      end
      object ppDBText6: TppDBText
        UserName = 'DBText1'
        DataField = 'DataPagamento'
        DataPipeline = ppDBRelatorio
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Segoe UI'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDBRelatorio'
        mmHeight = 3768
        mmLeft = 1852
        mmTop = 794
        mmWidth = 22754
        BandType = 4
        LayerName = Foreground1
      end
      object ppDBText7: TppDBText
        UserName = 'DBText2'
        DataField = 'Vencimento'
        DataPipeline = ppDBRelatorio
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Segoe UI'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDBRelatorio'
        mmHeight = 3768
        mmLeft = 26194
        mmTop = 794
        mmWidth = 16140
        BandType = 4
        LayerName = Foreground1
      end
      object ppDBText8: TppDBText
        UserName = 'DBText3'
        DataField = 'NomeFornecedor'
        DataPipeline = ppDBRelatorio
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Segoe UI'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBRelatorio'
        mmHeight = 3704
        mmLeft = 43921
        mmTop = 794
        mmWidth = 53181
        BandType = 4
        LayerName = Foreground1
      end
      object ppDBText9: TppDBText
        UserName = 'DBText4'
        DataField = 'Historico'
        DataPipeline = ppDBRelatorio
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Segoe UI'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBRelatorio'
        mmHeight = 3704
        mmLeft = 98690
        mmTop = 794
        mmWidth = 55033
        BandType = 4
        LayerName = Foreground1
      end
      object ppDBText10: TppDBText
        UserName = 'DBText5'
        DataField = 'Valor'
        DataPipeline = ppDBRelatorio
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Segoe UI'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBRelatorio'
        mmHeight = 3768
        mmLeft = 155575
        mmTop = 794
        mmWidth = 21431
        BandType = 4
        LayerName = Foreground1
      end
      object ppDBText11: TppDBText
        UserName = 'DBText11'
        DataField = 'ValorPago'
        DataPipeline = ppDBRelatorio
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Segoe UI'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBRelatorio'
        mmHeight = 3768
        mmLeft = 178594
        mmTop = 794
        mmWidth = 16933
        BandType = 4
        LayerName = Foreground1
      end
    end
    object ppFooterBand2: TppFooterBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 10054
      mmPrintPosition = 0
      object ppLabel14: TppLabel
        UserName = 'Label2'
        Border.Color = 9983787
        Caption = 'RentControl'
        Color = 9983787
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Segoe UI'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3768
        mmLeft = 1852
        mmTop = 1323
        mmWidth = 14944
        BandType = 8
        LayerName = Foreground1
      end
      object ppSystemVariable4: TppSystemVariable
        UserName = 'SystemVariable2'
        Border.Color = 9983787
        VarType = vtPageSet
        Color = 9983787
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Segoe UI'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 183886
        mmTop = 1323
        mmWidth = 11377
        BandType = 8
        LayerName = Foreground1
      end
    end
    object ppSummaryBand2: TppSummaryBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 6615
      mmPrintPosition = 0
      object ppLine20: TppLine
        UserName = 'Line10'
        ParentWidth = True
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 0
        mmTop = 0
        mmWidth = 197300
        BandType = 7
        LayerName = Foreground1
      end
      object ppLabel16: TppLabel
        UserName = 'Label8'
        Caption = 'Total Pago'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Segoe UI'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4763
        mmLeft = 150813
        mmTop = 1323
        mmWidth = 17463
        BandType = 7
        LayerName = Foreground1
      end
      object ppDBCalc1: TppDBCalc
        UserName = 'DBCalc1'
        DataField = 'ValorPago'
        DataPipeline = ppDBRelatorio
        DisplayFormat = 'R$ #0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Segoe UI'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBRelatorio'
        mmHeight = 3768
        mmLeft = 171715
        mmTop = 2117
        mmWidth = 23813
        BandType = 7
        LayerName = Foreground1
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
