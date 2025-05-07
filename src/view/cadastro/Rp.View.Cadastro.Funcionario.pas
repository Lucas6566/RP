unit Rp.View.Cadastro.Funcionario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Rp.View.Base.Cadastro, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.StdCtrls, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinBlack,
  cxTextEdit, cxCurrencyEdit, Rp.Util.Types, Rp.Controller.Funcionario;

type
  TFrmCadastroFuncionario = class(TFrmBaseCadastro)
    edtCodigo: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    edtNome: TEdit;
    Label3: TLabel;
    edtFuncao: TEdit;
    procedure btnConfirmClick(Sender: TObject);
  private
    FCadastro : iControllerFuncionario;

    procedure OpenRegister;
    procedure IncludeData;
    procedure IncludeRegister;
  public
    class function FuncionarioShow(aTypeOperation : TTypeOperation; aCadastro : iControllerFuncionario ): Boolean;
  end;

var
  FrmCadastroFuncionario: TFrmCadastroFuncionario;

implementation


{$R *.dfm}

{ TFrmCadastroFuncionario }

class function TFrmCadastroFuncionario.FuncionarioShow(
  aTypeOperation : TTypeOperation; aCadastro : iControllerFuncionario ): Boolean;
begin
  FrmCadastroFuncionario := TFrmCadastroFuncionario.Create(nil);
  try
    FrmCadastroFuncionario.FTypeOperation := aTypeOperation;
    FrmCadastroFuncionario.FCadastro := aCadastro;
    FrmCadastroFuncionario.OpenRegister;
    FrmCadastroFuncionario.ShowModal;
    Result := FrmCadastroFuncionario.ModalResult = mrOk;
  finally
    FreeAndNil(FrmCadastroFuncionario);
  end;
end;

procedure TFrmCadastroFuncionario.btnConfirmClick(Sender: TObject);
begin
  IncludeData;
  IncludeRegister;
  inherited;
end;

procedure TFrmCadastroFuncionario.IncludeData;
begin
  if FTypeOperation <> TpDelete then begin
    FCadastro.Entidade.Id     := StrToIntDef(edtCodigo.Text,0);
    FCadastro.Entidade.Nome   := edtNome.Text;
    FCadastro.Entidade.Funcao := edtFuncao.Text;
  end;
end;

procedure TFrmCadastroFuncionario.IncludeRegister;
begin
  case FTypeOperation of
    TpInsert:FCadastro.Insert;
    TpUpdate:FCadastro.Update;
  end;
end;

procedure TFrmCadastroFuncionario.OpenRegister;
begin
  if FTypeOperation = TpUpdate then begin
    FCadastro.LocalizaEntidade;
    edtCodigo.Text := IntToStr(FCadastro.Entidade.Id);
    edtNome.Text   := FCadastro.Entidade.Nome;
    edtFuncao.Text := FCadastro.Entidade.Funcao;
  end;
end;

end.
