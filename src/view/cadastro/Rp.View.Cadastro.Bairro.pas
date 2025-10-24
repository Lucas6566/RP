unit Rp.View.Cadastro.Bairro;

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
  Rp.Controller.Bairro,
  Vcl.Menus,
  cxButtons,
  Rp.Controller.Cidade,
  Rp.View.Busca.Cidade, Rp.Model.Entity.Cidade, Rp.Controller.Generic;

type
  TFrmCadastroBairro = class(TFrmBaseCadastro)
    edtCodigo: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    edtNome: TEdit;
    edtTaxaEntrega: TcxCurrencyEdit;
    Label3: TLabel;
    edtCidade: TEdit;
    Label4: TLabel;
    pnlSeachCidade: TPanel;
    btnSeachCidade: TSpeedButton;
    EdtUf: TEdit;
    Label6: TLabel;
    edtCodigoCidade: TEdit;
    procedure btnConfirmClick(Sender: TObject);
    procedure btnSeachCidadeClick(Sender: TObject);
  private
    FCadastro : iControllerBairro;
    FCidade : TCidade;

    procedure GetController(aCadastro: iControllerBairro);

    procedure IncludeData;
    procedure IncludeRegister;

    procedure SeachCidade;
  protected
    procedure OpenRegister; override;

  public
    class function BairroShow(aTypeOperation : TTypeOperation; aCadastro : iControllerBairro ): Boolean;
  end;

var
  FrmCadastroBairro: TFrmCadastroBairro;

implementation


{$R *.dfm}

{ TFrmCadastroBairro }

class function TFrmCadastroBairro.BairroShow(
  aTypeOperation : TTypeOperation; aCadastro : iControllerBairro ): Boolean;
begin
  FrmCadastroBairro := TFrmCadastroBairro.Create(nil);
  try
    FrmCadastroBairro.FTypeOperation := aTypeOperation;
    FrmCadastroBairro.GetController(aCadastro);
    FrmCadastroBairro.OpenRegister;
    FrmCadastroBairro.ShowModal;
    Result := FrmCadastroBairro.ModalResult = mrOk;
  finally
    FreeAndNil(FrmCadastroBairro);
  end;
end;

procedure TFrmCadastroBairro.btnConfirmClick(Sender: TObject);
begin
  IncludeData;
  IncludeRegister;
  inherited;
end;

procedure TFrmCadastroBairro.btnSeachCidadeClick(Sender: TObject);
begin
  inherited;
  SeachCidade;
end;

procedure TFrmCadastroBairro.GetController(aCadastro: iControllerBairro);
begin
  FCadastro := aCadastro;
end;

procedure TFrmCadastroBairro.IncludeData;
begin
  if FTypeOperation <> TpDelete then begin
    FCadastro.Entidade.Id           := StrToIntDef(edtCodigo.Text,0);
    FCadastro.Entidade.Nome         := edtNome.Text;
    FCadastro.Entidade.Taxa_entrega := edtTaxaEntrega.value;
    FCadastro.Entidade.id_cidade    := StrToIntDef(edtCodigoCidade.Text,0);
  end;
end;

procedure TFrmCadastroBairro.IncludeRegister;
begin
  case FTypeOperation of
    TpInsert:FCadastro.Insert;
    TpUpdate:FCadastro.Update;
  end;
end;

procedure TFrmCadastroBairro.OpenRegister;
begin
  if FTypeOperation = TpUpdate then begin
    FCadastro.LocalizaEntidade;
    edtCodigo.Text       := IntToStr(FCadastro.Entidade.Id);
    edtNome.Text         := FCadastro.Entidade.Nome;
    edtTaxaEntrega.value := FCadastro.Entidade.Taxa_entrega;
    edtCodigoCidade.Text := IntToStr(FCadastro.Entidade.id_cidade);

    //FCidade.Find(edtCodigoCidade.Text);
    edtCidade.Text := FCidade.nome;
  end;
end;

procedure TFrmCadastroBairro.SeachCidade;
begin
  FCidade := TFrmBuscaCidade.ShowBuscaCidade;
  if Assigned(FCidade) then begin
    edtCodigoCidade.Text := intToStr(FCidade.id);
    edtCidade.Text       := FCidade.nome;
    edtUF.Text           := FCidade.uf;
  end;
end;

end.
