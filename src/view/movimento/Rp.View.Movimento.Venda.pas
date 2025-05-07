unit Rp.View.Movimento.Venda;

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
  Rp.View.Base.Movimento,
  Vcl.Buttons,
  Vcl.ExtCtrls,
  Vcl.ComCtrls,
  Vcl.StdCtrls,
  cxGraphics,
  cxControls,
  cxLookAndFeels,
  cxLookAndFeelPainters,
  cxContainer,
  cxEdit,
  dxSkinsCore,
  dxSkinBlack,
  cxStyles,
  cxCustomData,
  cxFilter,
  cxData,
  cxDataStorage,
  cxNavigator,
  dxDateRanges,
  dxScrollbarAnnotations,
  Data.DB,
  cxDBData,
  cxGridLevel,
  cxGridCustomTableView,
  cxGridTableView,
  cxGridDBTableView,
  cxClasses,
  cxGridCustomView,
  cxGrid,
  cxTextEdit,
  cxCurrencyEdit,
  Vcl.Menus,
  cxButtons,
  Rp.Controller.Venda,
  Rp.Util.Types,
  Rp.Controller.VendaServico,
  Rp.Controller.VendaParcela,
  Rp.View.Busca.Cliente,
  Rp.Controller.Cliente, Rp.Controller.Servico, Rp.View.Busca.Servico,
  Rp.View.Movimento.VendaPagamento, cxMaskEdit, cxDropDownEdit;

