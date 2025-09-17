inherited FrmBuscaCidade: TFrmBuscaCidade
  Caption = 'Buscar Cidade'
  TextHeight = 15
  inherited pnlBackground: TPanel
    ExplicitWidth = 437
    ExplicitHeight = 482
    inherited pnlMainCenter: TPanel
      ExplicitWidth = 437
      ExplicitHeight = 482
      inherited pnlButton: TPanel
        ExplicitTop = 452
        ExplicitWidth = 437
      end
      inherited pnlClient: TPanel
        ExplicitWidth = 437
        ExplicitHeight = 356
        inherited GridPesquisa: TcxGrid
          ExplicitWidth = 437
          ExplicitHeight = 356
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
