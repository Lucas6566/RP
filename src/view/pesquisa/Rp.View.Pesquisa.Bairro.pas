unit Rp.View.Pesquisa.Bairro;

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
  Rp.Controller.Bairro,
  Rp.Util.Types,
  Rp.View.Cadastro.Bairro,
  Rp.Util.Funcoes;

type
  TFrmPesquisaBairro = class(TFrmBasePesquisa)
    GridCodigo: TcxGridDBColumn;
    GridNome: TcxGridDBColumn;
    GridTaxaEntrega: TcxGridDBColumn;
    GridCodigoCidade: TcxGridDBColumn;
    procedure btnIncluirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);

  private
    FPesquisa : iControllerBairro;
  public

  end;

implementation

{$R *.dfm}

procedure TFrmPesquisaBairro.btnAlterarClick(Sender: TObject);
begin
  inherited;
  TFrmCadastroBairro.BairroShow(TpUpdate, FPesquisa);
end;

procedure TFrmPesquisaBairro.btnExcluirClick(Sender: TObject);
begin
  inherited;
  if Mensagem('Você deseja fazer a exclusão da Bairro '+DS.DataSet.FieldByName('nome').AsString, tpPergunta) then
    FPesquisa.Delete;
end;

procedure TFrmPesquisaBairro.btnIncluirClick(Sender: TObject);
begin
  inherited;
  TFrmCadastroBairro.BairroShow(TpInsert, FPesquisa);
end;

procedure TFrmPesquisaBairro.btnPesquisarClick(Sender: TObject);
begin
  inherited;
  FPesquisa.Find;
end;

procedure TFrmPesquisaBairro.FormCreate(Sender: TObject);
begin
  inherited;
  FPesquisa := FController.Bairro;
  FPesquisa.DataSource(DS);
  FPesquisa.Find;
end;

end.
