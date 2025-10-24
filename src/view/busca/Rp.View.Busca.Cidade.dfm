inherited FrmBuscaCidade: TFrmBuscaCidade
  Caption = 'Buscar Cidade'
  TextHeight = 15
  inherited pnlBackground: TPanel
    ExplicitWidth = 441
    inherited pnlMainCenter: TPanel
      Height = 482
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
              DataBinding.FieldName = 'nome'
              DataBinding.IsNullValueType = True
              Width = 272
            end
            object GridDocumento: TcxGridDBColumn
              Caption = 'Cpf/Cnpj'
              DataBinding.FieldName = 'id_documento'
              DataBinding.IsNullValueType = True
              Width = 111
            end
          end
        end
      end
    end
  end
end