type
  TFrmMovimentoVenda = class(TFrmBaseMovimento)
    pnlTop: TPanel;
    EdtCodigo: TEdit;
    Label3: TLabel;
    Label1: TLabel;
    DtpEmissao: TDateTimePicker;
    pnlCliente: TPanel;
    Label2: TLabel;
    edtIdCliente: TEdit;
    edtNomeCliente: TEdit;
    edtDocCliente: TEdit;
    edtFoneCliente: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    pnlServico: TPanel;
    Label6: TLabel;
    edtIdServico: TEdit;
    edtDescrServico: TEdit;
    edtVlrUnitarioServico: TcxCurrencyEdit;
    Label7: TLabel;
    Label8: TLabel;
    edtVlrTotalServico: TcxCurrencyEdit;
    Label9: TLabel;
    edtVlrDescServico: TcxCurrencyEdit;
    Label10: TLabel;
    edtVlrAcrescServico: TcxCurrencyEdit;
    Label11: TLabel;
    pnlItensServico: TPanel;
    GridPesquisa: TcxGrid;
    GridPesquisaDBTableView: TcxGridDBTableView;
    GridCodServico: TcxGridDBColumn;
    GridDescServico: TcxGridDBColumn;
    GridVlrUnitario: TcxGridDBColumn;
    GridQtde: TcxGridDBColumn;
    GridVlrDesconto: TcxGridDBColumn;
    GridVlrAcrescimo: TcxGridDBColumn;
    GridVlrTotal: TcxGridDBColumn;
    GridPesquisaLevel: TcxGridLevel;
    edtIdTpServico: TEdit;
    edtDescrTpServico: TEdit;
    Label12: TLabel;
    Panel1: TPanel;
    pnlExcluirServico: TPanel;
    btnExcluirServico: TSpeedButton;
    pnlCancelarServico: TPanel;
    edtCancelarServico: TSpeedButton;
    pnlIncluirServico: TPanel;
    btnIncluir: TSpeedButton;
    Panel5: TPanel;
    btnSeachServico: TSpeedButton;
    Panel6: TPanel;
    btnSeachCliente: TSpeedButton;
    DSServico: TDataSource;
    edtQtdeServico: TEdit;
    pnlTotais: TPanel;
    edtVlrTotal: TcxCurrencyEdit;
    Label13: TLabel;
    edtVlrAcres: TcxCurrencyEdit;
    Label14: TLabel;
    edtVlrDesc: TcxCurrencyEdit;
    Label15: TLabel;
    edtVlrFrete: TcxCurrencyEdit;
    Label18: TLabel;
    edtVlrSubTotal: TcxCurrencyEdit;
    Label16: TLabel;
    edtQtdeItens: TEdit;
    Label17: TLabel;
    procedure btnConfirmClick(Sender: TObject);
    procedure btnSeachClienteClick(Sender: TObject);
    procedure btnSeachServicoClick(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure edtVlrUnitarioServicoExit(Sender: TObject);
    procedure edtQtdeServicoExit(Sender: TObject);
    procedure edtVlrDescServicoExit(Sender: TObject);
    procedure edtVlrAcrescServicoExit(Sender: TObject);
    procedure edtCancelarServicoClick(Sender: TObject);
    procedure btnExcluirServicoClick(Sender: TObject);
    procedure edtVlrFreteExit(Sender: TObject);
    procedure edtVlrDescExit(Sender: TObject);
    procedure edtVlrAcresExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    FCadastro : iControllerVenda;
    FServico : iControllerVendaServico;
    FParcela : iControllerVendaParcela;

    procedure GetController( aCadastro : iControllerVenda );

    procedure OpenRegister;
    procedure OpenRegisterVenda;
    procedure OpenRegisterServico;

    procedure SeachCliente;
    procedure SeachServico;

    procedure CalcServico;
    procedure CalcTotaisVenda;
    procedure CalcMovimentacaoVenda;

    procedure IncludeData;
    procedure IncludeRegister;
    procedure IncludeServico;

    procedure ClearFieldsServicos;
  public
    class function VendaShow(aTypeOperation : TTypeOperation; aCadastro : iControllerVenda ): Boolean;
  end;

var
  FrmMovimentoVenda: TFrmMovimentoVenda;

implementation

{$R *.dfm}

{ TFrmMovimentoVenda }

procedure TFrmMovimentoVenda.btnConfirmClick(Sender: TObject);
begin
  IncludeData;
  if TFrmMovimentoVendaPagamento.IncludePagamento(FCadastro) then
    IncludeRegister;
  inherited;
end;

procedure TFrmMovimentoVenda.btnExcluirServicoClick(Sender: TObject);
begin
  inherited;
  FServico.DeleteDataSet;
  CalcMovimentacaoVenda;
end;

procedure TFrmMovimentoVenda.btnIncluirClick(Sender: TObject);
begin
  inherited;
  if Trim(edtIdServico.Text) = EmptyStr then
    ShowMessage('Você precisa selecionar um serviço')
  else begin
    IncludeServico;
    ClearFieldsServicos;
    CalcMovimentacaoVenda;
  end;
end;

procedure TFrmMovimentoVenda.btnSeachClienteClick(Sender: TObject);
begin
  inherited;
  SeachCliente;
end;

procedure TFrmMovimentoVenda.btnSeachServicoClick(Sender: TObject);
begin
  inherited;
  SeachServico;
end;

procedure TFrmMovimentoVenda.CalcServico;
begin
  edtVlrTotalServico.Value := (edtVlrUnitarioServico.Value * StrToFloatDef(edtQtdeServico.Text,0))
                              + (edtVlrAcrescServico.Value)
                              - (edtVlrDescServico.Value);
end;

procedure TFrmMovimentoVenda.CalcTotaisVenda;
begin
  edtVlrTotal.Value := (edtVlrSubTotal.Value)
                        + (edtVlrFrete.Value)
                        + (edtVlrAcres.Value)
                        - (edtVlrDesc.Value);
end;

procedure TFrmMovimentoVenda.CalcMovimentacaoVenda;
var
  lQtdeItens : Integer;
begin
  lQtdeItens := DSServico.DataSet.RecordCount;

  edtVlrSubTotal.Value := 0;

  for var I := 0 to FServico.RecordCount -1 do
    edtVlrSubTotal.Value := edtVlrSubTotal.Value + FServico.Entidade(I).vlr_total;

  edtQtdeItens.Text := IntToStr(lQtdeItens);

  CalcTotaisVenda;
end;

procedure TFrmMovimentoVenda.ClearFieldsServicos;
begin
  edtIdServico.Text      := EmptyStr;
  edtDescrServico.Text   := EmptyStr;
  EdtIdTpServico.Text    := EmptyStr;
  edtDescrTpServico.Text := EmptyStr;

  edtVlrUnitarioServico.Value := 0;
  edtQtdeServico.Text         := '0';
  edtVlrDescServico.Value     := 0;
  edtVlrAcrescServico.Value   := 0;
  edtVlrTotalServico.Value    := 0;
end;

procedure TFrmMovimentoVenda.edtCancelarServicoClick(Sender: TObject);
begin
  inherited;
  ClearFieldsServicos;
end;

procedure TFrmMovimentoVenda.edtQtdeServicoExit(Sender: TObject);
begin
  inherited;
  CalcServico;
end;

procedure TFrmMovimentoVenda.edtVlrAcrescServicoExit(Sender: TObject);
begin
  inherited;
  CalcServico;
end;

procedure TFrmMovimentoVenda.edtVlrAcresExit(Sender: TObject);
begin
  inherited;
  CalcTotaisVenda;
end;

procedure TFrmMovimentoVenda.edtVlrDescExit(Sender: TObject);
begin
  inherited;
  CalcTotaisVenda;
end;

procedure TFrmMovimentoVenda.edtVlrDescServicoExit(Sender: TObject);
begin
  inherited;
  CalcServico;
end;

procedure TFrmMovimentoVenda.edtVlrFreteExit(Sender: TObject);
begin
  inherited;
  CalcTotaisVenda;
end;

procedure TFrmMovimentoVenda.edtVlrUnitarioServicoExit(Sender: TObject);
begin
  inherited;
  CalcServico;
end;

procedure TFrmMovimentoVenda.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  FServico.ClearField;
end;

procedure TFrmMovimentoVenda.GetController(aCadastro: iControllerVenda);
begin
  FCadastro := aCadastro;
  FServico  := aCadastro.Servico;
  FParcela  := aCadastro.Parcela;

  FServico.DataSource(DSServico);
end;

procedure TFrmMovimentoVenda.IncludeData;
begin
  if FTypeOperation <> TpDelete then begin
    FCadastro.Entidade.Id           := StrToIntDef(edtCodigo.Text,0);
    FCadastro.Entidade.Dta_emissao  := DtpEmissao.DateTime;
    FCadastro.Entidade.Id_cliente   := StrToIntDef(edtIdCliente.Text,0);
    FCadastro.Entidade.Nome_cliente := edtNomeCliente.Text;
    FCadastro.Entidade.Doc_cliente  := edtDocCliente.Text;
    FCadastro.Entidade.Fone_Cliente := edtFoneCliente.Text;
    FCadastro.Entidade.Vlr_SubTotal := edtVlrSubTotal.Value;
    FCadastro.Entidade.Vlr_Frete    := edtVlrFrete.Value;
    FCadastro.Entidade.Vlr_Desc     := edtVlrDesc.Value;
    FCadastro.Entidade.Vlr_Acres    := edtVlrAcres.Value;
    FCadastro.Entidade.Vlr_total    := edtVlrTotal.Value;
  end;
end;

procedure TFrmMovimentoVenda.IncludeRegister;
begin
  case FTypeOperation of
    TpInsert:FCadastro.Insert;
    TpUpdate:FCadastro.Update;
  end;
end;

procedure TFrmMovimentoVenda.IncludeServico;
begin
  FServico.CreateList;
  FServico.Entidade.id_servico   := StrToIntDef(edtIdServico.Text,0);
  FServico.Entidade.DescrServico := edtDescrServico.Text;
  FServico.Entidade.Vlr_total    := edtVlrTotalServico.Value;
  FServico.Entidade.Vlr_Acres    := edtVlrAcrescServico.Value;
  FServico.Entidade.Vlr_Desc     := edtVlrDescServico.Value;
  FServico.Entidade.Qtd_servico  := StrToFloatDef(edtQtdeServico.Text,0);
  FServico.Entidade.Vlr_unitario := edtVlrUnitarioServico.Value;

  FServico.InsertDataSet;
end;

procedure TFrmMovimentoVenda.OpenRegister;
begin
  inherited;
  if FTypeOperation = TpUpdate then begin
    OpenRegisterVenda;
    OpenRegisterServico;
  end;
end;

procedure TFrmMovimentoVenda.OpenRegisterServico;
begin
  FServico.Find(FCadastro.Entidade.Id);
end;

procedure TFrmMovimentoVenda.OpenRegisterVenda;
begin
  FCadastro.LocalizaEntidade;

  edtCodigo.Text       := IntToStr(FCadastro.Entidade.Id);
  dtpEmissao.Date      := FCadastro.Entidade.Dta_emissao;
  edtIDCliente.Text    := IntToStr(FCadastro.Entidade.Id_cliente);
  edtNomeCliente.Text  := FCadastro.Entidade.Nome_cliente;
  edtDocCliente.Text   := FCadastro.Entidade.Doc_cliente;
  edtFoneCliente.Text  := FCadastro.Entidade.Fone_Cliente;
  edtVlrSubTotal.Value := FCadastro.Entidade.Vlr_Subtotal;
  edtVlrFrete.Value    := FCadastro.Entidade.Vlr_Frete;
  edtVlrDesc.Value     := FCadastro.Entidade.Vlr_Desc;
  edtVlrAcres.Value    := FCadastro.Entidade.Vlr_Acres;
  edtVlrTotal.Value    := FCadastro.Entidade.Vlr_total;
end;

procedure TFrmMovimentoVenda.SeachCliente;
var
  lCliente : iControllerCliente;
begin
  lCliente := TFrmBuscaCliente.ShowBuscaCliente;

  if Assigned(lCliente) then begin
    edtIDCliente.Text    := IntToStr(lCliente.Entidade.id);
    edtNomeCliente.Text  := lCliente.Entidade.Nome;
    edtDocCliente.Text   := lCliente.Entidade.Id_documento;
    edtFoneCliente.Text  := lCliente.Entidade.Telefone;
  end;
end;

procedure TFrmMovimentoVenda.SeachServico;
var
  lServico : iControllerServico;
begin
  lServico := TFrmBuscaServico.ShowBuscaServico;

  if Assigned(lServico) then begin
    edtIdServico.Text     := IntToStr(lServico.Entidade.id);
    edtDescrServico.Text  := lServico.Entidade.descricao;

    lServico.TipoServico.Find(lServico.Entidade.Id_Tipo_Servico);

    EdtIdTpServico.Text   := IntToStr(lServico.TipoServico.Entidade.id);
    edtDescrTpServico.Text   := lServico.TipoServico.Entidade.Descricao;

    edtVlrUnitarioServico.Value := lServico.Entidade.Vlr_Venda;
    edtQtdeServico.Text         := '1';
    edtVlrDescServico.Value     := 0;
    edtVlrAcrescServico.Value   := 0;
    edtVlrTotalServico.Value    := lServico.Entidade.Vlr_Venda;
  end;
end;

class function TFrmMovimentoVenda.VendaShow(aTypeOperation: TTypeOperation;
  aCadastro: iControllerVenda): Boolean;
begin
  FrmMovimentoVenda := TFrmMovimentoVenda.Create(nil);
  try
    FrmMovimentoVenda.FTypeOperation := aTypeOperation;
    FrmMovimentoVenda.GetController(aCadastro);
    FrmMovimentoVenda.OpenRegister;
    FrmMovimentoVenda.ShowModal;
    Result := FrmMovimentoVenda.ModalResult = mrOk;
  finally
    FreeAndNil(FrmMovimentoVenda);
  end;
end;

end.
