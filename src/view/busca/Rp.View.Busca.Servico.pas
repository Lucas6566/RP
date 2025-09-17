unit Rp.View.Busca.Servico;

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
  Rp.Controller.Servico;

type
  TFrmBuscaServico = class(TFrmBaseBusca)
    GridCodigo: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
    procedure btnSeachClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    FServico : iControllerServico;
    function ShowForm: iControllerServico;

  public
    class function ShowBuscaServico: iControllerServico; overload;
    class function ShowBuscaServico(aKey, aValue: String): iControllerServico; overload;
  end;

implementation

{$R *.dfm}

{ TFrmBuscaServico }

procedure TFrmBuscaServico.btnSeachClick(Sender: TObject);
begin
  inherited;
  FServico.Find(FFieldSeach, edtSeach.Text);
end;

procedure TFrmBuscaServico.FormCreate(Sender: TObject);
begin
  inherited;
  FServico := TControllerServico.New;
  FServico.DataSource(DS);
end;

procedure TFrmBuscaServico.FormShow(Sender: TObject);
begin
  inherited;
  FServico.Find(FFieldSeach, edtSeach.Text);
end;

class function TFrmBuscaServico.ShowBuscaServico: iControllerServico;
var
  lForm: TFrmBuscaServico;
begin
  lForm := TFrmBuscaServico.Create(nil);
  try
    Result := lForm.ShowForm;
  finally
    FreeAndNil(lForm);
  end;
end;

class function TFrmBuscaServico.ShowBuscaServico(aKey,
  aValue: String): iControllerServico;
var
  lForm: TFrmBuscaServico;
begin
  lForm := TFrmBuscaServico.Create(nil);
  try
    lForm.SetFieldSeach(lForm.GridPesquisaDBTableView.GetColumnByFieldName(aKey));
    lForm.edtSeach.Text := aValue;
    Result := lForm.ShowForm;
  finally
    FreeAndNil(lForm);
  end;
end;

function TFrmBuscaServico.ShowForm: iControllerServico;
begin
  result := nil;
  ShowModal;
  if ModalResult = mrOk then begin
    FServico.LocalizaEntidade;
    result := FServico;
  end;
end;

end.
