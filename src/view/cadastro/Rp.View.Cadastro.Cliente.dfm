inherited FrmCadastroCliente: TFrmCadastroCliente
  Caption = 'Cliente'
  ClientHeight = 266
  ClientWidth = 504
  ExplicitWidth = 516
  ExplicitHeight = 304
  TextHeight = 15
  inherited pnlBackground: TPanel
    Width = 504
    Height = 266
    ExplicitWidth = 500
    ExplicitHeight = 265
    inherited pnlBottom: TPanel
      Top = 231
      Width = 504
      ExplicitTop = 230
      ExplicitWidth = 500
      inherited btnConfirm: TSpeedButton
        Left = 394
        ExplicitLeft = 347
      end
      inherited btnCancel: TSpeedButton
        Left = 284
        ExplicitLeft = 215
      end
    end
    object PnlCadastro: TPanel
      Left = 0
      Top = 0
      Width = 504
      Height = 231
      Align = alClient
      TabOrder = 1
      ExplicitWidth = 500
      ExplicitHeight = 230
      object Label1: TLabel
        Left = 7
        Top = 9
        Width = 39
        Height = 15
        Caption = 'C'#243'digo'
      end
      object Label2: TLabel
        Left = 95
        Top = 9
        Width = 33
        Height = 15
        Caption = 'Nome'
      end
      object Label12: TLabel
        Left = 392
        Top = 50
        Width = 44
        Height = 15
        Caption = 'Telefone'
      end
      object Label3: TLabel
        Left = 114
        Top = 49
        Width = 29
        Height = 15
        Caption = 'Email'
      end
      object LblCpfCnpj: TLabel
        Left = 7
        Top = 50
        Width = 53
        Height = 15
        Caption = 'CPF/CNPJ'
      end
      object LblTipoPessoa: TLabel
        Left = 421
        Top = 9
        Width = 30
        Height = 15
        Caption = 'Fisico'
      end
      object Label15: TLabel
        Left = 114
        Top = 93
        Width = 49
        Height = 15
        Caption = 'Endere'#231'o'
      end
      object Label16: TLabel
        Left = 7
        Top = 179
        Width = 37
        Height = 15
        Caption = 'Cidade'
      end
      object Label4: TLabel
        Left = 141
        Top = 179
        Width = 14
        Height = 15
        Caption = 'UF'
      end
      object Label6: TLabel
        Left = 7
        Top = 93
        Width = 21
        Height = 15
        Caption = 'CEP'
      end
      object Label7: TLabel
        Left = 200
        Top = 135
        Width = 77
        Height = 15
        Caption = 'Complemento'
      end
      object Label8: TLabel
        Left = 7
        Top = 135
        Width = 31
        Height = 15
        Caption = 'Bairro'
      end
      object EdtCodigo: TEdit
        Left = 7
        Top = 24
        Width = 82
        Height = 23
        Enabled = False
        TabOrder = 0
      end
      object EdtNome: TEdit
        Left = 95
        Top = 24
        Width = 321
        Height = 23
        ImeName = 'Portuguese (Brazilian ABNT)'
        TabOrder = 1
      end
      object edtTelefone: TEdit
        Left = 392
        Top = 65
        Width = 103
        Height = 23
        TabOrder = 2
      end
      object edtEmail: TEdit
        Left = 114
        Top = 65
        Width = 274
        Height = 23
        TabOrder = 3
      end
      object EdtDocumento: TEdit
        Left = 7
        Top = 65
        Width = 101
        Height = 23
        TabOrder = 4
      end
      object TgSTipoPessoa: TdxToggleSwitch
        Left = 421
        Top = 24
        Checked = True
        Properties.DisplayChecked = '1'
        Properties.DisplayUnchecked = '2'
        Properties.DisplayGrayed = '2'
        Properties.ValueChecked = 1
        Properties.ValueGrayed = 3
        Properties.ValueUnchecked = 2
        Style.TransparentBorder = False
        TabOrder = 5
        OnClick = TgSTipoPessoaClick
      end
      object EdtBairro: TEdit
        Left = 43
        Top = 150
        Width = 124
        Height = 23
        TabOrder = 6
      end
      object EdtCep: TEdit
        Left = 7
        Top = 108
        Width = 101
        Height = 23
        TabOrder = 7
      end
      object EdtCidade: TEdit
        Left = 7
        Top = 194
        Width = 131
        Height = 23
        TabOrder = 8
      end
      object EdtComplemento: TEdit
        Left = 200
        Top = 151
        Width = 295
        Height = 23
        TabOrder = 9
      end
      object edtEndereco: TEdit
        Left = 114
        Top = 108
        Width = 381
        Height = 23
        TabOrder = 10
      end
      object EdtUf: TEdit
        Left = 141
        Top = 194
        Width = 26
        Height = 23
        TabOrder = 11
      end
      object edtCodigoBairro: TEdit
        Left = 7
        Top = 150
        Width = 35
        Height = 23
        TabOrder = 12
      end
      object pnlSeachCidade: TPanel
        Left = 168
        Top = 150
        Width = 25
        Height = 23
        BevelOuter = bvSpace
        TabOrder = 13
        object btnSeachCidade: TSpeedButton
          Left = 1
          Top = 1
          Width = 23
          Height = 21
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
          OnClick = btnSeachCidadeClick
          ExplicitLeft = 3
        end
      end
    end
  end
end
