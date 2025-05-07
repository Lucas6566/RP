unit Rp.View.Base.Busca;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Rp.View.Base, Vcl.ExtCtrls, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator,
  dxDateRanges, dxScrollbarAnnotations, Data.DB, cxDBData, cxContainer,
  Vcl.Buttons, cxTextEdit, Vcl.StdCtrls, cxLabel, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid;

type
  TFrmBaseBusca = class(TFrmBase)
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
    Panel5: TPanel;
    btnSeach: TSpeedButton;
    DS: TDataSource;
    procedure btnSeachClick(Sender: TObject);
    procedure GridPesquisaDBTableViewColumnHeaderClick(Sender: TcxGridTableView;
      AColumn: TcxGridColumn);
    procedure GridPesquisaDBTableViewEditDblClick(
      Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem;
      AEdit: TcxCustomEdit);
    procedure FormCreate(Sender: TObject);
  private
    FFieldSeach: String;
  public

  end;

var
  FrmBaseBusca: TFrmBaseBusca;

implementation

{$R *.dfm}

procedure TFrmBaseBusca.btnSeachClick(Sender: TObject);
begin
  inherited;
  if EdtSearch.Text <> '' then
    DS.DataSet.Locate(FFieldSeach, EdtSearch.Text, [loPartialKey]);
end;

procedure TFrmBaseBusca.FormCreate(Sender: TObject);
begin
  inherited;
  lblSearch.Caption := GridPesquisaDBTableView.Columns[0].Caption;
  FFieldSeach       := GridPesquisaDBTableView.Columns[0].DataBinding.FilterFieldName;
end;

procedure TFrmBaseBusca.GridPesquisaDBTableViewColumnHeaderClick(
  Sender: TcxGridTableView; AColumn: TcxGridColumn);
begin
  inherited;
  FFieldSeach := AColumn.DataBinding.FilterFieldName;
  LblSearch.Caption := 'Buscar ' + AColumn.Caption;
end;

procedure TFrmBaseBusca.GridPesquisaDBTableViewEditDblClick(
  Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem;
  AEdit: TcxCustomEdit);
begin
  inherited;
  ModalResult := mrOk;
end;

end.
