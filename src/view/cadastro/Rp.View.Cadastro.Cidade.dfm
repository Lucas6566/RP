inherited FrmCadastroCidade: TFrmCadastroCidade
  Caption = 'Cidade'
  ClientHeight = 111
  ClientWidth = 377
  ExplicitWidth = 393
  ExplicitHeight = 150
  TextHeight = 15
  inherited pnlBackground: TPanel
    Width = 377
    Height = 111
    ExplicitWidth = 377
    ExplicitHeight = 111
    object Label1: TLabel [0]
      Left = 16
      Top = 16
      Width = 39
      Height = 15
      Caption = 'C'#243'digo'
    end
    object Label2: TLabel [1]
      Left = 100
      Top = 16
      Width = 37
      Height = 15
      Caption = 'Cidade'
    end
    object Label3: TLabel [2]
      Left = 322
      Top = 16
      Width = 14
      Height = 15
      Caption = 'UF'
    end
    inherited pnlBottom: TPanel
      Top = 77
      Width = 381
      Color = 6242337
      ParentBackground = False
      ExplicitTop = 76
      ExplicitWidth = 377
      inherited btnConfirm: TSpeedButton
        Left = 249
        ExplicitLeft = 255
        ExplicitHeight = 35
      end
      inherited btnCancel: TSpeedButton
        Left = 117
        ExplicitLeft = 119
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
      Left = 100
      Top = 32
      Width = 214
      Height = 23
      BevelInner = bvNone
      BevelOuter = bvNone
      TabOrder = 2
    end
    object edtUf: TEdit
      Left = 322
      Top = 32
      Width = 39
      Height = 23
      BevelInner = bvNone
      BevelOuter = bvNone
      TabOrder = 3
    end
  end
end
