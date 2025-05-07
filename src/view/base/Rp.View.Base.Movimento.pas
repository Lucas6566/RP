unit Rp.View.Base.Movimento;

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
  Vcl.ExtCtrls,
  Vcl.Buttons,

  Rp.View.Base,
  Rp.Util.Types,
  Rp.Controller;

type
  TFrmBaseMovimento = class(TFrmBase)
    pnlBottom: TPanel;
    btnConfirm: TSpeedButton;
    btnCancel: TSpeedButton;
    procedure btnCancelClick(Sender: TObject);
    procedure btnConfirmClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  public
    FTypeOperation: TTypeOperation;

  published
    FController : iController;

  end;

var
  FrmBaseMovimento: TFrmBaseMovimento;

implementation

{$R *.dfm}

procedure TFrmBaseMovimento.btnCancelClick(Sender: TObject);
begin
  inherited;
  ModalResult := mrCancel;
end;

procedure TFrmBaseMovimento.btnConfirmClick(Sender: TObject);
begin
  inherited;
  ModalResult := mrOk;
end;

procedure TFrmBaseMovimento.FormCreate(Sender: TObject);
begin
  inherited;
  FController := TController.New;
end;

end.
