unit Rp.View.Pesquisa.Servico;

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
  Rp.Controller.Servico,
  Rp.Util.Types,
  Rp.View.Cadastro.Servico,
  Rp.Util.Funcoes;

type
  TFrmPesquisaServico = class(TFrmBasePesquisa)
    GridCodigo: TcxGridDBColumn;
    GridDescricao: TcxGridDBColumn;
    GridVlrVenda: TcxGridDBColumn;
    GrididTipoServico: TcxGridDBColumn;
    procedure btnIncluirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);

  private
    FPesquisa : iControllerServico;
  public

  end;

implementation

{$R *.dfm}

procedure TFrmPesquisaServico.btnAlterarClick(Sender: TObject);
begin
  inherited;
  TFrmCadastroServico.ServicoShow(TpUpdate, FPesquisa);
end;

procedure TFrmPesquisaServico.btnExcluirClick(Sender: TObject);
begin
  inherited;
  if Mensagem('Você deseja fazer a exclusão da Servico '+DS.DataSet.FieldByName('descricao').AsString, tpPergunta) then
    FPesquisa.Delete;
end;

procedure TFrmPesquisaServico.btnIncluirClick(Sender: TObject);
begin
  inherited;
  TFrmCadastroServico.ServicoShow(TpInsert, FPesquisa);
end;

procedure TFrmPesquisaServico.btnPesquisarClick(Sender: TObject);
begin
  inherited;
  FPesquisa.Find;
end;

procedure TFrmPesquisaServico.FormCreate(Sender: TObject);
begin
  inherited;
  FPesquisa := FController.Servico;
  FPesquisa.DataSource(DS);
  FPesquisa.Find;
end;

end.
