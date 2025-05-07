unit Rp.View.Pesquisa.TipoServico;

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
  Rp.Controller.TipoServico,
  Rp.Util.Types,
  Rp.View.Cadastro.TipoServico,
  Rp.Util.Funcoes;

type
  TFrmPesquisaTipoServico = class(TFrmBasePesquisa)
    GridCodigo: TcxGridDBColumn;
    GridDescricao: TcxGridDBColumn;
    procedure btnIncluirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);

  private
    FPesquisa : iControllerTipoServico;
  end;

implementation

{$R *.dfm}

procedure TFrmPesquisaTipoServico.btnAlterarClick(Sender: TObject);
begin
  inherited;
  TFrmCadastroTipoServico.TipoServicoShow(TpUpdate, FPesquisa);
end;

procedure TFrmPesquisaTipoServico.btnExcluirClick(Sender: TObject);
begin
  inherited;
  if Mensagem('Você deseja fazer a exclusão da TipoServico '+DS.DataSet.FieldByName('descricao').AsString, tpPergunta) then
    FPesquisa.Delete;
end;

procedure TFrmPesquisaTipoServico.btnIncluirClick(Sender: TObject);
begin
  inherited;
  TFrmCadastroTipoServico.TipoServicoShow(TpInsert, FPesquisa);
end;

procedure TFrmPesquisaTipoServico.btnPesquisarClick(Sender: TObject);
begin
  inherited;
  FPesquisa.Find;
end;

procedure TFrmPesquisaTipoServico.FormCreate(Sender: TObject);
begin
  inherited;
  FPesquisa := FController.TipoServico;
  FPesquisa.DataSource(DS);
  FPesquisa.Find;
end;

end.
