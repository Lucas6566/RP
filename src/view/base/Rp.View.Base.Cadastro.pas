unit Rp.View.Base.Cadastro;

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
  Rp.View.Base,
  Vcl.ExtCtrls,
  Vcl.Buttons,
  Rp.Controller, Rp.Util.Types;

type
  TFrmBaseCadastro = class(TFrmBase)
    pnlBottom: TPanel;
    btnConfirm: TSpeedButton;
    btnCancel: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure btnConfirmClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);

  protected
    function CadastroShow(const TypeOperation : TTypeOperation): Boolean;
    procedure OpenRegister; virtual;

  public
    FTypeOperation: TTypeOperation;

  published
    FController : iController;

  end;

var
  FrmBaseCadastro: TFrmBaseCadastro;

implementation

{$R *.dfm}

procedure TFrmBaseCadastro.btnCancelClick(Sender: TObject);
begin
  inherited;
  ModalResult := mrCancel;
end;

procedure TFrmBaseCadastro.btnConfirmClick(Sender: TObject);
begin
  inherited;
  ModalResult := mrOk;
end;

function TFrmBaseCadastro.CadastroShow(
  const TypeOperation: TTypeOperation): Boolean;
begin
  FTypeOperation := TypeOperation;
  OpenRegister;
  ShowModal;
  Result := ModalResult = mrOk;
end;

procedure TFrmBaseCadastro.FormCreate(Sender: TObject);
begin
  inherited;
  FController := TController.New;
end;

procedure TFrmBaseCadastro.OpenRegister;
begin
  //
end;

end.
