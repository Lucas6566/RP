unit Rp.View.Movimento.OrdemServico;

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
  cxTextEdit,
  cxCurrencyEdit,
  cxGridLevel,
  cxGridCustomTableView,
  cxGridTableView,
  cxGridDBTableView,
  cxClasses,
  cxGridCustomView,
  cxGrid,
  Rp.Util.Types,
  Rp.Controller.Movimento,
  Rp.Controller.MovimentoServico,
  Rp.View.Busca.Cliente,
  Rp.Controller.Cliente,
  System.Character,
  Rp.View.Busca.Servico,
  Rp.Controller.Servico;

type
  TFrmMovimentoOrdemServico = class(TFrmBaseMovimento)
    pnlTop: TPanel;
    Label3: TLabel;
    Label1: TLabel;
    EdtCodigo: TEdit;
    DtpEmissao: TDateTimePicker;
    pnlCliente: TPanel;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    edtIdCliente: TEdit;
    edtNomeCliente: TEdit;
    edtDocCliente: TEdit;
    edtFoneCliente: TEdit;
    Panel6: TPanel;
    btnSeachCliente: TSpeedButton;
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
    Panel1: TPanel;
    pnlTotais: TPanel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label18: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    edtVlrTotal: TcxCurrencyEdit;
    edtVlrAcres: TcxCurrencyEdit;
    edtVlrDesc: TcxCurrencyEdit;
    edtVlrFrete: TcxCurrencyEdit;
    edtVlrSubTotal: TcxCurrencyEdit;
    edtQtdeItens: TEdit;
    DSServico: TDataSource;
    pnlServico: TPanel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    edtIdServico: TEdit;
    edtDescrServico: TEdit;
    edtVlrUnitarioServico: TcxCurrencyEdit;
    edtVlrTotalServico: TcxCurrencyEdit;
    edtVlrDescServico: TcxCurrencyEdit;
    edtVlrAcrescServico: TcxCurrencyEdit;
    pnlExcluirServico: TPanel;
    btnExcluirServico: TSpeedButton;
    pnlCancelarServico: TPanel;
    edtCancelarServico: TSpeedButton;
    pnlIncluirServico: TPanel;
    btnIncluir: TSpeedButton;
    Panel5: TPanel;
    btnSeachServico: TSpeedButton;
    edtQtdeServico: TEdit;
    procedure btnSeachClienteClick(Sender: TObject);
    procedure edtIdClienteKeyPress(Sender: TObject; var Key: Char);
    procedure edtNomeClienteKeyPress(Sender: TObject; var Key: Char);
    procedure btnSeachServicoClick(Sender: TObject);
    procedure edtIdServicoKeyPress(Sender: TObject; var Key: Char);
    procedure edtDescrServicoKeyPress(Sender: TObject; var Key: Char);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnConfirmClick(Sender: TObject);
    procedure edtQtdeServicoChange(Sender: TObject);
    procedure edtVlrUnitarioServicoPropertiesChange(Sender: TObject);
    procedure edtVlrDescServicoPropertiesChange(Sender: TObject);
    procedure edtVlrAcrescServicoPropertiesChange(Sender: TObject);
    procedure edtCancelarServicoClick(Sender: TObject);
    procedure btnExcluirServicoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    FOrdemServico : iControllerMovimento;
    FServico : iControllerMovimentoServico;

    procedure SetController(aOrdemServico : iControllerMovimento);

    procedure FillOutCliente(aCliente: iControllerCliente);

    procedure FillOutServico(aServico: iControllerServico);
    procedure SeachServico(const aKey : Char = #0);
    procedure IncludeServico;
    procedure ClearFieldServico;


    procedure OpenRegister;
    procedure OpenRegisterOrdemServico;
    procedure OpenRegisterServico;

    procedure CalcServico;
    procedure CalcTotalServico;
    procedure CalcTotalOrdemServico;

    procedure IncludeOrdemServico;
    procedure IncludeRegister;
  public
    class function OrdemServicoShow(aTypeOperation : TTypeOperation; aOrdemServico : iControllerMovimento ): Boolean;
  end;

var
  FrmMovimentoOrdemServico: TFrmMovimentoOrdemServico;

implementation

{$R *.dfm}

{ TFrmMovimentoOrdemServico }

procedure TFrmMovimentoOrdemServico.btnConfirmClick(Sender: TObject);
begin
  inherited;
  IncludeOrdemServico;
  IncludeRegister;
end;

procedure TFrmMovimentoOrdemServico.btnExcluirServicoClick(Sender: TObject);
begin
  inherited;
  FServico.DeleteDataSet;
  CalcTotalOrdemServico;
end;

procedure TFrmMovimentoOrdemServico.btnIncluirClick(Sender: TObject);
begin
  inherited;
  if Trim(edtIdServico.Text) = EmptyStr then
    ShowMessage('Você precisa selecionar um serviço')
  else begin
    IncludeServico;
    ClearFieldServico;
    CalcTotalServico;
  end;
end;

procedure TFrmMovimentoOrdemServico.btnSeachClienteClick(Sender: TObject);
begin
  inherited;
  FillOutCliente(TFrmBuscaCliente.ShowBuscaCliente)
end;

procedure TFrmMovimentoOrdemServico.btnSeachServicoClick(Sender: TObject);
begin
  inherited;
  SeachServico;
end;

procedure TFrmMovimentoOrdemServico.CalcServico;
begin
  edtVlrTotalServico.Value := (edtVlrUnitarioServico.Value * StrToFloatDef(edtQtdeServico.Text,0))
                              + (edtVlrAcrescServico.Value)
                              - (edtVlrDescServico.Value);
end;

procedure TFrmMovimentoOrdemServico.CalcTotalOrdemServico;
begin
  edtVlrTotal.Value := (edtVlrSubTotal.Value)
                        + (edtVlrFrete.Value)
                        + (edtVlrAcres.Value)
                        - (edtVlrDesc.Value);
end;

procedure TFrmMovimentoOrdemServico.CalcTotalServico;
begin
  edtQtdeItens.Text := DSServico.DataSet.RecordCount.ToString;

  edtVlrSubTotal.Value := 0;

  for var I := 0 to FServico.RecordCount -1 do
    edtVlrSubTotal.Value := edtVlrSubTotal.Value + FServico.Entidade(I).vlr_total;

  CalcTotalOrdemServico;
end;

procedure TFrmMovimentoOrdemServico.ClearFieldServico;
begin
  edtIdServico.Text      := EmptyStr;
  edtDescrServico.Text   := EmptyStr;

  edtVlrUnitarioServico.Value := 0;
  edtQtdeServico.Text         := '0';
  edtVlrDescServico.Value     := 0;
  edtVlrAcrescServico.Value   := 0;
  edtVlrTotalServico.Value    := 0;
end;

procedure TFrmMovimentoOrdemServico.edtCancelarServicoClick(Sender: TObject);
begin
  inherited;
  ClearFieldServico;
end;

procedure TFrmMovimentoOrdemServico.edtDescrServicoKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Key.IsLetter then begin
    SeachServico(Key);
    Key := #0;
  end;
end;

procedure TFrmMovimentoOrdemServico.edtIdClienteKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Key.IsLetter then begin
    FillOutCliente(TFrmBuscaCliente.ShowBuscaCliente('nome', Key));
    Key := #0;
  end;
end;

procedure TFrmMovimentoOrdemServico.edtIdServicoKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Key.IsLetter then begin
    SeachServico(Key);
    Key := #0;
  end;
end;

procedure TFrmMovimentoOrdemServico.edtNomeClienteKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Key.IsLetter then begin
    FillOutCliente(TFrmBuscaCliente.ShowBuscaCliente('nome', Key));
    Key := #0;
  end;
end;

procedure TFrmMovimentoOrdemServico.edtQtdeServicoChange(Sender: TObject);
begin
  inherited;
  CalcServico;
end;

procedure TFrmMovimentoOrdemServico.edtVlrAcrescServicoPropertiesChange(
  Sender: TObject);
begin
  inherited;
  CalcServico;
end;

procedure TFrmMovimentoOrdemServico.edtVlrDescServicoPropertiesChange(
  Sender: TObject);
begin
  inherited;
  CalcServico;
end;

procedure TFrmMovimentoOrdemServico.edtVlrUnitarioServicoPropertiesChange(
  Sender: TObject);
begin
  inherited;
  CalcServico;
end;

procedure TFrmMovimentoOrdemServico.FillOutServico(
  aServico: iControllerServico);
begin
  if Assigned(aServico) then begin
    edtIdServico.Text     := IntToStr(aServico.Entidade.id);
    edtDescrServico.Text  := aServico.Entidade.descricao;

    edtVlrUnitarioServico.Value := aServico.Entidade.Vlr_Venda;
    edtQtdeServico.Text         := '1';
    edtVlrDescServico.Value     := 0;
    edtVlrAcrescServico.Value   := 0;
    edtVlrTotalServico.Value    := aServico.Entidade.Vlr_Venda;
  end;
end;

procedure TFrmMovimentoOrdemServico.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  FServico.ClearField;
end;

procedure TFrmMovimentoOrdemServico.FormCreate(Sender: TObject);
begin
  inherited;
  DtpEmissao.DateTime := Now;
end;

procedure TFrmMovimentoOrdemServico.FillOutCliente(aCliente: iControllerCliente);
begin
  if Assigned(aCliente) then begin
    edtIDCliente.Text    := IntToStr(aCliente.Entidade.id);
    edtNomeCliente.Text  := aCliente.Entidade.Nome;
    edtDocCliente.Text   := aCliente.Entidade.Id_documento;
    edtFoneCliente.Text  := aCliente.Entidade.Telefone;
  end;
end;

procedure TFrmMovimentoOrdemServico.IncludeOrdemServico;
begin
  if FTypeOperation <> TpDelete then begin
    FOrdemServico.Entidade.Id            := StrToIntDef(edtCodigo.Text,0);
    FOrdemServico.Entidade.ind_movimento := 2;
    FOrdemServico.Entidade.ind_status    := 1;
    FOrdemServico.Entidade.Dta_emissao   := DtpEmissao.DateTime;
    FOrdemServico.Entidade.Id_cliente    := StrToIntDef(edtIdCliente.Text,0);
    FOrdemServico.Entidade.Nome_cliente  := edtNomeCliente.Text;
    FOrdemServico.Entidade.Doc_cliente   := edtDocCliente.Text;
    FOrdemServico.Entidade.Fone_Cliente  := edtFoneCliente.Text;
    FOrdemServico.Entidade.Vlr_SubTotal  := edtVlrSubTotal.Value;
    FOrdemServico.Entidade.Vlr_Desconto  := edtVlrDesc.Value;
    FOrdemServico.Entidade.Vlr_Acrescimo := edtVlrAcres.Value;
    FOrdemServico.Entidade.Vlr_total     := edtVlrTotal.Value;
  end;
end;

procedure TFrmMovimentoOrdemServico.IncludeRegister;
begin
  case FTypeOperation of
    TpInsert:FOrdemServico.Insert;
    TpUpdate:FOrdemServico.Update;
  end;
end;

procedure TFrmMovimentoOrdemServico.IncludeServico;
begin
  FServico.CreateNewList;
  FServico.Entidade.id_servico   := StrToIntDef(edtIdServico.Text,0);
  FServico.Entidade.DescrServico := edtDescrServico.Text;
  FServico.Entidade.Vlr_total    := edtVlrTotalServico.Value;
  FServico.Entidade.vlr_Acrescimo:= edtVlrAcrescServico.Value;
  FServico.Entidade.vlr_desconto := edtVlrDescServico.Value;
  FServico.Entidade.Qtd_servico  := StrToFloatDef(edtQtdeServico.Text,0);
  FServico.Entidade.Vlr_unitario := edtVlrUnitarioServico.Value;
  FServico.InsertDataSet;
end;

procedure TFrmMovimentoOrdemServico.OpenRegister;
begin
  if FTypeOperation = TpUpdate then begin
    OpenRegisterOrdemServico;
    OpenRegisterServico;
  end;
end;

procedure TFrmMovimentoOrdemServico.OpenRegisterOrdemServico;
begin
  FOrdemServico.LocalizaEntidade;

  edtCodigo.Text       := IntToStr(FOrdemServico.Entidade.Id);
  dtpEmissao.DateTime  := FOrdemServico.Entidade.Dta_emissao;
  edtIDCliente.Text    := IntToStr(FOrdemServico.Entidade.Id_cliente);
  edtNomeCliente.Text  := FOrdemServico.Entidade.Nome_cliente;
  edtDocCliente.Text   := FOrdemServico.Entidade.Doc_cliente;
  edtFoneCliente.Text  := FOrdemServico.Entidade.Fone_Cliente;
  edtVlrSubTotal.Value := FOrdemServico.Entidade.Vlr_Subtotal;
  edtVlrDesc.Value     := FOrdemServico.Entidade.Vlr_Desconto;
  edtVlrAcres.Value    := FOrdemServico.Entidade.Vlr_Acrescimo;
  edtVlrTotal.Value    := FOrdemServico.Entidade.Vlr_total;
end;

procedure TFrmMovimentoOrdemServico.OpenRegisterServico;
begin
  FServico.Find(FOrdemServico.Entidade.Id);                          
    
  edtQtdeItens.Text    := FServico.RecordCount.ToString;
end;

class function TFrmMovimentoOrdemServico.OrdemServicoShow(
  aTypeOperation: TTypeOperation; aOrdemServico: iControllerMovimento): Boolean;
begin
  FrmMovimentoOrdemServico := TFrmMovimentoOrdemServico.Create(nil);
  try
    FrmMovimentoOrdemServico.FTypeOperation := aTypeOperation;
    FrmMovimentoOrdemServico.SetController(aOrdemServico);
    FrmMovimentoOrdemServico.OpenRegister;
    FrmMovimentoOrdemServico.ShowModal;
    Result := FrmMovimentoOrdemServico.ModalResult = mrOk;
  finally
    FreeAndNil(FrmMovimentoOrdemServico);
  end;
end;

procedure TFrmMovimentoOrdemServico.SeachServico(const aKey : Char = #0);
begin
  FillOutServico(TFrmBuscaServico.ShowBuscaServico('descricao', aKey));
end;

procedure TFrmMovimentoOrdemServico.SetController(aOrdemServico : iControllerMovimento);
begin
  FOrdemServico := aOrdemServico;
  FServico  := FOrdemServico.Servico;

  FServico.DataSource(DSServico);
end;

end.
