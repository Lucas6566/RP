
unit Rp.View.Pesquisa.Cidade;

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
  Rp.Controller.Cidade,
  Rp.Util.Types,
  Rp.View.Cadastro.Cidade,
  Rp.Util.Funcoes;

type
  TFrmPesquisaCidade = class(TFrmBasePesquisa)
    GridCodigo: TcxGridDBColumn;
    GridNome: TcxGridDBColumn;
    GridUF: TcxGridDBColumn;
    procedure btnIncluirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);

  private
    FPesquisa : iControllerCidade;
  public

  end;

implementation

{$R *.dfm}

procedure TFrmPesquisaCidade.btnAlterarClick(Sender: TObject);
begin
  inherited;
  TFrmCadastroCidade.CidadeShow(TpUpdate, FPesquisa);
end;

procedure TFrmPesquisaCidade.btnExcluirClick(Sender: TObject);
begin
  inherited;
  if Mensagem('Você deseja fazer a exclusão da cidade '+DS.DataSet.FieldByName('nome').AsString, tpPergunta) then
    FPesquisa.Delete;
end;

procedure TFrmPesquisaCidade.btnIncluirClick(Sender: TObject);
begin
  inherited;
  TFrmCadastroCidade.CidadeShow(TpInsert, FPesquisa);
end;

procedure TFrmPesquisaCidade.btnPesquisarClick(Sender: TObject);
begin
  inherited;
  FPesquisa.Find;
end;

procedure TFrmPesquisaCidade.FormCreate(Sender: TObject);
begin
  inherited;
  FPesquisa := FController.Cidade;
  FPesquisa.DataSource(DS);
  FPesquisa.Find;
end;

end.
