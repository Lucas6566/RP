inherited FrmBuscaServico: TFrmBuscaServico
  Caption = 'Buscar Servico'
  ClientHeight = 483
  ClientWidth = 441
  TextHeight = 15
  inherited pnlBackground: TPanel
    Width = 441
    Height = 483
    inherited pnlMainCenter: TPanel
      inherited pnlClient: TPanel
        inherited GridPesquisa: TcxGrid
          inherited GridPesquisaDBTableView: TcxGridDBTableView
            object GridCodigo: TcxGridDBColumn
              Caption = 'Codigo'
              DataBinding.FieldName = 'id'
              DataBinding.IsNullValueType = True
            end
            object GridNome: TcxGridDBColumn
              Caption = 'Nome'
              DataBinding.FieldName = 'descricao'
              DataBinding.IsNullValueType = True
              Width = 272
            end
          end
        end
      end
      inherited pnlTop: TPanel
        inherited pnlTopInfo: TPanel
          inherited edtSeach: TcxTextEdit
            ExplicitHeight = 23
          end
          inherited Panel5: TPanel
            inherited btnSeach: TSpeedButton
              OnClick = btnSeachClick
              ExplicitLeft = 5
              ExplicitTop = 0
            end
          end
        end
      end
    end
  end
end
