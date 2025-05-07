unit Rp.View.Busca.Servico;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Rp.View.Base.Busca, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator,
  dxDateRanges, dxScrollbarAnnotations, Data.DB, cxDBData, cxContainer,
  Vcl.Buttons, cxTextEdit, Vcl.StdCtrls, cxLabel, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, Vcl.ExtCtrls, Rp.Controller.Servico;

type
  TFrmBuscaServico = class(TFrmBaseBusca)
    GridCodigo: TcxGridDBColumn;
    GridDescricao: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
  private
    FServico : iControllerServico;
  public
    class function ShowBuscaServico: iControllerServico;
  end;

var
  FrmBuscaServico: TFrmBuscaServico;

implementation

{$R *.dfm}

{ TFrmBuscaServico }

procedure TFrmBuscaServico.FormCreate(Sender: TObject);
begin
  inherited;
  FServico := TControllerServico.New;
  FServico.DataSource(DS)
          .Find;
end;

class function TFrmBuscaServico.ShowBuscaServico: iControllerServico;
begin
  FrmBuscaServico := TFrmBuscaServico.Create(nil);
  try
    result := nil;
    FrmBuscaServico.ShowModal;
    if FrmBuscaServico.ModalResult = mrOk then begin
      FrmBuscaServico.FServico.LocalizaEntidade;
      result := FrmBuscaServico.FServico;
    end;
  finally
    FreeAndNil(FrmBuscaServico);
  end;
end;

end.
