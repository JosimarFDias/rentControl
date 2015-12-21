inherited Frm_Rel_RelacaoCliente: TFrm_Rel_RelacaoCliente
  Caption = 'Frm_Rel_RelacaoCliente'
  PixelsPerInch = 96
  TextHeight = 13
  inherited cxGroupBox1: TcxGroupBox
    inherited cxLabel1: TcxLabel
      Caption = 'Rela'#231#227'o de Clientes'
      Style.IsFontAssigned = True
      AnchorX = 170
      AnchorY = 34
    end
  end
  inherited cdsRelatorio: TClientDataSet
    object cdsRelatorioCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object cdsRelatorioNome: TStringField
      FieldName = 'Nome'
      Size = 100
    end
    object cdsRelatorioTelefone: TStringField
      FieldName = 'Telefone'
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
      FieldAlias = 'Telefone'
      FieldName = 'Telefone'
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
        Caption = 'Rela'#231#227'o de Clientes'
        mmHeight = 11218
        mmLeft = 62482
        mmWidth = 72348
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
        Caption = 'C'#243'digo'
        TextAlignment = taCentered
        mmHeight = 3768
        mmLeft = 4222
        mmWidth = 9017
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
        mmLeft = 85578
        mmTop = 529
        mmWidth = 7705
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = 'Telefone'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Segoe UI'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3768
        mmLeft = 173104
        mmTop = 529
        mmWidth = 10456
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
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDBRelatorio'
        mmHeight = 3260
        mmLeft = 1852
        mmTop = 794
        mmWidth = 13758
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
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBRelatorio'
        mmHeight = 3175
        mmLeft = 20373
        mmTop = 794
        mmWidth = 138113
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'Telefone'
        DataPipeline = ppDBRelatorio
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDBRelatorio'
        mmHeight = 3175
        mmLeft = 161396
        mmTop = 794
        mmWidth = 33867
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
      inherited ppLine10: TppLine
        LayerName = Foreground
      end
    end
  end
end
