inherited FrmPesquisaVenda: TFrmPesquisaVenda
  Caption = 'FrmPesquisaVenda'
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
              Caption = 'Tituto'
              DataBinding.FieldName = 'id'
              DataBinding.IsNullValueType = True
              Width = 61
            end
            object GrididCliente: TcxGridDBColumn
              Caption = 'Codigo Cliente'
              DataBinding.FieldName = 'id_cliente'
              DataBinding.IsNullValueType = True
              Width = 47
            end
            object GridNomeCliente: TcxGridDBColumn
              Caption = 'Cliente'
              DataBinding.FieldName = 'nome_cliente'
              DataBinding.IsNullValueType = True
              Width = 299
            end
            object GridVlrSubTotal: TcxGridDBColumn
              Caption = 'SubTotal'
              DataBinding.FieldName = 'vlr_subtotal'
              DataBinding.IsNullValueType = True
              Width = 99
            end
            object GridVlrDesconto: TcxGridDBColumn
              Caption = 'Desconto'
              DataBinding.FieldName = 'vlr_desc'
              DataBinding.IsNullValueType = True
              Width = 112
            end
            object GridVlrAcrescimo: TcxGridDBColumn
              Caption = 'Acr'#233'scimo'
              DataBinding.FieldName = 'vlr_acres'
              DataBinding.IsNullValueType = True
              Width = 96
            end
            object GridVlrTotal: TcxGridDBColumn
              Caption = 'Valor Total'
              DataBinding.FieldName = 'vlr_total'
              DataBinding.IsNullValueType = True
              Width = 146
            end
          end
        end
      end
      inherited pnlTop: TPanel
        inherited PnlTopTitle: TPanel
          inherited lblTitleForm: TcxLabel
            Caption = 'Vendas'
            ParentColor = True
            Style.LookAndFeel.SkinName = ''
            StyleDisabled.LookAndFeel.SkinName = ''
            StyleFocused.LookAndFeel.SkinName = ''
            StyleHot.LookAndFeel.SkinName = ''
            Transparent = True
            ExplicitWidth = 279
            Width = 279
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
