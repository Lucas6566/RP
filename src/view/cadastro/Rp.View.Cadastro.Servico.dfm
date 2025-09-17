inherited FrmCadastroServico: TFrmCadastroServico
  Caption = 'Servi'#231'o'
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
        Left = 279
        ExplicitLeft = 347
      end
      inherited btnCancel: TSpeedButton
        Left = 169
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
    object edtVlrVenda: TcxCurrencyEdit
      Left = 7
      Top = 64
      TabOrder = 3
      Width = 74
    end
  end
end
