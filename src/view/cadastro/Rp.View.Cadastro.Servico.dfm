inherited FrmCadastroServico: TFrmCadastroServico
  Caption = 'FrmCadastroServico'
  ClientHeight = 136
  ClientWidth = 389
  ExplicitWidth = 401
  ExplicitHeight = 174
  TextHeight = 15
  inherited pnlBackground: TPanel
    Width = 389
    Height = 136
    ExplicitWidth = 385
    ExplicitHeight = 135
    object Label1: TLabel [0]
      Left = 7
      Top = 9
      Width = 39
      Height = 15
      Caption = 'C'#243'digo'
    end
    object Label2: TLabel [1]
      Left = 87
      Top = 9
      Width = 51
      Height = 15
      Caption = 'Descricao'
    end
    object Label3: TLabel [2]
      Left = 7
      Top = 49
      Width = 26
      Height = 15
      Caption = 'Valor'
    end
    inherited pnlBottom: TPanel
      Top = 101
      Width = 389
      ExplicitTop = 100
      ExplicitWidth = 385
      inherited btnConfirm: TSpeedButton
        Left = 257
        ExplicitLeft = 347
      end
      inherited btnCancel: TSpeedButton
        Left = 125
        ExplicitLeft = 215
      end
    end
    object EdtCodigo: TEdit
      Left = 7
      Top = 24
      Width = 74
      Height = 23
      TabOrder = 1
    end
    object EdtDescricao: TEdit
      Left = 87
      Top = 22
      Width = 288
      Height = 23
      TabOrder = 2
    end
    object Panel3: TPanel
      Left = 87
      Top = 51
      Width = 288
      Height = 40
      BevelOuter = bvNone
      Ctl3D = True
      ParentBackground = False
      ParentCtl3D = False
      TabOrder = 3
      object Label4: TLabel
        Left = 0
        Top = -2
        Width = 80
        Height = 15
        Caption = 'Tipo de Servi'#231'o'
      end
      object edtDescricaoTpServico: TEdit
        Left = 53
        Top = 13
        Width = 209
        Height = 23
        TabOrder = 0
      end
      object EdtCodTipoServico: TEdit
        Left = 0
        Top = 13
        Width = 51
        Height = 23
        TabOrder = 1
      end
      object btnTipoPesquisa: TcxButton
        Left = 263
        Top = 13
        Width = 25
        Height = 23
        Cursor = crHandPoint
        LookAndFeel.NativeStyle = False
        LookAndFeel.SkinName = 'Black'
        OptionsImage.Glyph.SourceDPI = 96
        OptionsImage.Glyph.Data = {
          424D360400000000000036000000280000001000000010000000010020000000
          000000000000C40E0000C40E0000000000000000000000000000000000000000
          000000000000281B022B8559078EC78708D3E89D09F3E99F08F3CB8A06D48C5E
          04952C1E012C0000000000000000000000000000000000000000000000000504
          000686590993E79A0EFCEC9E0DFFEEA00CFFF1A30AFFEFA10AFFE39309FFE797
          08FFEC9D07FC906304950503000500000000000000000000000005030006A76E
          0DBCE59710FFE89A0FFFEA9C0EFFEC9E0DFFE89A0CFFD8870BFFDC8A0AFFE190
          09FFE79708FFEF9F07FFB87E05BE05030005000000000000000081540B94E193
          12FFE39511FFE59710FFE89A0FFFE4950EFFCE7B0EFFD07D0CFFD6840BFFDC8A
          0AFFEEC176FFEEB44EFFEF9F07FF90630495000000002618042CDA8D15FCDF91
          13FFE19312FFE39511FFDE900FFFC77616FFC77514FFCB780DFFD07D0CFFE9BC
          7AFFFEFBF6FFE9AE4BFFE79708FFEC9D07FC2C1E012C7A4E0D90DA8C16FFDD8F
          15FFDF9113FFD9942AFFDDC5ACFFFEFCFAFFFFFFFFFFF3E1CCFFE8C496FFFDFA
          F6FFE1A54CFFDC8A0AFFE19009FFE79708FF8C5D0494B37214D5D88A17FFDA8C
          16FFDC9423FFD3CBC2FFCDB7A4FFC78747FFC9853EFFE5C199FFFFFEFEFFE1B0
          72FFD07D0CFFD6840BFFDC8A0AFFE69509FFCB8C06D3C97F18F2D68818FFD88A
          17FFDAB987FFD0C1B4FFB05A10FFB35D0EFFB7620FFFBC660EFFE7C7A3FFEFD8
          BDFFCB780DFFD07D0CFFDD8C0AFFF1A309FFE89E08F1C87E19F3D48619FFD688
          18FFD8C8B0FFC39B7BFFAB530FFFB0590EFFB35D0EFFB7620FFFCF9254FFFAF3
          ECFFC5710DFFD3810EFFEC9E0CFFF1A30AFFE79D09F2AD6C17D5D2841AFFD486
          19FFD9C6ADFFC7A78DFFA8500EFFAB530FFFB0590EFFB35D0EFFD09B66FFF7ED
          E3FFCA770EFFE89A0EFFEC9E0DFFEEA00CFFC78708D375481091CF811BFFD284
          1AFFD8AB6BFFD2CFCBFFB16B3BFFA8500EFFAB530FFFB3631FFFD0C5BAFFD8B3
          89FFE49510FFE89A0FFFEA9C0EFFEC9E0DFF8559078E2416052DCB7E1CFDCF81
          1BFFD2841BFFD7BD98FFD3D0CEFFCBB19CFFC9AB93FFD2CBC6FFD0BEABFFDE93
          19FFE39511FFE59710FFE89A0FFFE79A0EFC281B022B00000000794B1197CD7F
          1CFFCF811BFFD2841AFFD9A661FFD9C19EFFD8BF9AFFDAAC68FFDC8F17FFDF91
          13FFE19312FFE39511FFE59710FF86590993000000000000000006030107985E
          16BECD7F1CFFCF811BFFD2841AFFD48619FFD68818FFD88A17FFDA8C16FFDD8F
          15FFDF9113FFE19312FFA86E0DBD050400060000000000000000000000000603
          0107784A1196CB7E1CFDCF811BFFD2841AFFD48619FFD68818FFD88A17FFDA8C
          16FFDA8D15FC81540B9405030006000000000000000000000000000000000000
          0000000000002416052D75481091AC6B16D4C97E19F4CB8018F4B27114D47A4E
          0D902618042C00000000000000000000000000000000}
        OptionsImage.ImageIndex = 4
        TabOrder = 2
        TabStop = False
      end
    end
    object edtVlrVenda: TcxCurrencyEdit
      Left = 7
      Top = 64
      TabOrder = 4
      Width = 74
    end
  end
end
