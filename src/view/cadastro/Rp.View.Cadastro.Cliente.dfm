inherited FrmCadastroCliente: TFrmCadastroCliente
  Caption = 'FrmCadastroCliente'
  ClientHeight = 224
  ClientWidth = 504
  ExplicitWidth = 516
  ExplicitHeight = 262
  TextHeight = 15
  inherited pnlBackground: TPanel
    Width = 504
    Height = 224
    ExplicitWidth = 467
    ExplicitHeight = 159
    inherited pnlBottom: TPanel
      Top = 189
      Width = 504
      ExplicitTop = 124
      ExplicitWidth = 467
      inherited btnConfirm: TSpeedButton
        Left = 372
        ExplicitLeft = 347
      end
      inherited btnCancel: TSpeedButton
        Left = 240
        ExplicitLeft = 215
      end
    end
    object PnlCadastro: TPanel
      Left = 0
      Top = 0
      Width = 504
      Height = 185
      Align = alTop
      TabOrder = 1
      object Label1: TLabel
        Left = 7
        Top = 9
        Width = 39
        Height = 15
        Caption = 'C'#243'digo'
      end
      object Label2: TLabel
        Left = 130
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
        Left = 7
        Top = 133
        Width = 49
        Height = 15
        Caption = 'Endere'#231'o'
      end
      object Label16: TLabel
        Left = 281
        Top = 93
        Width = 37
        Height = 15
        Caption = 'Cidade'
      end
      object Label4: TLabel
        Left = 411
        Top = 93
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
        Left = 232
        Top = 133
        Width = 77
        Height = 15
        Caption = 'Complemento'
      end
      object Label8: TLabel
        Left = 114
        Top = 93
        Width = 31
        Height = 15
        Caption = 'Bairro'
      end
      object EdtCodigo: TEdit
        Left = 7
        Top = 24
        Width = 117
        Height = 23
        TabOrder = 0
      end
      object EdtNome: TEdit
        Left = 130
        Top = 24
        Width = 288
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
        Left = 150
        Top = 108
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
        Left = 281
        Top = 108
        Width = 124
        Height = 23
        TabOrder = 8
      end
      object EdtComplemento: TEdit
        Left = 232
        Top = 148
        Width = 263
        Height = 23
        TabOrder = 9
      end
      object edtEndereco: TEdit
        Left = 7
        Top = 148
        Width = 219
        Height = 23
        TabOrder = 10
      end
      object EdtUf: TEdit
        Left = 411
        Top = 108
        Width = 26
        Height = 23
        TabOrder = 11
      end
      object edtCodigoBairro: TEdit
        Left = 114
        Top = 108
        Width = 35
        Height = 23
        TabOrder = 12
      end
    end
  end
end
