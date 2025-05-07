unit Rp.View.Cadastro.TipoServico;

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

  cxGraphics,
  cxControls,
  cxLookAndFeels,
  cxLookAndFeelPainters,
  cxContainer,
  cxEdit,
  dxSkinsCore,
  dxSkinBlack,
  cxTextEdit,
  cxCurrencyEdit,

  Rp.Util.Types,
  Rp.Controller.TipoServico;

type
  TFrmCadastroTipoServico = class(TFrmBaseCadastro)
    edtCodigo: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    edtDescricao: TEdit;
    procedure btnConfirmClick(Sender: TObject);
  private
    FCadastro : iControllerTipoServico;

    procedure OpenRegister;
    procedure IncludeData;
    procedure IncludeRegister;
  public
    class function TipoServicoShow(aTypeOperation : TTypeOperation; aCadastro : iControllerTipoServico ): Boolean;
  end;

var
  FrmCadastroTipoServico: TFrmCadastroTipoServico;

implementation

{$R *.dfm}

{ TFrmCadastroTipoServico }

class function TFrmCadastroTipoServico.TipoServicoShow(
  aTypeOperation : TTypeOperation; aCadastro : iControllerTipoServico ): Boolean;
begin
  FrmCadastroTipoServico := TFrmCadastroTipoServico.Create(nil);
  try
    FrmCadastroTipoServico.FTypeOperation := aTypeOperation;
    FrmCadastroTipoServico.FCadastro := aCadastro;
    FrmCadastroTipoServico.OpenRegister;
    FrmCadastroTipoServico.ShowModal;
    Result := FrmCadastroTipoServico.ModalResult = mrOk;
  finally
    FreeAndNil(FrmCadastroTipoServico);
  end;
end;

procedure TFrmCadastroTipoServico.btnConfirmClick(Sender: TObject);
begin
  IncludeData;
  IncludeRegister;
  inherited;
end;

procedure TFrmCadastroTipoServico.IncludeData;
begin
  if FTypeOperation <> TpDelete then begin
    FCadastro.Entidade.Id        := StrToIntDef(edtCodigo.Text,0);
    FCadastro.Entidade.Descricao := edtDescricao.Text;
  end;
end;

procedure TFrmCadastroTipoServico.IncludeRegister;
begin
  case FTypeOperation of
    TpInsert:FCadastro.Insert;
    TpUpdate:FCadastro.Update;
  end;
end;

procedure TFrmCadastroTipoServico.OpenRegister;
begin
  if FTypeOperation = TpUpdate then begin
    FCadastro.LocalizaEntidade;
    edtCodigo.Text    := IntToStr(FCadastro.Entidade.Id);
    edtDescricao.Text := FCadastro.Entidade.Descricao;
  end;
end;

end.
