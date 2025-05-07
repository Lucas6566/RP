inherited FrmPesquisaCliente: TFrmPesquisaCliente
  Caption = 'FrmPesquisaCliente'
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
          ExplicitTop = 1
          ExplicitHeight = 484
          inherited GridPesquisaDBTableView: TcxGridDBTableView
            object GridCodigo: TcxGridDBColumn
              Caption = 'Codigo'
              DataBinding.FieldName = 'id'
              DataBinding.IsNullValueType = True
              Width = 61
            end
            object GridNome: TcxGridDBColumn
              Caption = 'Cliente'
              DataBinding.FieldName = 'nome'
              DataBinding.IsNullValueType = True
              Width = 267
            end
            object GridNumDoc: TcxGridDBColumn
              Caption = 'Cpf/Cnpj'
              DataBinding.FieldName = 'id_documento'
              DataBinding.IsNullValueType = True
              Width = 223
            end
            object GridTelefone: TcxGridDBColumn
              Caption = 'Telefone'
              DataBinding.FieldName = 'telefone'
              DataBinding.IsNullValueType = True
              Width = 159
            end
            object GridEletronico: TcxGridDBColumn
              Caption = 'End. Eletronico'
              DataBinding.FieldName = 'email'
              DataBinding.IsNullValueType = True
              Width = 100
            end
            object GridBairro: TcxGridDBColumn
              Caption = 'Bairro'
              DataBinding.FieldName = 'id_bairro'
              DataBinding.IsNullValueType = True
            end
          end
        end
      end
      inherited pnlTop: TPanel
        inherited PnlTopTitle: TPanel
          inherited lblTitleForm: TcxLabel
            Caption = 'Cliente'
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
