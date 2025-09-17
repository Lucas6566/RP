inherited FrmBuscaCliente: TFrmBuscaCliente
  Caption = 'Buscar Cliente'
  ClientHeight = 484
  ClientWidth = 437
  ExplicitWidth = 449
  ExplicitHeight = 522
  TextHeight = 15
  inherited pnlBackground: TPanel
    Width = 437
    Height = 484
    ExplicitHeight = 483
    inherited pnlMainCenter: TPanel
      Width = 437
      Height = 484
      ExplicitHeight = 484
      inherited pnlButton: TPanel
        Top = 454
        ExplicitTop = 453
      end
      inherited pnlClient: TPanel
        Height = 397
        ExplicitHeight = 396
        inherited GridPesquisa: TcxGrid
          Height = 397
          ExplicitHeight = 396
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
      inherited pnlTop: TPanel
        inherited pnlTopInfo: TPanel
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
