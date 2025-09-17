unit Rp.View.Busca.Cidade;

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
  Rp.Controller.Cidade;

type
  TFrmBuscaCidade = class(TFrmBaseBusca)
    GridCodigo: TcxGridDBColumn;
    GridNome: TcxGridDBColumn;
    GridDocumento: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
  private
    FCidade : iControllerCidade;
  public
    class function ShowBuscaCidade: iControllerCidade;
  end;

var
  FrmBuscaCidade: TFrmBuscaCidade;

implementation

{$R *.dfm}

{ TFrmBuscaCidade }

procedure TFrmBuscaCidade.FormCreate(Sender: TObject);
begin
  inherited;
  FCidade := TControllerCidade.New;
  FCidade.DataSource(DS)
          .Find;
end;

class function TFrmBuscaCidade.ShowBuscaCidade: iControllerCidade;
begin
  FrmBuscaCidade := TFrmBuscaCidade.Create(nil);
  try
    result := nil;
    FrmBuscaCidade.ShowModal;
    if FrmBuscaCidade.ModalResult = mrOk then begin
      FrmBuscaCidade.FCidade.LocalizaEntidade;
      result := FrmBuscaCidade.FCidade;
    end;
  finally
    FreeAndNil(FrmBuscaCidade);
  end;
end;

end.
