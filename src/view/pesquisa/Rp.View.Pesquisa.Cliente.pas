unit Rp.View.Pesquisa.Cliente;

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
  Rp.Controller.Cliente,
  Rp.Util.Types,
  Rp.View.Cadastro.Cliente,
  Rp.Util.Funcoes;

type
  TFrmPesquisaCliente = class(TFrmBasePesquisa)
    GridCodigo: TcxGridDBColumn;
    GridNome: TcxGridDBColumn;
    procedure btnIncluirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);

  private
    FPesquisa : iControllerCliente;
  public

  end;

implementation

{$R *.dfm}

procedure TFrmPesquisaCliente.btnAlterarClick(Sender: TObject);
begin
  inherited;
  TFrmCadastroCliente.ClienteShow(TpUpdate, FPesquisa);
end;

procedure TFrmPesquisaCliente.btnExcluirClick(Sender: TObject);
begin
  inherited;
  if Mensagem('Você deseja fazer a exclusão da Cliente '+DS.DataSet.FieldByName('nome').AsString, tpPergunta) then
    FPesquisa.Delete;
end;

procedure TFrmPesquisaCliente.btnIncluirClick(Sender: TObject);
begin
  inherited;
  TFrmCadastroCliente.ClienteShow(TpInsert, FPesquisa);
end;

procedure TFrmPesquisaCliente.btnPesquisarClick(Sender: TObject);
begin
  inherited;
  FPesquisa.Find;
end;

procedure TFrmPesquisaCliente.FormCreate(Sender: TObject);
begin
  inherited;
  FPesquisa := FController.Cliente;
  FPesquisa.DataSource(DS);
  FPesquisa.Find;
end;

end.
