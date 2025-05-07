unit Rp.View.Pesquisa.Funcionario;

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
  Rp.Controller.Funcionario,
  Rp.Util.Types,
  Rp.View.Cadastro.Funcionario,
  Rp.Util.Funcoes;

type
  TFrmPesquisaFuncionario = class(TFrmBasePesquisa)
    GridCodigo: TcxGridDBColumn;
    GridNome: TcxGridDBColumn;
    GridFuncao: TcxGridDBColumn;
    procedure btnIncluirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);

  private
    FPesquisa : iControllerFuncionario;
  public

  end;

implementation

{$R *.dfm}

procedure TFrmPesquisaFuncionario.btnAlterarClick(Sender: TObject);
begin
  inherited;
  TFrmCadastroFuncionario.FuncionarioShow(TpUpdate, FPesquisa);
end;

procedure TFrmPesquisaFuncionario.btnExcluirClick(Sender: TObject);
begin
  inherited;
  if Mensagem('Você deseja fazer a exclusão da Funcionario '+DS.DataSet.FieldByName('nome').AsString, tpPergunta) then
    FPesquisa.Delete;
end;

procedure TFrmPesquisaFuncionario.btnIncluirClick(Sender: TObject);
begin
  inherited;
  TFrmCadastroFuncionario.FuncionarioShow(TpInsert, FPesquisa);
end;

procedure TFrmPesquisaFuncionario.btnPesquisarClick(Sender: TObject);
begin
  inherited;
  FPesquisa.Find;
end;

procedure TFrmPesquisaFuncionario.FormCreate(Sender: TObject);
begin
  inherited;
  FPesquisa := FController.Funcionario;
  FPesquisa.DataSource(DS);
  FPesquisa.Find;
end;

end.
