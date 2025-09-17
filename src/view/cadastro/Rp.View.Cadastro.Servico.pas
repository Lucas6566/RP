unit Rp.View.Cadastro.Servico;

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
  Rp.Controller.Servico,
  Vcl.Menus,
  cxButtons;

type
  TFrmCadastroServico = class(TFrmBaseCadastro)
    Label2: TLabel;
    Label1: TLabel;
    Label3: TLabel;
    EdtDescricao: TEdit;
    EdtCodigo: TEdit;
    edtVlrVenda: TcxCurrencyEdit;
    procedure btnConfirmClick(Sender: TObject);
  private
    FCadastro : iControllerServico;

    procedure GetController( aCadastro: iControllerServico );

    procedure OpenRegister;
    procedure IncludeData;
    procedure IncludeRegister;
  public
    class function ServicoShow(aTypeOperation : TTypeOperation; aCadastro : iControllerServico ): Boolean;
  end;

var
  FrmCadastroServico: TFrmCadastroServico;

implementation


{$R *.dfm}

{ TFrmCadastroServico }

class function TFrmCadastroServico.ServicoShow(
  aTypeOperation : TTypeOperation; aCadastro : iControllerServico ): Boolean;
begin
  FrmCadastroServico := TFrmCadastroServico.Create(nil);
  try
    FrmCadastroServico.FTypeOperation := aTypeOperation;
    FrmCadastroServico.GetController(aCadastro);
    FrmCadastroServico.OpenRegister;
    FrmCadastroServico.ShowModal;
    Result := FrmCadastroServico.ModalResult = mrOk;
  finally
    FreeAndNil(FrmCadastroServico);
  end;
end;

procedure TFrmCadastroServico.btnConfirmClick(Sender: TObject);
begin
  IncludeData;
  IncludeRegister;
  inherited;
end;

procedure TFrmCadastroServico.GetController( aCadastro: iControllerServico );
begin
  FCadastro := aCadastro;
end;

procedure TFrmCadastroServico.IncludeData;
begin
  if FTypeOperation <> TpDelete then begin
  	FCadastro.Entidade.Id              := StrtoIntDef(edtCodigo.Text,0);
    FCadastro.Entidade.Descricao       := edtDescricao.Text;
    FCadastro.Entidade.Vlr_Venda       := edtVlrVenda.value;
  end;
end;

procedure TFrmCadastroServico.IncludeRegister;
begin
  case FTypeOperation of
    TpInsert:FCadastro.Insert;
    TpUpdate:FCadastro.Update;
  end;
end;

procedure TFrmCadastroServico.OpenRegister;
begin
  if FTypeOperation = TpUpdate then begin
    FCadastro.LocalizaEntidade;
    edtCodigo.Text         := IntToStr(FCadastro.Entidade.Id);
    edtDescricao.Text      := FCadastro.Entidade.Descricao;
    edtVlrVenda.value      := FCadastro.Entidade.Vlr_Venda;
  end;
end;

end.
