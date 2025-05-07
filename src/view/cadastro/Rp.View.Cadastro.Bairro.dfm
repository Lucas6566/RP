inherited FrmCadastroBairro: TFrmCadastroBairro
  Caption = 'Bairro'
  ClientHeight = 161
  ClientWidth = 475
  ExplicitWidth = 487
  ExplicitHeight = 199
  TextHeight = 15
  inherited pnlBackground: TPanel
    Width = 475
    Height = 161
    ExplicitWidth = 471
    ExplicitHeight = 160
    object Label1: TLabel [0]
      Left = 16
      Top = 16
      Width = 39
      Height = 15
      Caption = 'C'#243'digo'
    end
    object Label2: TLabel [1]
      Left = 96
      Top = 16
      Width = 31
      Height = 15
      Caption = 'Bairro'
    end
    object Label3: TLabel [2]
      Left = 316
      Top = 16
      Width = 82
      Height = 15
      Caption = 'Taxa de Entrega'
    end
    object Label5: TLabel [3]
      Left = 16
      Top = 62
      Width = 39
      Height = 15
      Caption = 'C'#243'digo'
    end
    object Label4: TLabel [4]
      Left = 96
      Top = 62
      Width = 37
      Height = 15
      Caption = 'Cidade'
    end
    inherited pnlBottom: TPanel
      Top = 126
      Width = 475
      ExplicitTop = 125
      ExplicitWidth = 471
      inherited btnConfirm: TSpeedButton
        Left = 343
        ExplicitLeft = 347
      end
      inherited btnCancel: TSpeedButton
        Left = 211
        ExplicitLeft = 215
      end
    end
    object edtCodigo: TEdit
      Left = 16
      Top = 32
      Width = 73
      Height = 23
      BevelInner = bvNone
      BevelOuter = bvNone
      Enabled = False
      TabOrder = 1
    end
    object edtNome: TEdit
      Left = 96
      Top = 32
      Width = 214
      Height = 23
      BevelInner = bvNone
      BevelOuter = bvNone
      TabOrder = 2
    end
    object edtTaxaEntrega: TcxCurrencyEdit
      Left = 316
      Top = 32
      TabOrder = 3
      Width = 121
    end
    object edtCidade: TEdit
      Left = 96
      Top = 80
      Width = 214
      Height = 23
      BevelInner = bvNone
      BevelOuter = bvNone
      TabOrder = 4
    end
    object edtCodigoCidade: TEdit
      Left = 16
      Top = 80
      Width = 73
      Height = 23
      BevelInner = bvNone
      BevelOuter = bvNone
      TabOrder = 5
    end
  end
end
