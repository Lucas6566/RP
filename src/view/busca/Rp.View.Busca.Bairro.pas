unit Rp.View.Busca.Bairro;

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
  Rp.Controller.Bairro;

type
  TFrmBuscaBairro = class(TFrmBaseBusca)
    GridCodigo: TcxGridDBColumn;
    GridNome: TcxGridDBColumn;
    GridDocumento: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
  private
    FBairro : iControllerBairro;
  public
    class function ShowBuscaBairro: iControllerBairro;
  end;

var
  FrmBuscaBairro: TFrmBuscaBairro;

implementation

{$R *.dfm}

{ TFrmBuscaBairro }

procedure TFrmBuscaBairro.FormCreate(Sender: TObject);
begin
  inherited;
  FBairro := TControllerBairro.New;
  FBairro.DataSource(DS)
          .Find;
end;

class function TFrmBuscaBairro.ShowBuscaBairro: iControllerBairro;
begin
  FrmBuscaBairro := TFrmBuscaBairro.Create(nil);
  try
    result := nil;
    FrmBuscaBairro.ShowModal;
    if FrmBuscaBairro.ModalResult = mrOk then begin
      FrmBuscaBairro.FBairro.LocalizaEntidade;
      result := FrmBuscaBairro.FBairro;
    end;
  finally
    FreeAndNil(FrmBuscaBairro);
  end;
end;

end.
