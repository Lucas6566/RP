inherited FrmBasePesquisa1: TFrmBasePesquisa1
  Caption = 'FrmBasePesquisa1'
  ClientHeight = 601
  ClientWidth = 670
  ExplicitWidth = 670
  ExplicitHeight = 601
  TextHeight = 15
  inherited pnlBackground: TPanel
    Width = 670
    Height = 601
    inherited pnlMainCenter: TPanel
      Width = 670
      Height = 601
      inherited pnlButton: TPanel
        Top = 571
        Width = 670
      end
      inherited pnlClient: TPanel
        Width = 670
        Height = 475
        inherited GridPesquisa: TcxGrid
          Width = 670
          Height = 475
        end
      end
      inherited pnlTop: TPanel
        Width = 670
        inherited PnlTopTitle: TPanel
          Width = 670
          inherited lblTitleForm: TcxLabel
            Style.LookAndFeel.SkinName = ''
            StyleDisabled.LookAndFeel.SkinName = ''
            StyleFocused.LookAndFeel.SkinName = ''
            StyleHot.LookAndFeel.SkinName = ''
            AnchorY = 26
          end
        end
        inherited pnlTopInfo: TPanel
          Width = 670
          inherited pnlBotoes: TPanel
            Left = 238
            Visible = False
          end
        end
      end
    end
  end
end
