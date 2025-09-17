inherited FrmPesquisaOrdemServico: TFrmPesquisaOrdemServico
  Caption = 'FrmPesquisaOrdemServico'
  ClientWidth = 960
  ExplicitWidth = 960
  TextHeight = 15
  inherited pnlBackground: TPanel
    Width = 960
    ExplicitWidth = 960
    inherited pnlMainCenter: TPanel
      Width = 960
      ExplicitWidth = 960
      inherited pnlButton: TPanel
        Width = 960
        ExplicitWidth = 960
      end
      inherited pnlClient: TPanel
        Width = 960
        ExplicitWidth = 960
        inherited GridPesquisa: TcxGrid
          Width = 960
          ExplicitWidth = 960
          inherited GridPesquisaDBTableView: TcxGridDBTableView
            object GridId: TcxGridDBColumn
              Caption = 'Titulo'
              DataBinding.FieldName = 'id'
              DataBinding.IsNullValueType = True
            end
            object GridIdCliente: TcxGridDBColumn
              Caption = 'C'#243'digo'
              DataBinding.FieldName = 'id_cliente'
              DataBinding.IsNullValueType = True
              Width = 55
            end
            object GridDataEmissao: TcxGridDBColumn
              Caption = 'Emiss'#227'o'
              DataBinding.FieldName = 'dta_emissao'
              DataBinding.IsNullValueType = True
              Width = 81
            end
            object GridNomeCliente: TcxGridDBColumn
              Caption = 'Cliente'
              DataBinding.FieldName = 'nome_cliente'
              DataBinding.IsNullValueType = True
              Width = 406
            end
            object GridSubTotal: TcxGridDBColumn
              Caption = 'SubTotal'
              DataBinding.FieldName = 'vlr_subtotal'
              DataBinding.IsNullValueType = True
              Width = 73
            end
            object GridDesconto: TcxGridDBColumn
              Caption = 'Desconto'
              DataBinding.FieldName = 'vlr_desconto'
              DataBinding.IsNullValueType = True
              Width = 82
            end
            object GridAcrescimo: TcxGridDBColumn
              Caption = 'Acrescimo'
              DataBinding.FieldName = 'vlr_acrescimo'
              DataBinding.IsNullValueType = True
              Width = 81
            end
            object GridTotal: TcxGridDBColumn
              Caption = 'Total'
              DataBinding.FieldName = 'vlr_total'
              DataBinding.IsNullValueType = True
              Width = 140
            end
          end
        end
      end
      inherited pnlTop: TPanel
        Width = 960
        ExplicitWidth = 960
        inherited PnlTopTitle: TPanel
          Width = 960
          ExplicitTop = -4
          ExplicitWidth = 960
          inherited lblTitleForm: TcxLabel
            Caption = 'Ordem de Servi'#231'o'
            Style.LookAndFeel.SkinName = ''
            StyleDisabled.LookAndFeel.SkinName = ''
            StyleFocused.LookAndFeel.SkinName = ''
            StyleHot.LookAndFeel.SkinName = ''
            ExplicitWidth = 263
            Width = 263
            AnchorY = 26
          end
        end
        inherited pnlTopInfo: TPanel
          Width = 960
          ExplicitTop = 54
          ExplicitWidth = 960
          inherited pnlBotoes: TPanel
            Left = 637
            ExplicitLeft = 637
            inherited btnExcluir: TSpeedButton
              OnClick = btnExcluirClick
              ExplicitLeft = 216
              ExplicitTop = -5
              ExplicitHeight = 44
            end
            inherited btnAlterar: TSpeedButton
              OnClick = btnAlterarClick
            end
            inherited btnIncluir: TSpeedButton
              OnClick = btnIncluirClick
            end
          end
          inherited pnlSearch: TPanel
            Width = 377
            ExplicitWidth = 377
            inherited lblSearch: TLabel
              Left = 189
              Top = 2
              ExplicitLeft = 189
              ExplicitTop = 2
            end
            object Label1: TLabel [1]
              Left = 11
              Top = 2
              Width = 58
              Height = 15
              Caption = 'Data Inicial'
            end
            object Label2: TLabel [2]
              Left = 100
              Top = 2
              Width = 52
              Height = 15
              Caption = 'Data Final'
            end
            inherited edtSearch: TcxTextEdit
              Left = 189
              Top = 16
              ExplicitLeft = 189
              ExplicitTop = 16
              ExplicitHeight = 23
            end
            inherited pnlBtnSearch: TPanel
              Left = 340
              Top = 16
              ExplicitLeft = 340
              ExplicitTop = 16
              inherited btnSeach: TSpeedButton
                ExplicitTop = 2
              end
            end
            object dteInicial: TcxDateEdit
              Left = 11
              Top = 16
              EditValue = 0d
              Properties.ShowTime = False
              TabOrder = 2
              Width = 83
            end
            object dteFinal: TcxDateEdit
              Left = 100
              Top = 16
              EditValue = 0d
              Properties.AutoSelect = False
              Properties.DateButtons = []
              Properties.SaveTime = False
              Properties.ShowTime = False
              Style.ButtonStyle = btsDefault
              TabOrder = 3
              Width = 83
            end
          end
        end
      end
    end
  end
  inherited DS: TDataSource
    Left = 488
    Top = 264
  end
end
