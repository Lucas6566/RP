unit Rp.View.Cadastro.Cidade;

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
  Rp.View.Base.Cadastro,
  Vcl.Buttons,
  Vcl.ExtCtrls,
  Vcl.StdCtrls,
  Rp.Util.Types,
  Rp.Controller.Cidade,
  Rp.Model.Entity.Cidade,
  Rp.Controller.Generic;

type
  TFrmCadastroCidade = class(TFrmBaseCadastro)
    edtCodigo: TEdit;
    Label1: TLabel;
    edtNome: TEdit;
    Label2: TLabel;
    edtUf: TEdit;
    Label3: TLabel;
    procedure btnConfirmClick(Sender: TObject);
  private
    FCadastro : iControllerGeneric<TCidade>;

    procedure OpenRegister; override;
    procedure IncludeData;
    procedure IncludeRegister;
  public
    class function CidadeShow(TypeOperation : TTypeOperation; Cadastro : iControllerGeneric<TCidade> ): Boolean;
  end;

implementation


{$R *.dfm}

{ TFrmCadastroCidade }

procedure TFrmCadastroCidade.btnConfirmClick(Sender: TObject);
begin
  IncludeData;
  IncludeRegister;
  inherited;
end;

class function TFrmCadastroCidade.CidadeShow(
  TypeOperation : TTypeOperation; Cadastro : iControllerGeneric<TCidade> ): Boolean;
begin
  var Form := TFrmCadastroCidade.Create(nil);
  try
    Form.FCadastro := Cadastro;

    Result := Form.CadastroShow(TypeOperation);
  finally
    FreeAndNil(Form);
  end;
end;

procedure TFrmCadastroCidade.IncludeData;
begin
  if FTypeOperation <> TpDelete then begin
    FCadastro.Entidade.Id := StrToIntDef(edtCodigo.Text,0);
    FCadastro.Entidade.Nome := edtNome.Text;
    FCadastro.Entidade.Uf := edtUf.Text;
  end;
end;

procedure TFrmCadastroCidade.IncludeRegister;
begin
  case FTypeOperation of
    TpInsert:FCadastro.Insert;
    TpUpdate:FCadastro.Update;
  end;
end;

procedure TFrmCadastroCidade.OpenRegister;
begin
  if FTypeOperation = TpUpdate then
  begin
    FCadastro.SetEntidade;
    edtCodigo.Text := IntToStr(FCadastro.Entidade.Id);
    edtNome.Text := FCadastro.Entidade.Nome;
    edtUf.Text := FCadastro.Entidade.Uf;
  end
  else
    FCadastro.NewEntidade;
end;

end.
