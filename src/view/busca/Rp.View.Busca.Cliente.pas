unit Rp.View.Busca.Cliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Rp.View.Base.Busca, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator,
  dxDateRanges, dxScrollbarAnnotations, Data.DB, cxDBData, cxContainer,
  Vcl.Buttons, cxTextEdit, Vcl.StdCtrls, cxLabel, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, Vcl.ExtCtrls, Rp.Controller.Cliente;

type
  TFrmBuscaCliente = class(TFrmBaseBusca)
    GridCodigo: TcxGridDBColumn;
    GridNome: TcxGridDBColumn;
    GridDocumento: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
  private
    FCliente : iControllerCliente;
  public
    class function ShowBuscaCliente: iControllerCliente;
  end;

var
  FrmBuscaCliente: TFrmBuscaCliente;

implementation

{$R *.dfm}

{ TFrmBuscaCliente }

procedure TFrmBuscaCliente.FormCreate(Sender: TObject);
begin
  inherited;
  FCliente := TControllerCliente.New;
  FCliente.DataSource(DS)
          .Find;
end;

class function TFrmBuscaCliente.ShowBuscaCliente: iControllerCliente;
begin
  FrmBuscaCliente := TFrmBuscaCliente.Create(nil);
  try
    result := nil;
    FrmBuscaCliente.ShowModal;
    if FrmBuscaCliente.ModalResult = mrOk then begin
      FrmBuscaCliente.FCliente.LocalizaEntidade;
      result := FrmBuscaCliente.FCliente;
    end;
  finally
    FreeAndNil(FrmBuscaCliente);
  end;
end;

end.
