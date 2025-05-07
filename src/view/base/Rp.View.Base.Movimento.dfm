inherited FrmBaseMovimento: TFrmBaseMovimento
  Caption = 'FrmBaseMovimento'
  OnCreate = FormCreate
  ExplicitWidth = 632
  ExplicitHeight = 478
  TextHeight = 15
  inherited pnlBackground: TPanel
    Height = 405
    ExplicitTop = 0
    ExplicitWidth = 616
    ExplicitHeight = 404
  end
  object pnlBottom: TPanel
    Left = 0
    Top = 405
    Width = 620
    Height = 35
    Margins.Left = 0
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 0
    Align = alBottom
    BevelOuter = bvNone
    Color = 15652795
    ParentBackground = False
    TabOrder = 1
    ExplicitTop = 404
    ExplicitWidth = 616
    object btnConfirm: TSpeedButton
      Left = 488
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
      Left = 356
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
