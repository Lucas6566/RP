inherited FrmPesquisaCidade: TFrmPesquisaCidade
  Caption = 'FrmPesquisaCidade'
  ClientHeight = 610
  ExplicitHeight = 610
  TextHeight = 15
  inherited pnlBackground: TPanel
    Height = 610
    ExplicitHeight = 610
    inherited pnlMainCenter: TPanel
      Height = 610
      ExplicitHeight = 610
      inherited pnlButton: TPanel
        Top = 580
        ExplicitTop = 580
      end
      inherited pnlClient: TPanel
        Height = 484
        ExplicitHeight = 484
        inherited GridPesquisa: TcxGrid
          Height = 484
          ExplicitHeight = 484
          inherited GridPesquisaDBTableView: TcxGridDBTableView
            object GridCodigo: TcxGridDBColumn
              Caption = 'Codigo'
              DataBinding.FieldName = 'id'
              DataBinding.IsNullValueType = True
              Width = 90
            end
            object GridNome: TcxGridDBColumn
              Caption = 'Nome'
              DataBinding.FieldName = 'nome'
              DataBinding.IsNullValueType = True
              Width = 275
            end
            object GridUF: TcxGridDBColumn
              Caption = 'Uf'
              DataBinding.FieldName = 'uf'
              DataBinding.IsNullValueType = True
              Width = 71
            end
          end
        end
      end
      inherited pnlTop: TPanel
        inherited PnlTopTitle: TPanel
          inherited lblTitleForm: TcxLabel
            Caption = 'Cidade'
            ParentColor = True
            Style.LookAndFeel.SkinName = ''
            StyleDisabled.LookAndFeel.SkinName = ''
            StyleFocused.LookAndFeel.SkinName = ''
            StyleHot.LookAndFeel.SkinName = ''
            Transparent = True
            AnchorY = 26
          end
        end
        inherited pnlTopInfo: TPanel
          inherited edtSearch: TcxTextEdit
            ExplicitHeight = 23
          end
          inherited pnlBotoes: TPanel
            ParentColor = True
            inherited btnPesquisar: TSpeedButton
              OnClick = btnPesquisarClick
            end
            inherited btnExcluir: TSpeedButton
              OnClick = btnExcluirClick
            end
            inherited btnAlterar: TSpeedButton
              OnClick = btnAlterarClick
            end
            inherited btnIncluir: TSpeedButton
              OnClick = btnIncluirClick
              ExplicitLeft = -6
              ExplicitTop = -5
              ExplicitHeight = 44
            end
          end
        end
      end
    end
  end
end
