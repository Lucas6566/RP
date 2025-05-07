inherited FrmPesquisaBairro: TFrmPesquisaBairro
  Caption = 'FrmPesquisaBairro'
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
              Width = 61
            end
            object GridNome: TcxGridDBColumn
              Caption = 'Bairro'
              DataBinding.FieldName = 'nome'
              DataBinding.IsNullValueType = True
              Width = 267
            end
            object GridTaxaEntrega: TcxGridDBColumn
              Caption = 'Taxa de Entrega'
              DataBinding.FieldName = 'taxa_entrega'
              DataBinding.IsNullValueType = True
              Width = 91
            end
            object GridCodigoCidade: TcxGridDBColumn
              Caption = 'Codigo'
              DataBinding.FieldName = 'id_cidade'
              DataBinding.IsNullValueType = True
            end
          end
        end
      end
      inherited pnlTop: TPanel
        inherited PnlTopTitle: TPanel
          inherited lblTitleForm: TcxLabel
            Caption = 'Bairro'
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
