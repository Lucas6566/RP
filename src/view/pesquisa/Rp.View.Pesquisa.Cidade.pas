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
  Rp.Util.Funcoes,
  Rp.Model.Entity.Cidade,
  Rp.Controller.Generic;

type
  TFrmPesquisaCidade = class(TFrmBasePesquisa)
    GridCodigo: TcxGridDBColumn;
    GridNome: TcxGridDBColumn;
    GridUF: TcxGridDBColumn;
    procedure btnIncluirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnSeachClick(Sender: TObject);
  private
    FPesquisa : iControllerGeneric<TCidade>;
  protected
    procedure Search; virtual;
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

procedure TFrmPesquisaCidade.btnSeachClick(Sender: TObject);
begin
  inherited;
  Search;
end;

procedure TFrmPesquisaCidade.FormCreate(Sender: TObject);
begin
  inherited;
  FPesquisa := TControllerCidade.New;
  FPesquisa.DataSource(DS)
           .Find;
end;

procedure TFrmPesquisaCidade.Search;
begin
  FPesquisa.Find;
end;

end.
