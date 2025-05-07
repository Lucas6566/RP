inherited FrmCadastroFormaPagamento: TFrmCadastroFormaPagamento
  Caption = 'Forma de Pagamento'
  ClientHeight = 109
  ClientWidth = 322
  ExplicitWidth = 334
  ExplicitHeight = 147
  TextHeight = 15
  inherited pnlBackground: TPanel
    Width = 322
    Height = 109
    ExplicitWidth = 467
    ExplicitHeight = 159
    object Label1: TLabel [0]
      Left = 16
      Top = 16
      Width = 39
      Height = 15
      Caption = 'C'#243'digo'
    end
    object Label2: TLabel [1]
      Left = 92
      Top = 16
      Width = 114
      Height = 15
      Caption = 'Forma de Pagamento'
    end
    inherited pnlBottom: TPanel
      Top = 74
      Width = 322
      ExplicitTop = 124
      ExplicitWidth = 467
      inherited btnConfirm: TSpeedButton
        Left = 190
        ExplicitLeft = 347
      end
      inherited btnCancel: TSpeedButton
        Left = 58
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
    object edtDescricao: TEdit
      Left = 92
      Top = 32
      Width = 214
      Height = 23
      BevelInner = bvNone
      BevelOuter = bvNone
      TabOrder = 2
    end
  end
end
