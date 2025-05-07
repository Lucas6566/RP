inherited FrmCadastroFuncionario: TFrmCadastroFuncionario
  Caption = 'FrmCadastroFuncionario'
  ClientHeight = 114
  ClientWidth = 475
  ExplicitWidth = 487
  ExplicitHeight = 152
  TextHeight = 15
  inherited pnlBackground: TPanel
    Width = 475
    Height = 114
    ExplicitLeft = 32
    ExplicitWidth = 475
    ExplicitHeight = 114
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
      Width = 63
      Height = 15
      Caption = 'Funcionario'
    end
    object Label3: TLabel [2]
      Left = 326
      Top = 16
      Width = 39
      Height = 15
      Caption = 'Fun'#231#227'o'
    end
    inherited pnlBottom: TPanel
      Top = 79
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
      Left = 100
      Top = 32
      Width = 214
      Height = 23
      BevelInner = bvNone
      BevelOuter = bvNone
      TabOrder = 2
    end
    object edtFuncao: TEdit
      Left = 326
      Top = 32
      Width = 121
      Height = 23
      BevelInner = bvNone
      BevelOuter = bvNone
      TabOrder = 3
    end
  end
end
