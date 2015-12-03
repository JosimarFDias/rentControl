object FormPesquisa: TFormPesquisa
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsToolWindow
  Caption = 'Pesquisa de'
  ClientHeight = 313
  ClientWidth = 555
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlFiltros: TPanel
    Left = 0
    Top = 0
    Width = 555
    Height = 51
    Align = alTop
    TabOrder = 0
    object edtPesquisa: TcxTextEdit
      Left = 8
      Top = 15
      Properties.CharCase = ecUpperCase
      TabOrder = 0
      OnKeyDown = edtPesquisaKeyDown
      Width = 241
    end
    object btnPesquisa: TcxButton
      AlignWithMargins = True
      Left = 448
      Top = 4
      Width = 103
      Height = 43
      Align = alRight
      Caption = '&Pesquisar'
      OptionsImage.Glyph.Data = {
        36100000424D3610000000000000360000002800000020000000200000000100
        2000000000000010000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000060000001100000016000000150000000D00000004000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00060000001C00000037000000430000003F0000002B0000000D000000050000
        0010000000160000001600000016000000160000001600000016000000160000
        0016000000160000001600000016000000160000001600000016000000160000
        00160000001600000016000000160000001600000016000000100000000A0000
        001C0000003D4C80A8FF4D80A8FF4D7FA6FF257FB0C400000015000000100000
        0031000000420000004300000043000000430000004300000043000000430000
        0043000000430000004300000043000000430000004300000043000000430000
        00430000004300000043000000430000004300000042000000350000002B0000
        003D4C81ABFF1F97EAFF29AAFFFF36B7FFFF4A8FC0FF0000001600000016AD7C
        18F3B67E0EFFB47B09FFB47A07FFB47A07FFB47B09FFB67E0DFFB78012FFB67E
        0DFFB47B09FFB47B08FFB47B08FFB47B08FFB47B09FFB67E0DFFB78012FFB67E
        0DFFB47B09FFB47B08FFB47B08FFB57B09FFB77E0DFFAB760FED0000004D4580
        B4FF1F97EBFF29A7FFFF32B2FFFF51C6FFFF4792C4FF0000001100000016B67E
        0EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB17600FFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB27600FFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC67E00FF3E7FB9FF1C96
        EEFF27A6FFFF2CAFFFFFD3F1FFFF48CBFFFF4594C8FF0000000600000016B47B
        09FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAF7100FFF8F6
        F9FFF5F0EDFFF4EFEAFFF4EFEAFFF5EFEAFFF6F0ECFFFAF7F9FFB27400FFFAF7
        F9FFF6F0ECFFF5EFE9FFF5F0E9FFF9F2ECFFFFFBF2FF3579B1FF2391E2FF26A7
        FFFF2AAEFFFFCDEEFFFFD7FBFFFF3F8EC3FF000000060000000000000016B47A
        07FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB07200FFE4D8
        D1FFE3D5C9FFE3D4C7FFE4D5C7FFE6D6C5FFE7D7C4FFEBDBCCFFB97A00FFEBDB
        CBFFE8D7C3FFE7D6C2FFE8D7C3FFE6D5C1FF736C6AFF6E92ACFF1EA5FFFF27AE
        FFFFCCEEFFFFD4F9FFFF398CC3FF00000006000000000000000000000016B47A
        07FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAE6F00FFB074
        00FFB17400FFB47700FFB97B00FF9B7527FF7D6D51FF68686DFF69696FFF6768
        6CFF67666AFF7D6D4FFF9F7724FF737275FF9B9996FFADA59EFF80AECBFFC4EE
        FFFFD1F9FFFF378CC6FF0000000600000000000000000000000000000016B47A
        07FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFDFFFFFF898B94FF888A91FFBCBFC6FFE1E6EBFFE0E4EAFFDFE4
        EAFFE1E5EAFFBDBFC5FF8B8C90FF787677FFA2A09EFFB3B0ACFFF4EFEBFFEFFA
        FFFF2B8CD2FF000000160000000000000000000000000000000000000016B47A
        07FFFFFFFFFFFFFFFFFFFFFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFD6BEA3FFFFFF
        FFFFF8F9FAFF716F70FFAFB0B3FFE7E4DFFFF5D1A2FFFFC67EFFFFC376FFFFC3
        75FFFEC47CFFF4D0A0FFE8E4DEFFB2B3B5FF706D6DFFEDEDECFFFAFAFAFF928F
        93FFC17E00FF000000160000000000000000000000000000000000000016B47A
        08FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDABFA5FFFFFF
        FFFF878585FFB9B9BCFFE8E1D7FFF8C077FFF1BF77FFEBC681FFEECF8AFFF2D7
        91FFF4D994FFF7CC83FFF7BD75FFE7E0D7FFB1B1B4FFDBDCDCFF8F8D8DFFFFFF
        FFFFB87E09FF000000160000000000000000000000000000000000000016B47B
        08FFFFFFFFFFD5BB9EFFD6BC9EFFD6BC9EFFD6BC9FFFD8BFA3FFDEC5A9FFB6A6
        94FF8C8C8DFFEAE7E1FFEDB973FFE8BA78FFE8C17DFFEECC87FFF2D591FFF5DE
        99FFF8E59FFFF9E7A0FFF7DB92FFECB56FFFE9E6E0FF8B8B8BFFB7A593FFFFFF
        FFFFB67C09FF000000160000000000000000000000000000000000000016B47A
        08FFFFFFFFFFFFFFFCFFFFFFFBFFFFFFFBFFFFFFFDFFFFFFFFFFE0C5A7FF9797
        98FFC6C9CDFFE8C698FFEAC088FFECCC9AFFEDCC91FFEFCE8BFFF3D893FFF7E3
        9DFFFDECA6FFFDEFA9FFF9E7A0FFEEC67EFFE7C599FFC6C8CCFF959494FFFFFF
        FFFFB57C09FF000000160000000000000000000000000000000000000016B47A
        07FFFFFFFFFFFFFCF5FFFEFBF3FFFEFBF3FFFFFCF4FFFFFFFBFFDFC5A5FF7070
        72FFF3F7FBFFDDA962FFF0D5B3FFEED2A7FFEFD29FFFF1D59AFFF3D893FFF7E1
        9BFFFCEBA5FFFDECA6FFF9E59FFFF5DA94FFDCA865FFF2F5FBFF6E6C6EFFFFFF
        FFFFB67C09FF000000160000000000000000000000000000000000000016B47A
        08FFFFFFFFFFFFFBF2FFFEFAF0FFFEFAF0FFFFFBF1FFFFFFF8FFE0C4A4FF7273
        74FFF6FAFFFFD29B52FFF4DEC2FFF0D8B2FFF0D6AAFFF2D7A3FFF3DA9EFFF5DC
        96FFF7E29BFFF7E39DFFF6DF9AFFF5D993FFD29B56FFF6F9FFFF706F70FFFFFF
        FFFFB67C09FF000000160000000000000000000000000000000000000016B47A
        08FFFFFFFFFFFFFDF2FFFFFCF1FFFFFDF2FFFFFEF4FFFFFFFCFFE2C7A8FF7576
        7AFFF9FEFFFFC7934AFFF7E6D1FFF2DDBFFFF2DAB4FFF2D9ACFFF2D9A5FFF3DA
        9EFFF3D893FFF3D893FFF3D692FFF2D28DFFC89450FFF8FDFFFF727072FFFFFF
        FFFFB67C09FF000000160000000000000000000000000000000000000016B47B
        08FFFFFFFFFFD4B793FFD4B894FFD5B895FFD6BA97FFDAC1A2FFB75C00FF787C
        81FFFEFFFFFFC39150FFF8E7D6FFF6E3CDFFF3DDBEFFF2DBB4FFF2D9ACFFF2D7
        A3FFF1D59AFFEFCF8BFFEFCD88FFECC782FFC49456FFFDFFFFFF737272FFFFFF
        FFFFB67C09FF000000160000000000000000000000000000000000000016B47A
        08FFFFFFFFFFFFFBEDFFFFFAEDFFFFFBEDFFFFFDF0FFFFFFFEFFB65D04FF9893
        8EFFD7DADFFFD1B389FFE1C9A9FFF9ECDDFFF5E4CBFFF3DDBEFFF2DAB4FFF0D6
        AAFFEFD29FFFEECD91FFEBC57FFFD0A462FFD2B58EFFD5D7DAFF9A9794FFFFFF
        FFFFB57C09FF000000160000000000000000000000000000000000000016B47A
        08FFFFFFFFFFFFF7E6FFFEF6E5FFFEF6E5FFFFF8E8FFFFFFF7FFB35C04FFC4AF
        99FF9B9EA3FFFAF8F4FFB5884BFFF9EDE1FFFAEDDEFFF6E4CDFFF3DEBFFFF1D8
        B3FFF0D3A7FFEFCE9BFFE0B272FFB2864AFFFAF9F5FF99989AFFD2CCC0FFFFFF
        FFFFB57B09FF000000160000000000000000000000000000000000000016B47A
        08FFFFFFFFFFFFF6E2FFFEF5E2FFFEF5E2FFFFF7E5FFFFFFF4FFB25B04FFEECB
        A1FF908B87FFCBCDD0FFF4EFE7FFAD8247FFDBC3A6FFF7E8D6FFF9E8D2FFF7E0
        C3FFF1D7B3FFCEA977FFAB8046FFF5F1EAFFD2D4D7FF938F8CFFFFFEE9FFFFFF
        FFFFB47B08FF000000160000000000000000000000000000000000000016B47A
        08FFFFFFFFFFFFF7E2FFFFF7E3FFFFF8E4FFFFF9E6FFFFFFF4FFB25C07FFECCA
        A2FFDFC097FF838484FFD6DADEFFFFFDF9FFC9AD86FFA97B3EFFA27331FFA373
        33FFAA7D41FFCAB08AFFFFFEFBFFCED0D3FF838283FFF9EFDDFFFFFBE5FFFFFF
        FFFFB47B08FF000000160000000000000000000000000000000000000016B47B
        09FFFFFFFFFFD4B289FFD5B48BFFD5B48CFFD6B68FFFDABF9BFFB25E0AFFCE9F
        6BFFCF9C65FFC79966FF8D867EFFA3A4A9FFE1E6EAFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFE2E7EBFFA3A5AAFF8E8984FFD1B48FFFD9B78EFFD6B48AFFFFFF
        FFFFB47B09FF000000160000000000000000000000000000000000000016B47A
        08FFFFFFFFFFFFF5DDFFFFF5DEFFFFF6DFFFFFF7E2FFFFFFEFFFB15C08FFE8C7
        9FFFE6C398FFE7C396FFEAC393FFC2AB8EFF94897DFF808387FF7F8285FF7F82
        85FF7F8286FF9C958DFFA16A33FFFFFFEAFFFFF9E2FFFFF6DEFFFFF5DDFFFFFF
        FFFFB47A08FF000000160000000000000000000000000000000000000016B47A
        08FFFFFFFFFFFEF1D6FFFDF0D6FFFDF1D7FFFFF3DAFFFFFDE8FFB05B06FFE6C4
        9AFFE4C094FFE4BE91FFE5BF92FFE8C294FFCF9A5FFFEBC393FFEAC190FFEAC1
        90FFEAC291FFEBC697FFB35A03FFFFFDE6FFFFF3DAFFFEF0D6FFFEF1D6FFFFFF
        FFFFB47A08FF000000160000000000000000000000000000000000000016B47A
        08FFFFFFFFFFFEF0D3FFFDEFD3FFFDF0D4FFFFF2D7FFFFFCE4FFB05B07FFE6C5
        98FFE5C092FFE4BF91FFE4C091FFE6C294FFCC9962FFE7C394FFE5C091FFE5C0
        91FFE6C192FFE8C698FFB15B07FFFFFCE4FFFFF2D7FFFDEFD3FFFEF0D3FFFFFF
        FFFFB47A08FF000000160000000000000000000000000000000000000016B47B
        09FFFFFFFFFFFFF2D2FFFFF2D3FFFFF3D5FFFFF4D7FFFFFEE3FFB35D09FFEAC9
        9DFFE9C698FFE9C597FFE9C597FFE9C79AFFCF9C68FFE9C79AFFE9C597FFE9C5
        97FFE9C698FFEAC99DFFB35D09FFFFFEE3FFFFF4D7FFFFF2D3FFFFF2D2FFFFFF
        FFFFB47B09FF000000160000000000000000000000000000000000000016B57B
        09FFFFFFFFFFDEB27CFFE3B47EFFE4B57FFFE4B681FFE4BD8BFFBA5E05FFBD60
        06FFBF5F03FFC05F02FFBF5F03FFBD5F05FFBB6009FFBD5F05FFBF5F03FFC05F
        02FFBF5F03FFBD6006FFBA5E05FFE4BD8BFFE4B681FFE3B47EFFDEB27CFFFFFF
        FFFFB57B09FF000000160000000000000000000000000000000000000016B67B
        08FFFFFFFFFF4DC5FFFF56C8FFFF58C9FFFF57C9FFFF52CCFFFFEDBE87FF54D1
        FFFF5AD1FFFF5BD0FFFF5AD1FFFF54D1FFFFEEC089FF54D1FFFF5AD1FFFF5BD0
        FFFF5AD1FFFF54D1FFFFEDBE87FF52CCFFFF57C9FFFF56C8FFFF4DC5FFFFFFFF
        FFFFB67B08FF000000160000000000000000000000000000000000000015B67C
        09FFFFFFFFFF4CC3FFFF54C5FFFF56C6FFFF55C6FFFF4FC7FFFFE9B67BFF50C7
        FFFF56C7FFFF57C7FFFF56C7FFFF50C7FFFFE9B67BFF50C7FFFF56C7FFFF57C7
        FFFF56C7FFFF50C7FFFFE9B67BFF4FC7FFFF55C6FFFF54C5FFFF4CC3FFFFFFFF
        FFFFB67C09FF00000015000000000000000000000000000000000000000DB67E
        0EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFB67E0EFF0000000D0000000000000000000000000000000000000004805B
        11B4B67E0EFFB67C09FFB67B07FFB67B07FFB67B07FFB67B08FFB57B08FFB67B
        08FFB67B07FFB67B07FFB67B07FFB67B08FFB57B08FFB67B08FFB67B07FFB67B
        07FFB67B07FFB67B08FFB57B08FFB67B08FFB67B07FFB67B07FFB67C09FFB67E
        0EFF805B11B40000000400000000000000000000000000000000}
      TabOrder = 1
      OnClick = btnPesquisaClick
    end
  end
  object cxGrid1: TcxGrid
    Left = 0
    Top = 51
    Width = 555
    Height = 211
    Align = alClient
    TabOrder = 1
    object cxGrid1DBTableView1: TcxGridDBTableView
      OnDblClick = cxGrid1DBTableView1DblClick
      OnKeyPress = cxGrid1DBTableView1KeyPress
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = DataSource1
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 262
    Width = 555
    Height = 51
    Align = alBottom
    TabOrder = 2
    object btnSelecionar: TcxButton
      AlignWithMargins = True
      Left = 448
      Top = 4
      Width = 103
      Height = 43
      Align = alRight
      Caption = '&Selecionar'
      OptionsImage.Glyph.Data = {
        36100000424D3610000000000000360000002800000020000000200000000100
        2000000000000010000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000030000000900000011000000150000001600000016000000160000
        0016000000150000001100000009000000030000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000001000000060000
        00100000001B0000002900000038000000410000004300000043000000430000
        00430000004100000038000000290000001B0000001000000006000000010000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000000000030000000D000000200000
        00350006034C003D209900713DDE008C4AFF008B4AFF008B4AFF008B4AFF008B
        4AFF008C4AFF00713DDE003D20990006034C00000035000000200000000D0000
        0003000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000005000000160000002E0011095A0073
        3EDF008D4DFF009A5EFF00A269FF00AA74FF00AC77FF00AC77FF00AC77FF00AC
        77FF00AA74FF00A269FF009A5EFF008D4DFF00733EDF0011095A0000002E0000
        0016000000050000000000000000000000000000000000000000000000000000
        0000000000000000000000000005000000190000003800522CB4008D4DFF00A0
        67FF01B07CFF20BD90FF3ECCA5FF57D8B6FF5DDBBAFF5DDBB9FF5DDBB9FF5DDB
        B9FF57D8B6FF3ECCA5FF20BD90FF01B07CFF00A067FF008D4DFF00522CB40000
        0038000000190000000500000000000000000000000000000000000000000000
        00000000000000000005000000190000003A007D43ED009558FF00AA74FF2BC4
        99FF57D8B6FF3EDAB0FF1ED8A4FF05D79CFF00D797FF00D797FF00D797FF00D7
        97FF05D79CFF1ED8A4FF3EDAAFFF57D8B6FF2BC498FF00AA74FF009558FF007D
        43ED0000003A0000001900000005000000000000000000000000000000000000
        0000000000030000001600000038007C41EB009E64FF07B27FFF4BD3AEFF44DA
        B1FF05D79CFF00D698FF00D598FF00D598FF00D599FF00D599FF00D599FF00D5
        99FF00D598FF00D598FF00D698FF05D79CFF44DAB0FF4BD3AEFF07B27FFF009E
        64FF007C41EB0000003800000016000000030000000000000000000000000000
        00010000000D0000002E007D43EC009E64FF0CB583FF57D8B7FF24D7A7FF00D5
        97FF00D498FF00D499FF00D499FF00D499FF00D499FF00D499FF00D499FF00D4
        99FF00D499FF00D499FF00D499FF00D498FF00D598FF24D7A6FF57D8B6FF0CB5
        83FF009E64FF007D43EC0000002E0000000D0000000100000000000000000000
        00060000001F00512BB0009558FF07B17FFF57D8B7FF1ED6A4FF00D397FF00D3
        99FF00D399FF00D399FF00D398FF00D298FF00D398FF00D399FF00D399FF00D3
        99FF00D399FF00D399FF00D399FF00D399FF00D399FF00D398FF1ED6A4FF57D8
        B6FF07B17FFF009558FF00512BB00000001F0000000600000000000000000000
        00100010094C008D4DFF00AA73FF4BD3AFFF24D6A7FF00D397FF00D399FF00D3
        99FF00D398FF00D296FF00D093FF00D091FF00D093FF00D296FF00D398FF00D3
        99FF00D399FF00D399FF00D399FF00D399FF00D399FF00D399FF00D397FF24D6
        A6FF4BD3AEFF00AA74FF008D4DFF0010094C0000001000000000000000030000
        001B00723EDD00A067FF2BC599FF44D9B2FF00D297FF00D299FF00D299FF00D2
        98FF00D096FF00CE8FFFACF0DEFFFFFFFFFFACF0DEFF00CE8FFF00D096FF00D2
        98FF00D299FF00D299FF00D299FF00D299FF00D299FF00D299FF00D299FF00D2
        97FF44D9B0FF2BC598FF00A067FF00723EDD0000001B00000003000000090006
        0332008D4DFF01B07CFF57D8B8FF05D39CFF00D198FF00D199FF00D198FF00CF
        96FF00CC8FFFA7F0DCFFFFFFFFFFFFFFFFFFFFFFFFFFA7F0DCFF00CC8FFF00CF
        96FF00D198FF00D199FF00D199FF00D199FF00D199FF00D199FF00D199FF00D1
        98FF05D39CFF57D8B6FF01B07CFF008D4DFF000603320000000900000011003C
        218D009A5EFF20BD91FF3ED8B1FF00D097FF00D099FF00D098FF00CE96FF00CB
        8FFFA7F0DCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA7F0DCFF00CB
        8FFF00CE96FF00D098FF00D099FF00D099FF00D099FF00D099FF00D099FF00D0
        99FF00D098FF3ED8AFFF20BD90FF009A5EFF003C218D00000011000000150071
        3DDA00A268FF3DCCA7FF1ED4A5FF00D098FF00D099FF00CF96FF00CB90FFA7EF
        DCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA7EF
        DCFF00CB8FFF00CF96FF00D098FF00D099FF00D099FF00D099FF00D099FF00D0
        99FF00D098FF1ED4A4FF3ECDA5FF00A269FF00713DDA0000001500000016008C
        4AFF00AA74FF59DBBBFF05D09BFF00CF98FF00CF98FF00CC93FFAFF0DFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFA7EFDCFF00CA8FFF00CD96FF00CF98FF00CF99FF00CF99FF00CF99FF00CF
        99FF00CF98FF05D19CFF56D9B6FF00AA74FF008C4AFF0000001600000016008B
        4AFF00AB76FF64E2C4FF00CD97FF00CE98FF00CE98FF00CB93FFECFCF8FFFFFF
        FFFFFFFFFFFFFFFFFFFFA3EEDBFF00C687FFA3EEDBFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFA7EFDCFF00C98FFF00CC96FF00CE98FF00CE99FF00CE99FF00CE
        99FF00CE99FF00CE97FF5DDCBAFF00AC77FF008B4AFF0000001600000016008B
        49FF03B07DFF67E5C7FF00CC96FF00CD98FF00CD98FF00CB95FF1FD4A5FFFFFF
        FFFFFFFFFFFFA8EEDCFF00C88EFF00CA93FF00C88EFFA7EEDCFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFA7EEDCFF00C88FFF00CB96FF00CD98FF00CD99FF00CD
        99FF00CD99FF00CD97FF5DDCBAFF00AC77FF008B4AFF0000001600000016008A
        48FF10B686FF6BEACBFF00CB96FF00CD98FF00CD99FF00CC97FF00CA92FF8CE8
        D1FFB3F0E1FF00C890FF00CB96FF00CD98FF00CB96FF00C88FFFA7EEDCFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFA7EEDCFF00C88FFF00CB96FF00CD98FF00CD
        99FF00CD99FF00CD97FF5DDCBAFF00AC77FF008B4AFF0000001600000015008A
        48FF1FBC8FFF6FEDCFFF00CA95FF00CC98FF00CC99FF00CC99FF00CB97FF00CA
        94FF00CA94FF00CB97FF00CC98FF00CC99FF00CC98FF00CA96FF00C78FFFA7EE
        DCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA7EEDCFF00C790FF00CB96FF00CC
        99FF00CC99FF00CC97FF5DDCBAFF00AC77FF008B4AFF0000001500000011008A
        48FF28BF93FF6FEED0FF05CD9CFF00CA97FF00CB99FF00CB99FF00CB99FF00CB
        98FF00CB98FF00CB99FF00CB99FF00CB99FF00CB99FF00CB98FF00C996FF00C6
        8FFFA7EEDCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAFEFDFFF00C893FF00CB
        98FF00CB98FF05CC9CFF56D9B6FF00AA74FF008C4AFF00000011000000090070
        3BD626B484FF64E6C6FF23D6ABFF00C896FF00CA99FF00CA99FF00CA99FF00CA
        99FF00CA99FF00CA99FF00CA99FF00CA99FF00CA99FF00CA99FF00CA98FF00C8
        96FF00C58FFFA7EDDCFFFFFFFFFFFFFFFFFFFFFFFFFFECFBF8FF00C793FF00C9
        98FF00CA98FF1ED1A4FF3ECDA5FF00A269FF00713CD60000000900000003003C
        207C1BA772FF5DDEBEFF4DE6C3FF00C795FF00CA98FF00CA99FF00CA99FF00CA
        99FF00CA99FF00CA99FF00CA99FF00CA99FF00CA99FF00CA99FF00CA99FF00CA
        98FF00C896FF00C58FFFA8EDDCFFFFFFFFFFFFFFFFFF1FCFA5FF00C895FF00CA
        98FF00CA97FF3ED6B0FF20BE91FF009A5EFF003C217C00000003000000000006
        031A008C4BFF5DDABAFF77F6DAFF03CB9BFF00C797FF00C999FF00C999FF00C9
        99FF00C999FF00C999FF00C999FF00C999FF00C999FF00C999FF00C999FF00C9
        99FF00C998FF00C796FF00C490FFB3F0E1FF8CE7D1FF00C692FF00C897FF00C9
        98FF05CB9CFF57D9B7FF01B07CFF008D4DFF0006031A00000000000000000000
        000600703AD63EBD91FF75EDD1FF59ECCAFF00C494FF00C797FF00C899FF00C8
        99FF00C899FF00C899FF00C899FF00C899FF00C899FF00C899FF00C899FF00C8
        99FF00C899FF00C898FF00C797FF00C594FF00C694FF00C797FF00C898FF00C7
        97FF44D7B2FF2BC599FF00A167FF00723ED60000000600000000000000000000
        000100100929008C4BFF75E0C5FF7EF9DCFF2DDBB3FF00C494FF00C697FF00C7
        99FF00C799FF00C799FF00C799FF00C799FF00C799FF00C799FF00C799FF00C7
        99FF00C799FF00C799FF00C799FF00C798FF00C798FF00C798FF00C697FF24D0
        A7FF4BD3AFFF00AA73FF008D4DFF001009290000000100000000000000000000
        00000000000300502A9C21A56FFF90F0DBFF7CFCE0FF25D7AEFF00C394FF00C6
        97FF00C799FF00C799FF00C799FF00C799FF00C799FF00C799FF00C799FF00C7
        99FF00C799FF00C799FF00C799FF00C799FF00C799FF00C697FF1ECFA5FF57D9
        B7FF07B27FFF009558FF00512C9C000000030000000000000000000000000000
        0000000000000000000500793EE753C59DFF9EF9E7FF7DFCDFFF2CDBB3FF00C1
        93FF00C496FF00C598FF00C699FF00C699FF00C699FF00C699FF00C699FF00C6
        99FF00C699FF00C699FF00C699FF00C598FF00C597FF24CFA7FF57D9B8FF0CB5
        83FF009F64FF007D43E700000005000000000000000000000000000000000000
        000000000000000000000000000500773AE55EC9A4FFB5FFF4FF85FDE3FF58EC
        CBFF02C69BFF00C194FF00C396FF00C397FF00C498FF00C498FF00C498FF00C4
        98FF00C498FF00C497FF00C397FF04C79CFF45D6B3FF4BD4B0FF07B27EFF009E
        64FF007C42E50000000500000000000000000000000000000000000000000000
        00000000000000000000000000000000000500793CE632AD7AFFC0FFF7FF9CFF
        EAFF7EFDE0FF50E8C5FF25D6AEFF03C79BFF00BF93FF00C094FF00C094FF00C1
        94FF05C69BFF22D0AAFF45DCB8FF5FE0C0FF2DC69DFF00AA73FF009558FF007D
        43E6000000050000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000300502999008C4BFF72D5
        B4FFADFDEFFF91F8E1FF81F8DCFF7BF9DCFF79F8DBFF76F6D8FF73F3D5FF73F1
        D4FF6CECCEFF56DEBBFF34CAA2FF0CB684FF00A066FF008D4CFF00522C990000
        0003000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000000000000000000100100923006F
        37D3008C4BFF3DB688FF5CCDA9FF75E1C6FF6FDFC5FF60D9B9FF50D2B0FF41CB
        A7FF30C398FF17AE7BFF089F65FF008C4CFF00723DD300110923000000010000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000006030E003B1F72006E39D1008744FF008744FF008744FF008845FF0089
        46FF008A47FF00703BD1003C21720006030E0000000000000000000000000000
        0000000000000000000000000000000000000000000000000000}
      TabOrder = 0
      OnClick = btnSelecionarClick
    end
  end
  object SQLDataSet1: TSQLDataSet
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM.Connect
    Left = 304
    Top = 160
  end
  object DataSetProvider1: TDataSetProvider
    DataSet = SQLDataSet1
    Left = 344
    Top = 160
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider1'
    Left = 384
    Top = 160
  end
  object DataSource1: TDataSource
    DataSet = ClientDataSet1
    Left = 424
    Top = 160
  end
end