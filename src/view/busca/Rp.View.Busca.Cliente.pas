unit Rp.View.Busca.Cliente;

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
  Rp.View.Base.Busca,
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
  Rp.Controller.Cliente;

type
  TFrmBuscaCliente = class(TFrmBaseBusca)
    GridCodigo: TcxGridDBColumn;
    GridNome: TcxGridDBColumn;
    GridDocumento: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
    procedure btnSeachClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    FCliente : iControllerCliente;
    function ShowForm: iControllerCliente;

  public
    class function ShowBuscaCliente: iControllerCliente; overload;
    class function ShowBuscaCliente(aKey, aValue: String): iControllerCliente; overload;
  end;


implementation

{$R *.dfm}

{ TFrmBuscaCliente }

procedure TFrmBuscaCliente.btnSeachClick(Sender: TObject);
begin
  inherited;
  FCliente.Find(FFieldSeach, edtSeach.Text);
end;

procedure TFrmBuscaCliente.FormCreate(Sender: TObject);
begin
  inherited;
  FCliente := TControllerCliente.New;
  FCliente.DataSource(DS)
end;

procedure TFrmBuscaCliente.FormShow(Sender: TObject);
begin
  inherited;
  FCliente.Find(FFieldSeach, edtSeach.Text);
end;

class function TFrmBuscaCliente.ShowBuscaCliente: iControllerCliente;
var
  lForm: TFrmBuscaCliente;
begin
  lForm := TFrmBuscaCliente.Create(nil);
  try
    Result := lForm.ShowForm;
  finally
    FreeAndNil(lForm);
  end;
end;

class function TFrmBuscaCliente.ShowBuscaCliente(aKey,
  aValue: String): iControllerCliente;
var
  lForm: TFrmBuscaCliente;
begin
  lForm := TFrmBuscaCliente.Create(nil);
  try
    lForm.SetFieldSeach(lForm.GridPesquisaDBTableView.GetColumnByFieldName(aKey));
    lForm.edtSeach.Text := aValue;
    Result := lForm.ShowForm;
  finally
    FreeAndNil(lForm);
  end;
end;

function TFrmBuscaCliente.ShowForm: iControllerCliente;
begin
  result := nil;
  ShowModal;
  if ModalResult = mrOk then begin
    FCliente.LocalizaEntidade;
    result := FCliente;
  end;
end;

end.
