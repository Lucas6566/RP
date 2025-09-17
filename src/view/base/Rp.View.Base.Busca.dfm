inherited FrmBaseBusca: TFrmBaseBusca
  BorderStyle = bsSingle
  Caption = 'FrmBaseBusca'
  ClientHeight = 483
  ClientWidth = 441
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnShow = FormShow
  ExplicitWidth = 453
  ExplicitHeight = 521
  TextHeight = 15
  inherited pnlBackground: TPanel
    Width = 441
    Height = 483
    ExplicitWidth = 437
    ExplicitHeight = 482
    object pnlMainCenter: TPanel
      Left = 0
      Top = 0
      Width = 441
      Height = 483
      Align = alClient
      BevelOuter = bvNone
      ParentBackground = False
      ParentColor = True
      TabOrder = 0
      ExplicitWidth = 437
      ExplicitHeight = 482
      object pnlButton: TPanel
        Left = 0
        Top = 453
        Width = 441
        Height = 30
        Align = alBottom
        BevelOuter = bvNone
        ParentBackground = False
        ParentColor = True
        TabOrder = 0
        ExplicitTop = 452
        ExplicitWidth = 437
      end
      object pnlClient: TPanel
        Left = 0
        Top = 57
        Width = 441
        Height = 396
        Align = alClient
        BevelOuter = bvNone
        ParentBackground = False
        ParentColor = True
        TabOrder = 1
        ExplicitWidth = 437
        ExplicitHeight = 395
        object GridPesquisa: TcxGrid
          Left = 0
          Top = 0
          Width = 441
          Height = 396
          Align = alClient
          TabOrder = 0
          ExplicitWidth = 437
          ExplicitHeight = 395
          object GridPesquisaDBTableView: TcxGridDBTableView
            Navigator.Buttons.CustomButtons = <>
            ScrollbarAnnotations.CustomAnnotations = <>
            OnEditDblClick = GridPesquisaDBTableViewEditDblClick
            DataController.DataSource = DS
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            OptionsView.GroupByBox = False
            OnColumnHeaderClick = GridPesquisaDBTableViewColumnHeaderClick
          end
          object GridPesquisaLevel: TcxGridLevel
            GridView = GridPesquisaDBTableView
          end
        end
      end
      object pnlTop: TPanel
        Left = 0
        Top = 0
        Width = 441
        Height = 57
        Align = alTop
        BevelOuter = bvNone
        ParentBackground = False
        ParentColor = True
        TabOrder = 2
        ExplicitWidth = 437
        object pnlTopInfo: TPanel
          Left = 0
          Top = 0
          Width = 441
          Height = 51
          Align = alTop
          BevelOuter = bvNone
          ParentBackground = False
          ParentColor = True
          TabOrder = 0
          ExplicitWidth = 437
          object lblSeach: TLabel
            Left = 18
            Top = 7
            Width = 44
            Height = 15
            Caption = 'lblSeach'
          end
          object edtSeach: TcxTextEdit
            Left = 18
            Top = 21
            Properties.AutoSelect = False
            TabOrder = 0
            Width = 150
          end
          object Panel5: TPanel
            Left = 169
            Top = 21
            Width = 25
            Height = 23
            BevelOuter = bvSpace
            TabOrder = 1
            object btnSeach: TSpeedButton
              Left = 1
              Top = 1
              Width = 23
              Height = 21
              Cursor = crHandPoint
              Align = alClient
              Flat = True
              Glyph.Data = {
                76060000424D7606000000000000360400002800000018000000180000000100
                08000000000040020000120B0000120B00000001000000000000BE641400FAF2
                EC00D9A57700EACDB300C77A3500E1B89400F5E6D900D08F5500C0681A00EFDA
                C700C36F2500FFFFFF00D3966000CD874900E4C09F00DCAB7F00EED6C100D7A0
                6F00F7ECE200C5742D00E6C3A500DDAF8500FCF7F300CA824100DBAA7E00C16A
                1D00BF651600E3BD9B00CE8A4D00E7C6A800F1DFCE00F6E9DE00D1925A00C572
                2A00FDFBF900C97E3C00DEB08700F9F0E900C6773100C16C2000EBCFB500D193
                5800F0DCCA00DCAC8100E4BF9E00FFFFFF00C0691C00D8A37300E8C8AC00CF8C
                5000DAA67800BF641600F5E7DA00DEB18900E3BB9700FCF8F500D2945D00C36E
                2200F7E9DF00C3712700BF661800F9EDE500DDAD8300C7783200EBD0B700E5C1
                A100EED7C300C16A1C00F1DFCF00F5E7D900DFB1870000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00000000000000000000000000000000000000000000000000000B0B0B0B0B0B
                0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B
                0B0B0B0B0B0B1F0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B151910
                0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B2B0000191F0B0B0B0B0B0B0B
                0B0B0B0B0B0B0B0B0B0B0B15000000180B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B
                0B0B15000000180B0B0B0B0B0B0B0B0B2240022007111D370B2B0000003E0B0B
                0B0B0B0B0B0B0B03260000000000000A380000003E0B0B0B0B0B0B0B0B0B2400
                0031142A1E300C00000000150B0B0B0B0B0B0B0B0B0E0027030B0B0B0B0B0B2A
                13001C0B0B0B0B0B0B0B0B0B25273C420B0B0B0B0B0B0B0B34391A1E0B0B0B0B
                0B0B0B0B1500320B0B0B0B0B0B0B0B0B0B1B000C0B0B0B0B0B0B0B0B2300060B
                0B0B0B0B0B0B0B0B0B372E19220B0B0B0B0B0B0B3C0A0B0B0B0B0B0B0B0B0B0B
                0B0B0D00340B0B0B0B0B0B16003F0B0B0B0B0B0B0B0B0B0B0B0B20001E0B0B0B
                0B0B0B0B2E270B0B0B0B0B0B0B0B0B0B0B0B1700120B0B0B0B0B0B0B0D002A0B
                0B0B0B0B0B0B0B0B0B013C3B0B0B0B0B0B0B0B0B36000C0B0B0B0B0B0B0B0B0B
                0B2B002F0B0B0B0B0B0B0B0B372100410B0B0B0B0B0B0B0B103C08120B0B0B0B
                0B0B0B0B0B103C1A35220B0B0B0B0B0E2E00410B0B0B0B0B0B0B0B0B0B0B0319
                0021021B410F04003C050B0B0B0B0B0B0B0B0B0B0B0B0B06200000000000000D
                090B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B3D1435152C340B0B0B0B0B0B0B0B0B
                0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B}
              ExplicitTop = 9
            end
          end
        end
      end
    end
  end
  object DS: TDataSource
    Left = 448
    Top = 288
  end
end
