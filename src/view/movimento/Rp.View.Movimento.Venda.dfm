inherited FrmMovimentoVenda: TFrmMovimentoVenda
  Caption = 'Venda'
  ClientHeight = 558
  ClientWidth = 1299
  Font.Height = -11
  ExplicitWidth = 1311
  ExplicitHeight = 596
  TextHeight = 13
  inherited pnlBackground: TPanel
    Width = 1299
    Height = 523
    ExplicitWidth = 1295
    ExplicitHeight = 522
    object pnlTop: TPanel
      Left = 0
      Top = 0
      Width = 1299
      Height = 37
      Align = alTop
      BevelOuter = bvNone
      ParentBackground = False
      ParentColor = True
      TabOrder = 0
      ExplicitWidth = 1295
      object Label3: TLabel
        Left = 7
        Top = 0
        Width = 38
        Height = 13
        Caption = 'C'#243'digo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label1: TLabel
        Left = 79
        Top = 0
        Width = 41
        Height = 13
        Caption = 'Emiss'#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object EdtCodigo: TEdit
        Left = 7
        Top = 13
        Width = 66
        Height = 21
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
      object DtpEmissao: TDateTimePicker
        Left = 79
        Top = 13
        Width = 83
        Height = 21
        Date = 45466.000000000000000000
        Time = 0.560432719910750200
        Checked = False
        Color = clBtnFace
        Enabled = False
        ParentShowHint = False
        ShowHint = False
        TabOrder = 1
        TabStop = False
      end
    end
    object pnlCliente: TPanel
      Left = 0
      Top = 37
      Width = 1299
      Height = 37
      Align = alTop
      BevelOuter = bvNone
      ParentBackground = False
      ParentColor = True
      TabOrder = 1
      ExplicitWidth = 1295
      object Label2: TLabel
        Left = 7
        Top = 1
        Width = 36
        Height = 13
        Caption = 'Cliente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label4: TLabel
        Left = 368
        Top = 1
        Width = 46
        Height = 13
        Caption = 'Cpf/Cnpj'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label5: TLabel
        Left = 470
        Top = 1
        Width = 44
        Height = 13
        Caption = 'Telefone'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object edtIdCliente: TEdit
        Left = 7
        Top = 14
        Width = 66
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
      object edtNomeCliente: TEdit
        Left = 74
        Top = 14
        Width = 287
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
      end
      object edtDocCliente: TEdit
        Left = 368
        Top = 14
        Width = 96
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
      end
      object edtFoneCliente: TEdit
        Left = 470
        Top = 14
        Width = 89
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 3
      end
      object Panel6: TPanel
        Left = 560
        Top = 14
        Width = 24
        Height = 21
        BevelOuter = bvSpace
        TabOrder = 4
        object btnSeachCliente: TSpeedButton
          Left = 1
          Top = 1
          Width = 22
          Height = 19
          Cursor = crHandPoint
          Align = alClient
          Flat = True
          Glyph.Data = {
            76060000424D7606000000000000360400002800000018000000180000000100
            08000000000040020000120B0000120B00000001000000000000BE641400FAF2
            EC00D9A57700EACDB300C77A3500E1B89400F5E6D900D08F5500C0681A00EFDA
            C700C36F2500FFFFFF00D3966000CD874900E4C09F00DCAB7F00EED6C100D7A0
            6F00F7ECE200C5742D00E6C3A500DDAF8500FCF7F300CA824100DBAA7E00C16A
            1D00BF651600E3BD9B00CE8A4D00E7C6A800F1DFCE00F6E9DE00D1925A00C572
            2A00FDFBF900C97E3C00DEB08700F9F0E900C6773100C16C2000EBCFB500D193
            5800F0DCCA00DCAC8100E4BF9E00FFFFFF00C0691C00D8A37300E8C8AC00CF8C
            5000DAA67800BF641600F5E7DA00DEB18900E3BB9700FCF8F500D2945D00C36E
            2200F7E9DF00C3712700BF661800F9EDE500DDAD8300C7783200EBD0B700E5C1
            A100EED7C300C16A1C00F1DFCF00F5E7D900DFB1870000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            00000000000000000000000000000000000000000000000000000B0B0B0B0B0B
            0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B
            0B0B0B0B0B0B1F0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B151910
            0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B2B0000191F0B0B0B0B0B0B0B
            0B0B0B0B0B0B0B0B0B0B0B15000000180B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B
            0B0B15000000180B0B0B0B0B0B0B0B0B2240022007111D370B2B0000003E0B0B
            0B0B0B0B0B0B0B03260000000000000A380000003E0B0B0B0B0B0B0B0B0B2400
            0031142A1E300C00000000150B0B0B0B0B0B0B0B0B0E0027030B0B0B0B0B0B2A
            13001C0B0B0B0B0B0B0B0B0B25273C420B0B0B0B0B0B0B0B34391A1E0B0B0B0B
            0B0B0B0B1500320B0B0B0B0B0B0B0B0B0B1B000C0B0B0B0B0B0B0B0B2300060B
            0B0B0B0B0B0B0B0B0B372E19220B0B0B0B0B0B0B3C0A0B0B0B0B0B0B0B0B0B0B
            0B0B0D00340B0B0B0B0B0B16003F0B0B0B0B0B0B0B0B0B0B0B0B20001E0B0B0B
            0B0B0B0B2E270B0B0B0B0B0B0B0B0B0B0B0B1700120B0B0B0B0B0B0B0D002A0B
            0B0B0B0B0B0B0B0B0B013C3B0B0B0B0B0B0B0B0B36000C0B0B0B0B0B0B0B0B0B
            0B2B002F0B0B0B0B0B0B0B0B372100410B0B0B0B0B0B0B0B103C08120B0B0B0B
            0B0B0B0B0B103C1A35220B0B0B0B0B0E2E00410B0B0B0B0B0B0B0B0B0B0B0319
            0021021B410F04003C050B0B0B0B0B0B0B0B0B0B0B0B0B06200000000000000D
            090B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B3D1435152C340B0B0B0B0B0B0B0B0B
            0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B}
          OnClick = btnSeachClienteClick
          ExplicitTop = 0
        end
      end
    end
    object pnlServico: TPanel
      Left = 0
      Top = 74
      Width = 1299
      Height = 47
      Align = alTop
      BevelOuter = bvNone
      ParentBackground = False
      ParentColor = True
      TabOrder = 2
      ExplicitWidth = 1295
      object Label6: TLabel
        Left = 7
        Top = 0
        Width = 36
        Height = 13
        Caption = 'Servico'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label7: TLabel
        Left = 470
        Top = 0
        Width = 71
        Height = 13
        Caption = 'Valor Unit'#225'rio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label8: TLabel
        Left = 551
        Top = 0
        Width = 61
        Height = 13
        Caption = 'Quantidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label9: TLabel
        Left = 778
        Top = 0
        Width = 54
        Height = 13
        Caption = 'Valor Total'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label10: TLabel
        Left = 619
        Top = 0
        Width = 53
        Height = 13
        Caption = 'Valor Desc'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label11: TLabel
        Left = 699
        Top = 0
        Width = 61
        Height = 13
        Caption = 'Valor Acresc'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label12: TLabel
        Left = 290
        Top = 0
        Width = 78
        Height = 13
        Caption = 'Tipo de Servico'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object edtIdServico: TEdit
        Left = 7
        Top = 13
        Width = 66
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
      object edtDescrServico: TEdit
        Left = 74
        Top = 13
        Width = 185
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
      end
      object edtVlrUnitarioServico: TcxCurrencyEdit
        Left = 470
        Top = 13
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Segoe UI'
        Style.Font.Style = []
        Style.IsFontAssigned = True
        TabOrder = 2
        OnExit = edtVlrUnitarioServicoExit
        Width = 73
      end
      object edtVlrTotalServico: TcxCurrencyEdit
        Left = 778
        Top = 13
        Enabled = False
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Segoe UI'
        Style.Font.Style = []
        Style.IsFontAssigned = True
        TabOrder = 3
        Width = 73
      end
      object edtVlrDescServico: TcxCurrencyEdit
        Left = 619
        Top = 13
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Segoe UI'
        Style.Font.Style = []
        Style.IsFontAssigned = True
        TabOrder = 4
        OnExit = edtVlrDescServicoExit
        Width = 73
      end
      object edtVlrAcrescServico: TcxCurrencyEdit
        Left = 699
        Top = 13
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Segoe UI'
        Style.Font.Style = []
        Style.IsFontAssigned = True
        TabOrder = 5
        OnExit = edtVlrAcrescServicoExit
        Width = 73
      end
      object edtIdTpServico: TEdit
        Left = 290
        Top = 13
        Width = 40
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 6
      end
      object edtDescrTpServico: TEdit
        Left = 331
        Top = 13
        Width = 133
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 7
      end
      object pnlExcluirServico: TPanel
        Left = 859
        Top = 7
        Width = 85
        Height = 27
        BevelOuter = bvSpace
        TabOrder = 8
        object btnExcluirServico: TSpeedButton
          Left = 1
          Top = 1
          Width = 83
          Height = 25
          Cursor = crHandPoint
          Align = alClient
          Caption = 'Excluir   '
          Flat = True
          Glyph.Data = {
            76060000424D7606000000000000360400002800000018000000180000000100
            08000000000040020000120B0000120B00000001000000000000BE641400FFFF
            FF00DCAC8200C5762F00EDD3BD00DEB189000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000010101010101
            0101010101010101010101010101010101010101010101010101010101010101
            0101010101010101010101010101010403000000000000000000000304010101
            0101010101010103000000000000000000000000030101010101010101010100
            0000000000000000000000000001010101010101010101000000000000000000
            0000000000010101010101010101010000000000000000000000000000010101
            0101010101010100000000000000000000000000000101010101010101010100
            0000000000000000000000000001010101010101010101000000000000000000
            0000000000010101010101010101010000000000000000000000000000010101
            0101010101010100000000000000000000000000000101010101010101010100
            0000000000000000000000000001010101010101010101000000000000000000
            0000000000010101010101010101010000000000000000000000000000010101
            0101010101010100000000000000000000000000000101010101010101010100
            0000000000000000000000000001010101010101010101010101010101010101
            0101010101010101010101010101010101010101010101010101010101010101
            0101010101010000000000000000000000000000000001010101010101010000
            0000000000000000000000000000010101010101010101010101010500000000
            0201010101010101010101010101010101010101010101010101010101010101
            0101010101010101010101010101010101010101010101010101}
          OnClick = btnExcluirServicoClick
          ExplicitLeft = 0
          ExplicitWidth = 78
        end
      end
      object pnlCancelarServico: TPanel
        Left = 947
        Top = 7
        Width = 85
        Height = 27
        BevelOuter = bvSpace
        TabOrder = 9
        object edtCancelarServico: TSpeedButton
          Left = 1
          Top = 1
          Width = 83
          Height = 25
          Cursor = crHandPoint
          Align = alClient
          Caption = 'Cancelar   '
          Flat = True
          Glyph.Data = {
            76060000424D7606000000000000360400002800000018000000180000000100
            08000000000040020000120B0000120B00000001000000000000BE641400F4E4
            D600D4996500EACDB300FEFDFC00C16B1E00E9CAAF00FDFBF900C7793400DBAA
            7E00C4732A00EED7C200C3712700C6783200C87C3800F5E7DA00FFFFFF00C97F
            3D00D59A6600C97A3600EBCFB500DDAB7E00C26D2100D59B6800EFD9C500E9CB
            B100C77A3500DCAB8000FFFFFF00D59D68000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000101010101010
            1010101010101010101010101010101010101010101010101010101010101010
            10101010101010101010101010101010100719170E05050E1703071010101010
            1010101010101010030800000000000000001A0310101010101010101010041B
            0000000000000000000000001B04101010101010101009000000000000000000
            00000000001B1010101010101003000000000000000000000000000000000310
            101010100708000000110B0C000000000C0B110000001A071010101006000000
            000B10010C00000C01100B00000000191010101012000000000C01100F0A0C01
            100F0A0000000017101010100E00000000000C0110010110010C00000000000E
            10101010050000000000000C0110100F0A000000000000161010101005000000
            0000000C0110100F0A00000000000005101010100E00000000000C0110010110
            010C00000000000E1010101002000000000C01100F0A0C01100F0A0000000017
            1010101006000000000B10010C00000C01100B00000000191010101007080000
            000E180A000000000C0B110000000D0710101010100300000000000000000000
            00000000000003101010101010100900000000000000000000000000001B1010
            10101010101004090000000000000000000000001B0410101010101010101010
            030800000000000000000803101010101010101010101010100706020E05050E
            1206071010101010101010101010101010101010101010101010101010101010
            1010101010101010101010101010101010101010101010101010}
          OnClick = edtCancelarServicoClick
          ExplicitLeft = 693
          ExplicitTop = 0
          ExplicitWidth = 110
          ExplicitHeight = 30
        end
      end
      object pnlIncluirServico: TPanel
        Left = 1035
        Top = 7
        Width = 85
        Height = 27
        BevelOuter = bvSpace
        TabOrder = 10
        object btnIncluir: TSpeedButton
          Left = 1
          Top = 1
          Width = 83
          Height = 25
          Cursor = crHandPoint
          Align = alClient
          Caption = 'Incluir   '
          Flat = True
          Glyph.Data = {
            76060000424D7606000000000000360400002800000018000000180000000100
            08000000000040020000120B0000120B00000001000000000000BE641400FDFB
            F900D4996500E9CBB000C16B1E00C6783200DBAA7E00FFFFFF00C87B3700EACD
            B300EBCEB500FEFDFC00DCAB8000D59B6800C77A3500C26D2100C87C3800D59A
            6600DDAD8100E9CBB100C7783400DDAB7E00EBCFB700FFFFFF00D59D6800C77A
            3600DDAD83000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000070707070707
            0707070707070707070707070707070707070707070707070707070707070707
            070707070707070707070707070707070701130D100404100D09010707070707
            07070707070707070A0E00000000000000000E16070707070707070707070B0C
            0000000000000000000000000C0B07070707070707070C000000000000000000
            0000000000120707070707070709000000000000000000000000000000001607
            07070707010E0000000000000007070000000000000014010707070703000000
            0000000000070700000000000000000907070707110000000000000000070700
            000000000000000D070707070800000000000000000707000000000000000010
            07070707040000000007070707070707070707000000000F0707070704000000
            0007070707070707070707000000000407070707190000000000000000070700
            000000000000001007070707020000000000000000070700000000000000000D
            0707070703000000000000000007070000000000000000130707070701140000
            0000000000070700000000000000050107070707070900000000000000000000
            0000000000000A070707070707070600000000000000000000000000000C0707
            0707070707070B060000000000000000000000000C0B07070707070707070707
            0914000000000000000014090707070707070707070707070701031110040410
            1103010707070707070707070707070707070707070707070707070707070707
            0707070707070707070707070707070707070707070707070707}
          OnClick = btnIncluirClick
          ExplicitLeft = -20
          ExplicitWidth = 105
        end
      end
      object Panel5: TPanel
        Left = 260
        Top = 13
        Width = 24
        Height = 21
        BevelOuter = bvSpace
        TabOrder = 11
        object btnSeachServico: TSpeedButton
          Left = 1
          Top = 1
          Width = 22
          Height = 19
          Cursor = crHandPoint
          Align = alClient
          Flat = True
          Glyph.Data = {
            76060000424D7606000000000000360400002800000018000000180000000100
            08000000000040020000120B0000120B00000001000000000000BE641400FAF2
            EC00D9A57700EACDB300C77A3500E1B89400F5E6D900D08F5500C0681A00EFDA
            C700C36F2500FFFFFF00D3966000CD874900E4C09F00DCAB7F00EED6C100D7A0
            6F00F7ECE200C5742D00E6C3A500DDAF8500FCF7F300CA824100DBAA7E00C16A
            1D00BF651600E3BD9B00CE8A4D00E7C6A800F1DFCE00F6E9DE00D1925A00C572
            2A00FDFBF900C97E3C00DEB08700F9F0E900C6773100C16C2000EBCFB500D193
            5800F0DCCA00DCAC8100E4BF9E00FFFFFF00C0691C00D8A37300E8C8AC00CF8C
            5000DAA67800BF641600F5E7DA00DEB18900E3BB9700FCF8F500D2945D00C36E
            2200F7E9DF00C3712700BF661800F9EDE500DDAD8300C7783200EBD0B700E5C1
            A100EED7C300C16A1C00F1DFCF00F5E7D900DFB1870000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            00000000000000000000000000000000000000000000000000000B0B0B0B0B0B
            0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B
            0B0B0B0B0B0B1F0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B151910
            0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B2B0000191F0B0B0B0B0B0B0B
            0B0B0B0B0B0B0B0B0B0B0B15000000180B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B
            0B0B15000000180B0B0B0B0B0B0B0B0B2240022007111D370B2B0000003E0B0B
            0B0B0B0B0B0B0B03260000000000000A380000003E0B0B0B0B0B0B0B0B0B2400
            0031142A1E300C00000000150B0B0B0B0B0B0B0B0B0E0027030B0B0B0B0B0B2A
            13001C0B0B0B0B0B0B0B0B0B25273C420B0B0B0B0B0B0B0B34391A1E0B0B0B0B
            0B0B0B0B1500320B0B0B0B0B0B0B0B0B0B1B000C0B0B0B0B0B0B0B0B2300060B
            0B0B0B0B0B0B0B0B0B372E19220B0B0B0B0B0B0B3C0A0B0B0B0B0B0B0B0B0B0B
            0B0B0D00340B0B0B0B0B0B16003F0B0B0B0B0B0B0B0B0B0B0B0B20001E0B0B0B
            0B0B0B0B2E270B0B0B0B0B0B0B0B0B0B0B0B1700120B0B0B0B0B0B0B0D002A0B
            0B0B0B0B0B0B0B0B0B013C3B0B0B0B0B0B0B0B0B36000C0B0B0B0B0B0B0B0B0B
            0B2B002F0B0B0B0B0B0B0B0B372100410B0B0B0B0B0B0B0B103C08120B0B0B0B
            0B0B0B0B0B103C1A35220B0B0B0B0B0E2E00410B0B0B0B0B0B0B0B0B0B0B0319
            0021021B410F04003C050B0B0B0B0B0B0B0B0B0B0B0B0B06200000000000000D
            090B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B3D1435152C340B0B0B0B0B0B0B0B0B
            0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B}
          OnClick = btnSeachServicoClick
          ExplicitLeft = 3
          ExplicitTop = 9
        end
      end
      object edtQtdeServico: TEdit
        Left = 551
        Top = 13
        Width = 63
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 12
      end
    end
    object pnlItensServico: TPanel
      Left = 0
      Top = 121
      Width = 1299
      Height = 402
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 3
      ExplicitWidth = 1295
      ExplicitHeight = 401
      object GridPesquisa: TcxGrid
        Left = 0
        Top = 0
        Width = 1299
        Height = 356
        Align = alClient
        TabOrder = 0
        ExplicitTop = -5
        object GridPesquisaDBTableView: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          ScrollbarAnnotations.CustomAnnotations = <>
          DataController.DataSource = DSServico
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsView.GroupByBox = False
          object GridCodServico: TcxGridDBColumn
            Caption = 'Codigo'
            DataBinding.FieldName = 'id_servico'
            DataBinding.IsNullValueType = True
            Width = 76
          end
          object GridDescServico: TcxGridDBColumn
            Caption = 'Servi'#231'o'
            DataBinding.FieldName = 'descrservico'
            DataBinding.IsNullValueType = True
            Width = 208
          end
          object GridVlrUnitario: TcxGridDBColumn
            Caption = 'Valor Unit.'
            DataBinding.FieldName = 'vlr_unitario'
            DataBinding.IsNullValueType = True
            Width = 68
          end
          object GridQtde: TcxGridDBColumn
            Caption = 'Qtde'
            DataBinding.FieldName = 'qtd_servico'
            DataBinding.IsNullValueType = True
          end
          object GridVlrDesconto: TcxGridDBColumn
            Caption = 'Valor Desc'
            DataBinding.FieldName = 'vlr_desc'
            DataBinding.IsNullValueType = True
            Width = 72
          end
          object GridVlrAcrescimo: TcxGridDBColumn
            Caption = 'Valor Acr'
            DataBinding.FieldName = 'vlr_acres'
            DataBinding.IsNullValueType = True
            Width = 67
          end
          object GridVlrTotal: TcxGridDBColumn
            Caption = 'Valor Total'
            DataBinding.Expression = #1's'
            DataBinding.FieldName = 'vlr_total'
            DataBinding.IsNullValueType = True
            Width = 92
          end
        end
        object GridPesquisaLevel: TcxGridLevel
          GridView = GridPesquisaDBTableView
        end
      end
      object Panel1: TPanel
        Left = 0
        Top = 356
        Width = 1299
        Height = 46
        Align = alBottom
        BevelOuter = bvNone
        Color = 16578803
        ParentBackground = False
        TabOrder = 1
        ExplicitTop = 355
        ExplicitWidth = 1295
        object pnlTotais: TPanel
          Left = 0
          Top = 0
          Width = 475
          Height = 46
          Align = alLeft
          BevelOuter = bvNone
          TabOrder = 0
          object Label13: TLabel
            Left = 401
            Top = 1
            Width = 54
            Height = 13
            Caption = 'Valor Total'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object Label14: TLabel
            Left = 323
            Top = 1
            Width = 56
            Height = 13
            Caption = 'Valor Acres'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object Label15: TLabel
            Left = 243
            Top = 1
            Width = 53
            Height = 13
            Caption = 'Valor Desc'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object Label18: TLabel
            Left = 164
            Top = 1
            Width = 55
            Height = 13
            Caption = 'Valor Frete'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object Label16: TLabel
            Left = 85
            Top = 1
            Width = 45
            Height = 13
            Caption = 'SubTotal'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object Label17: TLabel
            Left = 6
            Top = 1
            Width = 53
            Height = 13
            Caption = 'Qtde Itens'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object edtVlrTotal: TcxCurrencyEdit
            Left = 401
            Top = 14
            Enabled = False
            ParentFont = False
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -11
            Style.Font.Name = 'Segoe UI'
            Style.Font.Style = []
            Style.IsFontAssigned = True
            TabOrder = 0
            Width = 72
          end
          object edtVlrAcres: TcxCurrencyEdit
            Left = 323
            Top = 14
            ParentFont = False
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -11
            Style.Font.Name = 'Segoe UI'
            Style.Font.Style = []
            Style.IsFontAssigned = True
            TabOrder = 1
            OnExit = edtVlrAcresExit
            Width = 72
          end
          object edtVlrDesc: TcxCurrencyEdit
            Left = 243
            Top = 14
            ParentFont = False
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -11
            Style.Font.Name = 'Segoe UI'
            Style.Font.Style = []
            Style.IsFontAssigned = True
            TabOrder = 2
            OnExit = edtVlrDescExit
            Width = 72
          end
          object edtVlrFrete: TcxCurrencyEdit
            Left = 164
            Top = 14
            ParentFont = False
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -11
            Style.Font.Name = 'Segoe UI'
            Style.Font.Style = []
            Style.IsFontAssigned = True
            TabOrder = 3
            OnExit = edtVlrFreteExit
            Width = 72
          end
          object edtVlrSubTotal: TcxCurrencyEdit
            Left = 85
            Top = 14
            Enabled = False
            ParentFont = False
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -11
            Style.Font.Name = 'Segoe UI'
            Style.Font.Style = []
            Style.IsFontAssigned = True
            TabOrder = 4
            Width = 72
          end
          object edtQtdeItens: TEdit
            Left = 6
            Top = 14
            Width = 73
            Height = 21
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 5
          end
        end
      end
    end
  end
  inherited pnlBottom: TPanel
    Top = 523
    Width = 1299
    ExplicitTop = 522
    ExplicitWidth = 1295
    inherited btnConfirm: TSpeedButton
      Left = 1167
      ExplicitLeft = 1173
      ExplicitHeight = 35
    end
    inherited btnCancel: TSpeedButton
      Left = 1035
      ExplicitLeft = 1035
    end
  end
  object DSServico: TDataSource
    Left = 448
    Top = 288
  end
end
