unit Rp.View.Pesquisa.Venda;

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
  RP.View.Base.Pesquisa,
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
  Rp.Controller,
  Rp.Controller.Venda,
  Rp.Util.Types,
  Rp.View.Movimento.Venda,
  Rp.Util.Funcoes;

type
  TFrmPesquisaVenda = class(TFrmBasePesquisa)
    GridCodigo: TcxGridDBColumn;
    procedure btnIncluirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);

  private
    FPesquisa : iControllerVenda;
  end;

implementation

{$R *.dfm}

procedure TFrmPesquisaVenda.btnAlterarClick(Sender: TObject);
begin
  inherited;
  TFrmMovimentoVenda.VendaShow(TpUpdate, FPesquisa);
end;

procedure TFrmPesquisaVenda.btnExcluirClick(Sender: TObject);
begin
  inherited;
  if Mensagem('Você deseja fazer a exclusão da Venda '+DS.DataSet.FieldByName('descricao').AsString, tpPergunta) then
    FPesquisa.Delete;
end;

procedure TFrmPesquisaVenda.btnIncluirClick(Sender: TObject);
begin
  inherited;
  TFrmMovimentoVenda.VendaShow(TpInsert, FPesquisa);
end;

procedure TFrmPesquisaVenda.btnPesquisarClick(Sender: TObject);
begin
  inherited;
  FPesquisa.Find;
end;

procedure TFrmPesquisaVenda.FormCreate(Sender: TObject);
begin
  inherited;
  FPesquisa := FController.Venda;
  FPesquisa.DataSource(DS);
  FPesquisa.Find;
end;

end.
