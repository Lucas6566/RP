unit Rp.View.Pesquisa.OrdemServico;

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
  Rp.View.Base.Pesquisa,
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
  Vcl.Buttons,
  cxTextEdit,
  Vcl.StdCtrls,
  cxLabel,
  cxGridLevel,
  cxClasses,
  cxGridCustomView,
  cxGridCustomTableView,
  cxGridTableView,
  cxGridDBTableView,
  cxGrid,
  Vcl.ExtCtrls,
  Rp.Controller.Movimento,
  Rp.View.Movimento.OrdemServico,
  Rp.Util.Types,
  Rp.Util.Funcoes,
  Vcl.ComCtrls,
  dxCore,
  cxDateUtils,
  cxMaskEdit,
  cxDropDownEdit,
  cxCalendar;

type
  TFrmPesquisaOrdemServico = class(TFrmBasePesquisa)
    GridId: TcxGridDBColumn;
    GridNomeCliente: TcxGridDBColumn;
    GridIdCliente: TcxGridDBColumn;
    GridSubTotal: TcxGridDBColumn;
    GridDesconto: TcxGridDBColumn;
    GridAcrescimo: TcxGridDBColumn;
    GridTotal: TcxGridDBColumn;
    dteInicial: TcxDateEdit;
    Label1: TLabel;
    Label2: TLabel;
    dteFinal: TcxDateEdit;
    GridDataEmissao: TcxGridDBColumn;
    procedure btnAlterarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnSeachClick(Sender: TObject);
  private
    FPesquisa : iControllerMovimento;

    procedure Search;
  end;

implementation

{$R *.dfm}

procedure TFrmPesquisaOrdemServico.btnAlterarClick(Sender: TObject);
begin
  inherited;
  TFrmMovimentoOrdemServico.OrdemServicoShow(TpUpdate, FPesquisa);
end;

procedure TFrmPesquisaOrdemServico.btnExcluirClick(Sender: TObject);
begin
  inherited;
  if Mensagem('Você deseja fazer a exclusão da Ordem de Serviço '+DS.DataSet.FieldByName('id').AsString, tpPergunta) then
    FPesquisa.Delete;
end;

procedure TFrmPesquisaOrdemServico.btnIncluirClick(Sender: TObject);
begin
  inherited;
  TFrmMovimentoOrdemServico.OrdemServicoShow(TpInsert, FPesquisa);
  Search;
end;

procedure TFrmPesquisaOrdemServico.btnSeachClick(Sender: TObject);
begin
  inherited;
  Search;
end;

procedure TFrmPesquisaOrdemServico.Search;
begin
  FPesquisa.AddParam('dta_emissao',Format(' between ''%s'' and ''%s''',
                                          [FormatDateTime('YYYY-MM-DD', dteInicial.Date),
                                          FormatDateTime('YYYY-MM-DD', dteFinal.Date+1)]))
           .Find(FFieldSeach, edtSearch.Text);
end;

procedure TFrmPesquisaOrdemServico.FormCreate(Sender: TObject);
begin
  inherited;
  FPesquisa := FController.Movimento;
  FPesquisa.DataSource(DS);

  dteInicial.Date := now;
  dteFinal.Date := now;

  Search;
end;

end.
