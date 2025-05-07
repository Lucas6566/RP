unit Rp.View.Pesquisa.FormaPagamento;

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
  Rp.Controller.FormaPagamento,
  Rp.Util.Types,
  Rp.View.Cadastro.FormaPagamento,
  Rp.Util.Funcoes;

type
  TFrmPesquisaFormaPagamento = class(TFrmBasePesquisa)
    GridCodigo: TcxGridDBColumn;
    GridDescricao: TcxGridDBColumn;
    procedure btnIncluirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);

  private
    FPesquisa : iControllerFormaPagamento;
  public

  end;

implementation

{$R *.dfm}

procedure TFrmPesquisaFormaPagamento.btnAlterarClick(Sender: TObject);
begin
  inherited;
  TFrmCadastroFormaPagamento.FormaPagamentoShow(TpUpdate, FPesquisa);
end;

procedure TFrmPesquisaFormaPagamento.btnExcluirClick(Sender: TObject);
begin
  inherited;
  if Mensagem('Você deseja fazer a exclusão da FormaPagamento '+DS.DataSet.FieldByName('descricao').AsString, tpPergunta) then
    FPesquisa.Delete;
end;

procedure TFrmPesquisaFormaPagamento.btnIncluirClick(Sender: TObject);
begin
  inherited;
  TFrmCadastroFormaPagamento.FormaPagamentoShow(TpInsert, FPesquisa);
end;

procedure TFrmPesquisaFormaPagamento.btnPesquisarClick(Sender: TObject);
begin
  inherited;
  FPesquisa.Find;
end;

procedure TFrmPesquisaFormaPagamento.FormCreate(Sender: TObject);
begin
  inherited;
  FPesquisa := FController.FormaPagamento;
  FPesquisa.DataSource(DS);
  FPesquisa.Find;
end;

end.
