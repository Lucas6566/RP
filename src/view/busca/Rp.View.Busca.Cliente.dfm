inherited FrmBuscaCliente: TFrmBuscaCliente
  Caption = 'FrmBuscaCliente'
  OnCreate = FormCreate
  TextHeight = 15
  inherited pnlBackground: TPanel
    inherited pnlMainCenter: TPanel
      inherited pnlClient: TPanel
        inherited GridPesquisa: TcxGrid
          ExplicitTop = 6
          inherited GridPesquisaDBTableView: TcxGridDBTableView
            OnEditDblClick = GridPesquisaDBTableViewEditDblClick
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
      inherited pnlTop: TPanel
        inherited PnlTopTitle: TPanel
          inherited lblTitleForm: TcxLabel
            Style.LookAndFeel.SkinName = ''
            StyleDisabled.LookAndFeel.SkinName = ''
            StyleFocused.LookAndFeel.SkinName = ''
            StyleHot.LookAndFeel.SkinName = ''
            AnchorY = 26
          end
        end
      end
    end
  end
end
