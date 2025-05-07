inherited FrmBuscaServico: TFrmBuscaServico
  Caption = 'FrmBuscaServico'
  OnCreate = FormCreate
  TextHeight = 15
  inherited pnlBackground: TPanel
    inherited pnlMainCenter: TPanel
      inherited pnlClient: TPanel
        inherited GridPesquisa: TcxGrid
          inherited GridPesquisaDBTableView: TcxGridDBTableView
            object GridCodigo: TcxGridDBColumn
              Caption = 'Codigo'
              DataBinding.FieldName = 'id'
              DataBinding.IsNullValueType = True
            end
            object GridDescricao: TcxGridDBColumn
              Caption = 'Servi'#231'o'
              DataBinding.FieldName = 'descricao'
              DataBinding.IsNullValueType = True
              Width = 272
            end
          end
        end
      end
      inherited pnlTop: TPanel
        inherited PnlTopTitle: TPanel
          inherited lblTitleForm: TcxLabel
            Caption = 'Busca Servi'#231'o'
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
          inherited Panel5: TPanel
            inherited btnSeach: TSpeedButton
              ExplicitLeft = 5
              ExplicitTop = 1
              ExplicitWidth = 23
              ExplicitHeight = 21
            end
          end
        end
      end
    end
  end
end
