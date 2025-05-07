unit Rp.View.Movimento.VendaPagamento;

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
  cxLabel,
  Vcl.StdCtrls,
  cxGridLevel,
  cxGridCustomTableView,
  cxGridCardView,
  cxGridDBCardView,
  cxClasses,
  cxGridCustomView,
  cxGridCustomLayoutView,
  cxGrid,
  Rp.Controller.Venda, Rp.Controller.VendaParcela, Rp.Controller.FormaPagamento;

type
  TFrmMovimentoVendaPagamento = class(TFrmBaseMovimento)
    pnlParcelas: TPanel;
    pnlFormaPagto: TPanel;
    pnlFiltro: TPanel;
    Panel3: TPanel;
    GridForma: TcxGrid;
    GridFormaDBCard: TcxGridDBCardView;
    GridDescricao: TcxGridDBCardViewRow;
    GridFormaLevel: TcxGridLevel;
    Panel4: TPanel;
    Panel5: TPanel;
    lblSubTotal: TLabel;
    lblVlrDesconto: TLabel;
    lblVlrAcrescimo: TLabel;
    lblRecebido: TLabel;
    lblReceber: TLabel;
    lblVlrTotal: TLabel;
    Bevel3: TBevel;
    lblVlrFrete: TLabel;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    cxLabel6: TcxLabel;
    cxLabel7: TcxLabel;
    cxLabel5: TcxLabel;
    DS: TDataSource;
    procedure btnConfirmClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    FVenda : iControllerVenda;
    FParcela : iControllerVendaParcela;
    FFormaPagamento : iControllerFormaPagamento;

    procedure OpenRegister;
    procedure IncludeData;
  public
    class function IncludePagamento( aVenda : iControllerVenda ) : Boolean;
  end;

var
  FrmMovimentoVendaPagamento: TFrmMovimentoVendaPagamento;

implementation

{$R *.dfm}

{ TFrmMovimentoVendaPagamento }

procedure TFrmMovimentoVendaPagamento.btnConfirmClick(Sender: TObject);
begin
  IncludeData;
  inherited;
end;

procedure TFrmMovimentoVendaPagamento.FormShow(Sender: TObject);
begin
  inherited;
  FParcela := FVenda.Parcela;

  FFormaPagamento := FController.FormaPagamento;
  FFormaPagamento.DataSource(DS)
                 .Find;
end;

procedure TFrmMovimentoVendaPagamento.IncludeData;
begin
  FParcela.Entidade.Id_Seg             := 1;
  FParcela.Entidade.Id_forma_pagamento := DS.DataSet.FieldByName('id').AsInteger;
  FParcela.Entidade.Vlr_pago           := FVenda.Entidade.Vlr_total;
end;

class function TFrmMovimentoVendaPagamento.IncludePagamento( aVenda : iControllerVenda ) : Boolean;
begin
  FrmMovimentoVendaPagamento := TFrmMovimentoVendaPagamento.Create(nil);
  try
    FrmMovimentoVendaPagamento.FVenda := aVenda;
    FrmMovimentoVendaPagamento.OpenRegister;
    FrmMovimentoVendaPagamento.ShowModal;
    Result := FrmMovimentoVendaPagamento.ModalResult = mrOk;
  finally
    FreeAndNil(FrmMovimentoVendaPagamento);
  end;
end;

procedure TFrmMovimentoVendaPagamento.OpenRegister;
begin
  lblSubTotal.Caption     := FormatFloat('R$ #,###,##0.00', FVenda.Entidade.Vlr_SubTotal);
  lblVlrFrete.Caption     := FormatFloat('R$ #,###,##0.00', FVenda.Entidade.Vlr_Frete);
  lblVlrDesconto.Caption  := FormatFloat('R$ #,###,##0.00', FVenda.Entidade.Vlr_Desc);
  lblVlrAcrescimo.Caption := FormatFloat('R$ #,###,##0.00', FVenda.Entidade.Vlr_Acres);
  lblVlrTotal.Caption     := FormatFloat('R$ #,###,##0.00', FVenda.Entidade.Vlr_total);

  lblReceber.Caption      := FormatFloat('R$ #,###,##0.00', 0);
  lblRecebido.Caption     := FormatFloat('R$ #,###,##0.00', FVenda.Entidade.Vlr_total);
end;

end.
