inherited FrmMovimentoVendaPagamento: TFrmMovimentoVendaPagamento
  Caption = 'FrmMovimentoVendaPagamento'
  ClientHeight = 463
  ClientWidth = 608
  Position = poMainFormCenter
  OnShow = FormShow
  ExplicitWidth = 620
  ExplicitHeight = 501
  TextHeight = 15
  inherited pnlBackground: TPanel
    Width = 608
    Height = 428
    ExplicitWidth = 604
    ExplicitHeight = 427
    object pnlParcelas: TPanel
      Left = 0
      Top = 0
      Width = 608
      Height = 428
      Align = alClient
      TabOrder = 0
      ExplicitWidth = 604
      ExplicitHeight = 427
      object pnlFormaPagto: TPanel
        AlignWithMargins = True
        Left = 4
        Top = 4
        Width = 301
        Height = 420
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 0
        ExplicitHeight = 419
        object pnlFiltro: TPanel
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 295
          Height = 38
          Align = alTop
          Caption = 'Selecione a forma de pagamento'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Segoe UI Semibold'
          Font.Style = [fsBold, fsItalic]
          ParentFont = False
          TabOrder = 0
        end
        object Panel3: TPanel
          AlignWithMargins = True
          Left = 3
          Top = 47
          Width = 295
          Height = 370
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
          ExplicitHeight = 369
          object GridForma: TcxGrid
            Left = 0
            Top = 0
            Width = 295
            Height = 370
            Align = alClient
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            LookAndFeel.NativeStyle = False
            LookAndFeel.SkinName = 'Black'
            ExplicitLeft = 5
            object GridFormaDBCard: TcxGridDBCardView
              Navigator.Buttons.CustomButtons = <>
              ScrollbarAnnotations.CustomAnnotations = <>
              DataController.DataSource = DS
              DataController.Summary.DefaultGroupSummaryItems = <>
              DataController.Summary.FooterSummaryItems = <>
              DataController.Summary.SummaryGroups = <>
              LayoutDirection = ldVertical
              OptionsBehavior.CellHints = True
              OptionsCustomize.CardSizing = False
              OptionsCustomize.LayeredRows = True
              OptionsCustomize.RowExpanding = False
              OptionsCustomize.RowFiltering = False
              OptionsData.Deleting = False
              OptionsData.DeletingConfirmation = False
              OptionsData.Editing = False
              OptionsData.Inserting = False
              OptionsView.NoDataToDisplayInfoText = ' '
              OptionsView.ScrollBars = ssVertical
              OptionsView.CaptionSeparator = #0
              OptionsView.CardIndent = 4
              OptionsView.CardWidth = 273
              OptionsView.CellAutoHeight = True
              OptionsView.EmptyRows = False
              OptionsView.SeparatorWidth = 0
              object GridDescricao: TcxGridDBCardViewRow
                Caption = 'Pagamento'
                DataBinding.FieldName = 'descricao'
                DataBinding.IsNullValueType = True
                Options.Editing = False
                Options.Filtering = False
                Options.FilteringWithFindPanel = False
                Options.Focusing = False
                Options.IgnoreTimeForFiltering = False
                Options.IncSearch = False
                Options.Expanding = False
                Options.FilteringAddValueItems = False
                Options.FilteringFilteredItemsList = False
                Options.FilteringMRUItemsList = False
                Options.FilteringPopup = False
                Options.FilteringPopupMultiSelect = False
                Options.Moving = False
                Options.ShowCaption = False
                Position.BeginsLayer = True
                Position.Width = 230
              end
            end
            object GridFormaLevel: TcxGridLevel
              GridView = GridFormaDBCard
            end
          end
        end
      end
      object Panel4: TPanel
        Left = 313
        Top = 1
        Width = 294
        Height = 426
        Align = alRight
        BevelOuter = bvNone
        TabOrder = 1
        ExplicitLeft = 309
        ExplicitHeight = 425
        object Panel5: TPanel
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 288
          Height = 420
          Align = alClient
          BevelKind = bkFlat
          BevelOuter = bvNone
          TabOrder = 0
          ExplicitHeight = 419
          object lblSubTotal: TLabel
            Left = 99
            Top = 2
            Width = 180
            Height = 37
            Align = alCustom
            AutoSize = False
            Caption = 'R$ 0,00'
            Color = 16052977
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 4868170
            Font.Height = -24
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
            Transparent = True
            Layout = tlCenter
          end
          object lblVlrDesconto: TLabel
            Left = 99
            Top = 68
            Width = 180
            Height = 37
            Align = alCustom
            AutoSize = False
            Caption = 'R$ 0,00'
            Color = 16052977
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 4868170
            Font.Height = -24
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
            Transparent = True
            Layout = tlCenter
          end
          object lblVlrAcrescimo: TLabel
            Left = 99
            Top = 103
            Width = 180
            Height = 37
            Align = alCustom
            AutoSize = False
            Caption = 'R$ 0,00'
            Color = 16052977
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 4868170
            Font.Height = -24
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
            Transparent = True
            Layout = tlCenter
          end
          object lblRecebido: TLabel
            Left = 99
            Top = 184
            Width = 180
            Height = 37
            Align = alCustom
            Anchors = [akTop, akRight]
            AutoSize = False
            Caption = 'R$ 0,00'
            Color = 16052977
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGreen
            Font.Height = -24
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
            Transparent = True
            Layout = tlCenter
          end
          object lblReceber: TLabel
            Left = 99
            Top = 215
            Width = 180
            Height = 37
            Align = alCustom
            Anchors = [akTop, akRight]
            AutoSize = False
            Caption = 'R$ 0,00'
            Color = 16052977
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 33023
            Font.Height = -24
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
            Transparent = True
            Layout = tlCenter
          end
          object lblVlrTotal: TLabel
            Left = 99
            Top = 137
            Width = 180
            Height = 37
            Align = alCustom
            AutoSize = False
            Caption = 'R$ 0,00'
            Color = 16052977
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 4868170
            Font.Height = -24
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
            Transparent = True
            Layout = tlCenter
          end
          object Bevel3: TBevel
            Left = 7
            Top = 178
            Width = 272
            Height = 15
            Shape = bsTopLine
          end
          object lblVlrFrete: TLabel
            Left = 99
            Top = 34
            Width = 180
            Height = 37
            Align = alCustom
            AutoSize = False
            Caption = 'R$ 0,00'
            Color = 16052977
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 4868170
            Font.Height = -24
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
            Transparent = True
            Layout = tlCenter
          end
          object cxLabel1: TcxLabel
            AlignWithMargins = True
            Left = 39
            Top = 11
            Cursor = crHandPoint
            Margins.Left = 2
            Margins.Top = 1
            Margins.Right = 10
            Margins.Bottom = 1
            Caption = 'Subtotal:'
            ParentFont = False
            Style.Font.Charset = ANSI_CHARSET
            Style.Font.Color = 4868170
            Style.Font.Height = -13
            Style.Font.Name = 'Segoe UI Semibold'
            Style.Font.Style = [fsBold, fsItalic]
            Style.IsFontAssigned = True
            Properties.Alignment.Horz = taLeftJustify
          end
          object cxLabel2: TcxLabel
            AlignWithMargins = True
            Left = 34
            Top = 79
            Cursor = crHandPoint
            Margins.Left = 2
            Margins.Top = 1
            Margins.Right = 10
            Margins.Bottom = 1
            Caption = 'Desconto:'
            ParentFont = False
            Style.Font.Charset = ANSI_CHARSET
            Style.Font.Color = 4868170
            Style.Font.Height = -13
            Style.Font.Name = 'Segoe UI Semibold'
            Style.Font.Style = [fsBold, fsItalic]
            Style.IsFontAssigned = True
            Properties.Alignment.Horz = taRightJustify
            AnchorX = 96
          end
          object cxLabel3: TcxLabel
            AlignWithMargins = True
            Left = 29
            Top = 114
            Cursor = crHandPoint
            Margins.Left = 2
            Margins.Top = 1
            Margins.Right = 10
            Margins.Bottom = 1
            Caption = 'Acrescimo:'
            ParentFont = False
            Style.Font.Charset = ANSI_CHARSET
            Style.Font.Color = 4868170
            Style.Font.Height = -13
            Style.Font.Name = 'Segoe UI Semibold'
            Style.Font.Style = [fsBold, fsItalic]
            Style.IsFontAssigned = True
            Properties.Alignment.Horz = taRightJustify
            AnchorX = 96
          end
          object cxLabel4: TcxLabel
            AlignWithMargins = True
            Left = 19
            Top = 191
            Cursor = crHandPoint
            Margins.Left = 2
            Margins.Top = 1
            Margins.Right = 10
            Margins.Bottom = 1
            Caption = 'Valor Pago:'
            ParentFont = False
            Style.Font.Charset = ANSI_CHARSET
            Style.Font.Color = clGreen
            Style.Font.Height = -13
            Style.Font.Name = 'Segoe UI Semibold'
            Style.Font.Style = [fsBold, fsItalic]
            Style.IsFontAssigned = True
            Properties.Alignment.Horz = taRightJustify
            AnchorX = 90
          end
          object cxLabel6: TcxLabel
            AlignWithMargins = True
            Left = 4
            Top = 224
            Cursor = crHandPoint
            Margins.Left = 2
            Margins.Top = 1
            Margins.Right = 10
            Margins.Bottom = 1
            Caption = 'Valor a pagar:'
            ParentFont = False
            Style.Font.Charset = ANSI_CHARSET
            Style.Font.Color = 33023
            Style.Font.Height = -13
            Style.Font.Name = 'Segoe UI Semibold'
            Style.Font.Style = [fsBold, fsItalic]
            Style.IsFontAssigned = True
            Properties.Alignment.Horz = taRightJustify
            AnchorX = 90
          end
          object cxLabel7: TcxLabel
            AlignWithMargins = True
            Left = 25
            Top = 148
            Cursor = crHandPoint
            Margins.Left = 2
            Margins.Top = 1
            Margins.Right = 10
            Margins.Bottom = 1
            Caption = 'Total Total:'
            ParentFont = False
            Style.Font.Charset = ANSI_CHARSET
            Style.Font.Color = 4868170
            Style.Font.Height = -13
            Style.Font.Name = 'Segoe UI Semibold'
            Style.Font.Style = [fsBold, fsItalic]
            Style.IsFontAssigned = True
            Properties.Alignment.Horz = taRightJustify
            AnchorX = 96
          end
          object cxLabel5: TcxLabel
            AlignWithMargins = True
            Left = 58
            Top = 45
            Cursor = crHandPoint
            Margins.Left = 2
            Margins.Top = 1
            Margins.Right = 10
            Margins.Bottom = 1
            Caption = 'Frete:'
            ParentFont = False
            Style.Font.Charset = ANSI_CHARSET
            Style.Font.Color = 4868170
            Style.Font.Height = -13
            Style.Font.Name = 'Segoe UI Semibold'
            Style.Font.Style = [fsBold, fsItalic]
            Style.IsFontAssigned = True
            Properties.Alignment.Horz = taRightJustify
            AnchorX = 96
          end
        end
      end
    end
  end
  inherited pnlBottom: TPanel
    Top = 428
    Width = 608
    ExplicitTop = 427
    ExplicitWidth = 604
    inherited btnConfirm: TSpeedButton
      Left = 476
      ExplicitLeft = 476
    end
    inherited btnCancel: TSpeedButton
      Left = 344
      ExplicitLeft = 344
    end
  end
  object DS: TDataSource
    Left = 207
    Top = 203
  end
end
