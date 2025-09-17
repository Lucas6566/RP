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
    pnlTopInfo: TPanel;
    lblSeach: TLabel;
    edtSeach: TcxTextEdit;
    Panel5: TPanel;
    btnSeach: TSpeedButton;
    DS: TDataSource;
    procedure GridPesquisaDBTableViewColumnHeaderClick(Sender: TcxGridTableView;
      AColumn: TcxGridColumn);
    procedure GridPesquisaDBTableViewEditDblClick(
      Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem;
      AEdit: TcxCustomEdit);
    procedure FormCreate(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  protected
    FFieldSeach: String;
    procedure SetFieldSeach(aValue: TcxGridColumn);
  end;

var
  FrmBaseBusca: TFrmBaseBusca;

implementation

{$R *.dfm}

procedure TFrmBaseBusca.btnCancelClick(Sender: TObject);
begin
  inherited;
  ModalResult := mrCancel;
end;

procedure TFrmBaseBusca.FormCreate(Sender: TObject);
begin
  inherited;
  lblSeach.Caption := GridPesquisaDBTableView.Columns[0].Caption;
  FFieldSeach      := GridPesquisaDBTableView.Columns[0].DataBinding.FilterFieldName;
  GridPesquisaDBTableViewColumnHeaderClick(GridPesquisaDBTableView, GridPesquisaDBTableView.Columns[0]);
end;

procedure TFrmBaseBusca.FormShow(Sender: TObject);
begin
  inherited;
  edtSeach.SelStart := Length(edtSeach.Text);
  edtSeach.SetFocus;
end;

procedure TFrmBaseBusca.GridPesquisaDBTableViewColumnHeaderClick(
  Sender: TcxGridTableView; AColumn: TcxGridColumn);
begin
  inherited;
  SetFieldSeach(AColumn);
end;

procedure TFrmBaseBusca.GridPesquisaDBTableViewEditDblClick(
  Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem;
  AEdit: TcxCustomEdit);
begin
  inherited;
  ModalResult := mrOk;
end;

procedure TFrmBaseBusca.SetFieldSeach(aValue: TcxGridColumn);
begin
  FFieldSeach := aValue.DataBinding.FilterFieldName;
  LblSeach.Caption := 'Buscar ' + aValue.Caption;
end;

end.
