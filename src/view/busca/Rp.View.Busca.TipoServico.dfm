inherited FrmBuscaTipoServico: TFrmBuscaTipoServico
  Caption = 'Buscar Tipo Servico'
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
            object GridNome: TcxGridDBColumn
              Caption = 'Nome'
              DataBinding.FieldName = 'descricao'
              DataBinding.IsNullValueType = True
              Width = 272
            end
          end
        end
      end
    end
  end
end
