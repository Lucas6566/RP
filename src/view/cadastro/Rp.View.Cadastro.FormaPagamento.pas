unit Rp.View.Cadastro.FormaPagamento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Rp.View.Base.Cadastro, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.StdCtrls, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinBlack,
  cxTextEdit, cxCurrencyEdit, Rp.Util.Types, Rp.Controller.FormaPagamento;

type
  TFrmCadastroFormaPagamento = class(TFrmBaseCadastro)
    edtCodigo: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    edtDescricao: TEdit;
    procedure btnConfirmClick(Sender: TObject);
  private
    FCadastro : iControllerFormaPagamento;

    procedure OpenRegister;
    procedure IncludeData;
    procedure IncludeRegister;
  public
    class function FormaPagamentoShow(aTypeOperation : TTypeOperation; aCadastro : iControllerFormaPagamento ): Boolean;
  end;

var
  FrmCadastroFormaPagamento: TFrmCadastroFormaPagamento;

implementation


{$R *.dfm}

{ TFrmCadastroFormaPagamento }

class function TFrmCadastroFormaPagamento.FormaPagamentoShow(
  aTypeOperation : TTypeOperation; aCadastro : iControllerFormaPagamento ): Boolean;
begin
  FrmCadastroFormaPagamento := TFrmCadastroFormaPagamento.Create(nil);
  try
    FrmCadastroFormaPagamento.FTypeOperation := aTypeOperation;
    FrmCadastroFormaPagamento.FCadastro := aCadastro;
    FrmCadastroFormaPagamento.OpenRegister;
    FrmCadastroFormaPagamento.ShowModal;
    Result := FrmCadastroFormaPagamento.ModalResult = mrOk;
  finally
    FreeAndNil(FrmCadastroFormaPagamento);
  end;
end;

procedure TFrmCadastroFormaPagamento.btnConfirmClick(Sender: TObject);
begin
  IncludeData;
  IncludeRegister;
  inherited;
end;

procedure TFrmCadastroFormaPagamento.IncludeData;
begin
  if FTypeOperation <> TpDelete then begin
    FCadastro.Entidade.Id        := StrToIntDef(edtCodigo.Text,0);
    FCadastro.Entidade.Descricao := edtDescricao.Text;
  end;
end;

procedure TFrmCadastroFormaPagamento.IncludeRegister;
begin
  case FTypeOperation of
    TpInsert:FCadastro.Insert;
    TpUpdate:FCadastro.Update;
  end;
end;

procedure TFrmCadastroFormaPagamento.OpenRegister;
begin
  if FTypeOperation = TpUpdate then begin
    FCadastro.LocalizaEntidade;
    edtCodigo.Text    := IntToStr(FCadastro.Entidade.Id);
    edtDescricao.Text := FCadastro.Entidade.Descricao;
  end;
end;

end.
