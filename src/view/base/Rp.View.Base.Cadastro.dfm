inherited FrmBaseCadastro: TFrmBaseCadastro
  Caption = 'FrmBaseCadastro'
  ClientWidth = 624
  OnCreate = FormCreate
  ExplicitHeight = 478
  TextHeight = 15
  inherited pnlBackground: TPanel
    Width = 624
    ExplicitTop = 0
    ExplicitWidth = 620
    ExplicitHeight = 439
    object pnlBottom: TPanel
      Left = 0
      Top = 405
      Width = 624
      Height = 35
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alBottom
      BevelOuter = bvNone
      Color = 15652795
      ParentBackground = False
      TabOrder = 0
      ExplicitTop = 404
      ExplicitWidth = 620
      object btnConfirm: TSpeedButton
        Left = 492
        Top = 0
        Width = 132
        Height = 35
        Cursor = crHandPoint
        Align = alRight
        Caption = 'Confirmar'
        Flat = True
        OnClick = btnConfirmClick
        ExplicitLeft = 493
        ExplicitHeight = 48
      end
      object btnCancel: TSpeedButton
        Left = 360
        Top = 0
        Width = 132
        Height = 35
        Cursor = crHandPoint
        Align = alRight
        Caption = 'Cancelar'
        Flat = True
        OnClick = btnCancelClick
        ExplicitLeft = 361
        ExplicitHeight = 48
      end
    end
  end
end
