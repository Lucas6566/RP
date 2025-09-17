unit Rp.View.Busca.TipoServico;

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
  Rp.Controller.TipoServico;

type
  TFrmBuscaTipoServico = class(TFrmBaseBusca)
    GridCodigo: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
  private
    FTipoServico : iControllerTipoServico;
  public
    class function ShowBuscaTipoServico: iControllerTipoServico;
  end;

var
  FrmBuscaTipoServico: TFrmBuscaTipoServico;

implementation

{$R *.dfm}

{ TFrmBuscaTipoServico }

procedure TFrmBuscaTipoServico.FormCreate(Sender: TObject);
begin
  inherited;
  FTipoServico := TControllerTipoServico.New;
  FTipoServico.DataSource(DS)
              .Find;
end;

class function TFrmBuscaTipoServico.ShowBuscaTipoServico: iControllerTipoServico;
begin
  FrmBuscaTipoServico := TFrmBuscaTipoServico.Create(nil);
  try
    result := nil;
    FrmBuscaTipoServico.ShowModal;
    if FrmBuscaTipoServico.ModalResult = mrOk then begin
      FrmBuscaTipoServico.FTipoServico.LocalizaEntidade;
      result := FrmBuscaTipoServico.FTipoServico;
    end;
  finally
    FreeAndNil(FrmBuscaTipoServico);
  end;
end;

end.
