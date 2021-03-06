object FormCadastroPagar: TFormCadastroPagar
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Cadastro de Conta '#224' Pagar'
  ClientHeight = 162
  ClientWidth = 544
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object cxDBTextEdit1: TcxDBTextEdit
    Left = 73
    Top = 10
    DataBinding.DataField = 'FornecedorCodigo'
    DataBinding.DataSource = dsDados
    Properties.CharCase = ecUpperCase
    TabOrder = 0
    OnKeyPress = cxDBTextEdit1KeyPress
    Width = 67
  end
  object cxDBDateEdit1: TcxDBDateEdit
    Left = 73
    Top = 39
    DataBinding.DataField = 'Vencimento'
    DataBinding.DataSource = dsDados
    TabOrder = 1
    Width = 121
  end
  object cxLabel1: TcxLabel
    Left = 8
    Top = 11
    Caption = 'Fornecedor'
    Transparent = True
  end
  object cxDBTextEdit2: TcxDBTextEdit
    Left = 202
    Top = 10
    TabStop = False
    DataBinding.DataField = 'FornecedorNome'
    DataBinding.DataSource = dsDados
    Enabled = False
    Properties.ReadOnly = True
    TabOrder = 3
    Width = 326
  end
  object cxButton1: TcxButton
    Left = 146
    Top = 8
    Width = 50
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
    TabOrder = 4
    TabStop = False
    OnClick = cxButton1Click
  end
  object cxLabel2: TcxLabel
    Left = 8
    Top = 40
    Caption = 'Vencimento'
    Transparent = True
  end
  object cxDBCurrencyEdit1: TcxDBCurrencyEdit
    Left = 234
    Top = 39
    DataBinding.DataField = 'Valor'
    DataBinding.DataSource = dsDados
    TabOrder = 6
    Width = 121
  end
  object cxLabel3: TcxLabel
    Left = 200
    Top = 40
    Caption = 'Valor'
    Transparent = True
  end
  object cxDBTextEdit3: TcxDBTextEdit
    Left = 73
    Top = 66
    DataBinding.DataField = 'Historico'
    DataBinding.DataSource = dsDados
    Properties.CharCase = ecUpperCase
    TabOrder = 8
    Width = 455
  end
  object cxLabel4: TcxLabel
    Left = 8
    Top = 67
    Caption = 'Hist'#243'rico'
    Transparent = True
  end
  object cxButton2: TcxButton
    Left = 176
    Top = 118
    Width = 89
    Height = 25
    Caption = 'Gravar'
    OptionsImage.Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      1800000000000003000000000000000000000000000000000000C1761BC27519
      BD6B13B96504B96504B96504BA6504BA6504BA6504BA6504BA6504BA6504BA65
      04BC690AB96A15C3791FD5933DEFB736CDC6C0E9F8FFDBE5F6DBE8F8DBE8F8DB
      E8F9DBE8F8DAE7F8DBE7F8D8E4F5E9F6FFCDC6C0EAA714C0761DCD9551E8AE3C
      DCD7D4ECE8E9ADA0A2A79B9E9E939594898C8A818583797C7B7276685F64ECE8
      E9DCD7D4E59E20C77B25D09653EAB447DCD7D4EFF0EFDFDEDCE1E0DFE0DFDEDF
      E0DDE0DFDDDFDEDDDFE0DEDBD9D9EDEDEDDCD7D4E7A62BC9802BD49B58EBB950
      DCD7D4ECE8E9A99D9FA4999E9A919492888B897F8582797C7A7177655C62ECE8
      E9DCD7D4E8AC37CC8531D69E5BEDBD5ADCD7D4FFFFFFFFFEFEFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDCD7D4EAB340D08B34D9A45EF0C263
      DCD7D4ECE8E9A99D9FA4999E9A919492888B897F8582797C7A7177655C62ECE8
      E9DCD7D4EDB749D2903AD8A35CF0C66DDCD7D4FFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDCD7D4EEBD54D7963EDEAC69F9D281
      C1975C9A7B6095775E97795D97795D97795D97795D97795C97795C95775E9A7A
      5EC19A64F7CA6BD99B44DDAB67F6D58BFFD056C0A887C8C5C9CEC6BFCDC6C0CD
      C6C0CDC6BFD6D0CAD6D3D0CFCED4C0A888FFD25DF3CC75DCA148DCA966F6D993
      FBC85DC2B4A2D7DEEBDDDDDDDCDDDEDCDBDDE7E8EAC8BAA7A29692C2B4A2C6BC
      A9FBCB63F3D07EE0A74CE5B973F6DA97FBCC62C8BAA7DDE0E9E1DFDDE0DFDEDF
      DDDCEFF3F99F886FE5AF479E9189C7BDB2FDCF6AF5D484E3AC51E9BC75F8DD9E
      FDCF69CEC0AFE3E7EFE7E5E3E6E5E4E5E4E2F1F6FFBAA386FFE873B5AB9ECAC0
      B8FFD26EF9DA8EE7B25BEAC079F8E09BFBD165D3C4AFEAEEF6ECEBE8ECEBE9EB
      E9E6FBFFFFA28E78DEAF4FA89C95D1C7B9FFDA78F5D889E2A442ECC47EFEF4D5
      FFE290DCD7D4F5FFFFF6FEFFF6FEFFF6FDFFFFFFFFDFDDDCC8BAA7DFDDDCE5E4
      E2FFDE88E4AA45FCF5ECECC681F0CA82F4CA7DE8C788EFCF94EFD498EDCF92EE
      D092EED093F2D396F7D79BF6D69BE6C48AEBB552FDF9F2FFFFFF}
    TabOrder = 10
    OnClick = cxButton2Click
  end
  object cxButton3: TcxButton
    Left = 271
    Top = 118
    Width = 89
    Height = 25
    Caption = 'Cancelar'
    OptionsImage.Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      1800000000000003000000000000000000000000000000000000FFFFFF5C58DA
      2722CE2622CF2722CE2520CB2420CB241FCB2520CB251FCA251FCA2620CD231E
      C82620CD5B56D9FFFFFF605FE12E2DFB2423EF0B06B6201DE52B29FA2824F428
      24F42723F42722F42925FC130DCE0A05B0211AEF2921FB5D5ADE2423D6272BEF
      1312B16A67BF1B1AB01F20E22D2EF4282AED2929EE2C2DF40E0DCA3F3CB59090
      CE1210B12321EE201CD22C2CD4100EBB918ED3FFFFFFADAAE0100FB21C20E030
      36F42F35F40D0DCE3835B8ECECF8FFFFFF6A67C60F0DC02B29D53034DB1D24D7
      433DC3EBEAF8FFFFFFAFADE31D1BB91D24DE171CD73934BEEEEDF9FFFFFFACAA
      E41F1BBD252CE72E2DD83136DC384FFA161ED43A32C5EDEDF9FFFFFFD0CEF020
      1FC11E1DC0E2E2F6FFFFFFB3B1E81511BF232DE53241F72F30D82E34DD364FF3
      3950F3151DD83E35CCDEDBF6FFFFFFCFCDF2CFCEF3FFFFFFD4D3F32321C7202C
      E33447F43144F22B2FDB5056E53B55F3334BEF3852F41F2ADF211DCBCDCCF4FF
      FFFFFFFFFFCDCBF42120CD2232E3354DF42F44EE364DF24E52E36E72EA6E82F7
      556AF24862F32B3BE8221FD2CDCBF3FFFFFFFFFFFFCDCBF4201DD2242FE4445D
      F35366F26A7DF66B6FE96B70EC7388F7788CF66472F1514BE0D5D2F7FFFFFFDC
      DAF8DCDAF8FFFFFFDCDAF8655EE2575EEA7588F66F83F6686DEA6C72EE7891F7
      6779F25550E6CAC6F6FFFFFFE9E8FC5851E65954E6E0DEFAFFFFFFF6F5FD6F69
      E9575FEC748CF76A6FED6E76EF6F82F35E59EBC2BFF7FFFFFFF2F1FD6E66EC5D
      68EF6472F15E57EBC5C1F8FFFFFFF1F0FD7670EC616BF16D74EF7078F15A5CEF
      928BF3FFFFFFF1F0FE6F68F05B64EF7A92F67A91F66775F25551EDC3BFF9FFFF
      FFAFA8F75857F06C71EF6C75F37A91F65A57F0AEA8F77771F35F68F27D96F679
      8EF5788EF57C94F66D7FF45F5BF0948CF55956F1758BF66A73F1949BF685A1F7
      7C94F65B5BF36975F584A1F88099F77F98F77F98F77E97F6819CF67588F55C5F
      F37990F5819DF79399F5FFFFFF969BF8757BF57278F5757CF5737AF5737AF572
      7AF5727AF5737AF57279F5737AF5737AF4737AF4959AF7FFFFFF}
    TabOrder = 11
    OnClick = cxButton3Click
  end
  object cdsDados: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 416
    Top = 65528
    object cdsDadosCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object cdsDadosDataTitulo: TDateField
      FieldName = 'DataTitulo'
    end
    object cdsDadosVencimento: TDateField
      FieldName = 'Vencimento'
    end
    object cdsDadosValor: TCurrencyField
      FieldName = 'Valor'
    end
    object cdsDadosStatus: TStringField
      FieldName = 'Status'
      Size = 1
    end
    object cdsDadosStatus_Str: TStringField
      FieldName = 'Status_Str'
      Size = 10
    end
    object cdsDadosDataPagamento: TDateField
      FieldName = 'DataPagamento'
    end
    object cdsDadosValorPago: TCurrencyField
      FieldName = 'ValorPago'
    end
    object cdsDadosHistorico: TStringField
      FieldName = 'Historico'
      Size = 100
    end
    object cdsDadosFornecedorNome: TStringField
      FieldName = 'FornecedorNome'
      Size = 100
    end
    object cdsDadosFornecedorCodigo: TIntegerField
      FieldName = 'FornecedorCodigo'
    end
  end
  object dsDados: TDataSource
    DataSet = cdsDados
    Left = 448
    Top = 65528
  end
end
