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
  Rp.Controller.Cidade,
  Rp.Model.Entity.Cidade, Rp.Controller.Generic;

type
  TFrmBuscaCidade = class(TFrmBaseBusca)
    GridCodigo: TcxGridDBColumn;
    GridNome: TcxGridDBColumn;
    GridDocumento: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
  private
    FCidade : iControllerGeneric<TCidade>;
  public
    class function ShowBuscaCidade: TCidade;
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

class function TFrmBuscaCidade.ShowBuscaCidade: TCidade;
begin
  FrmBuscaCidade := TFrmBuscaCidade.Create(nil);
  try
    result := nil;
    FrmBuscaCidade.ShowModal;
    if FrmBuscaCidade.ModalResult = mrOk then begin
      if Assigned(FrmBuscaCidade.FCidade.SetEntidade) then
        result := FrmBuscaCidade.FCidade.Entidade;
    end;
  finally
    FreeAndNil(FrmBuscaCidade);
  end;
end;

end.
