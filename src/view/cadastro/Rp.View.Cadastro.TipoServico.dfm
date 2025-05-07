inherited FrmCadastroTipoServico: TFrmCadastroTipoServico
  Caption = 'Tipo de Servi'#231'o'
  ClientHeight = 106
  ClientWidth = 347
  ExplicitWidth = 359
  ExplicitHeight = 144
  TextHeight = 15
  inherited pnlBackground: TPanel
    Width = 347
    Height = 106
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
      Left = 100
      Top = 16
      Width = 51
      Height = 15
      Caption = 'Descri'#231#227'o'
    end
    inherited pnlBottom: TPanel
      Top = 71
      Width = 347
      ExplicitTop = 124
      ExplicitWidth = 467
      inherited btnConfirm: TSpeedButton
        Left = 215
        ExplicitLeft = 347
      end
      inherited btnCancel: TSpeedButton
        Left = 83
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
      Left = 100
      Top = 32
      Width = 214
      Height = 23
      BevelInner = bvNone
      BevelOuter = bvNone
      TabOrder = 2
    end
  end
end
