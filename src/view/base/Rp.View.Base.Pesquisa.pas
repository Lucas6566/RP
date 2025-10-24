
unit RP.View.Base.Pesquisa;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  RP.View.Base,
  cxGraphics,
  cxControls,
  cxLookAndFeels,
  cxLookAndFeelPainters,
  dxSkinsCore,
  dxSkinBlack,
  cxStyles,
  cxCustomData,
  cxFilter,
  cxData,
  cxDataStorage,
  cxEdit,
  cxNavigator,
  dxDateRanges,
  dxScrollbarAnnotations,
  Data.DB,
  cxDBData,
  cxContainer,
  Vcl.Menus,
  Vcl.Buttons,
  Vcl.StdCtrls,
  cxButtons,
  cxTextEdit,
  cxLabel,
  cxGridLevel,
  cxClasses,
  cxGridCustomView,
  cxGridCustomTableView,
  cxGridTableView,
  cxGridDBTableView,
  cxGrid,
  Vcl.ExtCtrls,
  Vcl.Imaging.pngimage,
  Rp.Controller,
  Rp.Controller.Generic;

type
  TFrmBasePesquisa = class(TFrmBase)
    pnlMainCenter: TPanel;
    pnlButton: TPanel;
    pnlClient: TPanel;
    GridPesquisa: TcxGrid;
    GridPesquisaDBTableView: TcxGridDBTableView;
    GridPesquisaLevel: TcxGridLevel;
    pnlTop: TPanel;
    PnlTopTitle: TPanel;
    lblTitleForm: TcxLabel;
    pnlTopInfo: TPanel;
    lblSearch: TLabel;
    edtSearch: TcxTextEdit;
    pnlBotoes: TPanel;
    btnExcluir: TSpeedButton;
    btnAlterar: TSpeedButton;
    btnIncluir: TSpeedButton;
    DS: TDataSource;
    pnlBtnSearch: TPanel;
    btnSeach: TSpeedButton;
    pnlSearch: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure GridPesquisaDBTableViewColumnHeaderClick(Sender: TcxGridTableView;
      AColumn: TcxGridColumn);
    procedure FormShow(Sender: TObject);
    procedure edtSearchKeyPress(Sender: TObject; var Key: Char);
    procedure btnSeachClick(Sender: TObject);
  protected
    FFieldSeach : String;
    FController : iController;

    procedure Search; virtual;
  end;

implementation

{$R *.dfm}

procedure TFrmBasePesquisa.btnSeachClick(Sender: TObject);
begin
  inherited;
  Search;
end;

procedure TFrmBasePesquisa.edtSearchKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if Key = chr(13) then
    Search;
end;

procedure TFrmBasePesquisa.FormCreate(Sender: TObject);
begin
  inherited;
  FController := TController.New;
end;

procedure TFrmBasePesquisa.FormShow(Sender: TObject);
begin
  inherited;
  GridPesquisaDBTableViewColumnHeaderClick(GridPesquisaDBTableView, GridPesquisaDBTableView.Columns[0]);
end;

procedure TFrmBasePesquisa.GridPesquisaDBTableViewColumnHeaderClick(
  Sender: TcxGridTableView; AColumn: TcxGridColumn);
begin
  inherited;
  FFieldSeach := AColumn.DataBinding.FilterFieldName;
  LblSearch.Caption := 'Fitrar ' + AColumn.Caption;
end;

procedure TFrmBasePesquisa.Search;
begin
  //
end;

end.
