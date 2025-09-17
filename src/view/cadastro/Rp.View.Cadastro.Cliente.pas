unit Rp.View.Cadastro.Cliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Rp.View.Base.Cadastro, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.StdCtrls, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinBlack,
  cxTextEdit, cxCurrencyEdit, Rp.Util.Types, Rp.Controller.Cliente, cxCheckBox,
  dxToggleSwitch, Rp.Controller.Bairro, Rp.View.Busca.Bairro;

type
  TFrmCadastroCliente = class(TFrmBaseCadastro)
    PnlCadastro: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label12: TLabel;
    Label3: TLabel;
    LblCpfCnpj: TLabel;
    LblTipoPessoa: TLabel;
    EdtCodigo: TEdit;
    EdtNome: TEdit;
    edtTelefone: TEdit;
    edtEmail: TEdit;
    EdtDocumento: TEdit;
    TgSTipoPessoa: TdxToggleSwitch;
    EdtBairro: TEdit;
    EdtCep: TEdit;
    EdtCidade: TEdit;
    EdtComplemento: TEdit;
    edtEndereco: TEdit;
    EdtUf: TEdit;
    Label15: TLabel;
    Label16: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    edtCodigoBairro: TEdit;
    pnlSeachCidade: TPanel;
    btnSeachCidade: TSpeedButton;
    procedure btnConfirmClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TgSTipoPessoaClick(Sender: TObject);
    procedure btnSeachCidadeClick(Sender: TObject);
  private
    FCadastro : iControllerCliente;
    FBairro   : iControllerBairro;

    procedure GetController(aCadastro : iControllerCliente);
    procedure TipoPessoa;
    procedure OpenRegister;
    procedure OpenRegisterBairro;
    procedure IncludeData;
    procedure IncludeRegister;
    procedure SeachBairro;
  public
    class function ClienteShow(aTypeOperation : TTypeOperation; aCadastro : iControllerCliente ): Boolean;
  end;

var
  FrmCadastroCliente: TFrmCadastroCliente;

implementation


{$R *.dfm}

{ TFrmCadastroCliente }

procedure TFrmCadastroCliente.btnSeachCidadeClick(Sender: TObject);
begin
  inherited;
  SeachBairro;
end;

class function TFrmCadastroCliente.ClienteShow(
  aTypeOperation : TTypeOperation; aCadastro : iControllerCliente ): Boolean;
begin
  FrmCadastroCliente := TFrmCadastroCliente.Create(nil);
  try
    FrmCadastroCliente.FTypeOperation := aTypeOperation;
    FrmCadastroCliente.GetController(aCadastro);
    FrmCadastroCliente.OpenRegister;
    FrmCadastroCliente.ShowModal;
    Result := FrmCadastroCliente.ModalResult = mrOk;
  finally
    FreeAndNil(FrmCadastroCliente);
  end;
end;

procedure TFrmCadastroCliente.FormCreate(Sender: TObject);
begin
  inherited;
  TipoPessoa;
end;

procedure TFrmCadastroCliente.GetController(aCadastro : iControllerCliente);
begin
  FCadastro := aCadastro;
  FBairro := FCadastro.Bairro;
end;

procedure TFrmCadastroCliente.btnConfirmClick(Sender: TObject);
begin
  IncludeData;
  IncludeRegister;
  inherited;
end;

procedure TFrmCadastroCliente.IncludeData;
begin
  if FTypeOperation <> TpDelete then begin
    FCadastro.Entidade.Id           := StrToIntDef(edtCodigo.Text,0);
    FCadastro.Entidade.Nome         := edtNome.Text;
  	FCadastro.Entidade.tipo_pessoa  := tgSTipoPessoa.EditValue;
    FCadastro.Entidade.id_documento := edtDocumento.Text;
    FCadastro.Entidade.Cep          := edtCep.Text;
    FCadastro.Entidade.Endereco     := edtEndereco.Text;
    FCadastro.Entidade.id_Bairro    := StrToIntDef(edtCodigoBairro.Text,0);
    FCadastro.Entidade.Complemento  := edtComplemento.Text;
    FCadastro.Entidade.email        := edtEmail.Text;
    FCadastro.Entidade.telefone     := edtTelefone.Text;
  end;
end;

procedure TFrmCadastroCliente.IncludeRegister;
begin
  case FTypeOperation of
    TpInsert:FCadastro.Insert;
    TpUpdate:FCadastro.Update;
  end;
end;

procedure TFrmCadastroCliente.OpenRegister;
begin
  if FTypeOperation = TpUpdate then begin
    FCadastro.LocalizaEntidade;
    edtCodigo.Text          := IntToStr(FCadastro.Entidade.Id);
    edtNome.Text            := FCadastro.Entidade.Nome;
    tgSTipoPessoa.EditValue := FCadastro.Entidade.tipo_pessoa;
    edtDocumento.Text       := FCadastro.Entidade.id_documento;
    edtCep.Text             := FCadastro.Entidade.Cep;
    edtEndereco.Text        := FCadastro.Entidade.Endereco;
    edtCodigoBairro.Text    := IntToStr(FCadastro.Entidade.id_Bairro);
    edtComplemento.Text     := FCadastro.Entidade.Complemento;
    edtEmail.Text           := FCadastro.Entidade.email;
    edtTelefone.Text        := FCadastro.Entidade.telefone;

    FBairro.Find(edtCodigoBairro.Text);
    OpenRegisterBairro;
  end;
end;

procedure TFrmCadastroCliente.OpenRegisterBairro;
begin
  edtBairro.Text       := FBairro.Entidade.nome;
  FBairro.Cidade.Find(IntToStr(FBairro.Entidade.id_cidade));
  EdtCidade.Text       := FBairro.Cidade.Entidade.nome;
  edtuf.Text           := FBairro.Cidade.Entidade.uf;
end;

procedure TFrmCadastroCliente.SeachBairro;
begin
  FBairro := TFrmBuscaBairro.ShowBuscaBairro;
  if Assigned(FBairro) then begin
    edtCodigoBairro.Text := intToStr(FBairro.Entidade.id);
    OpenRegisterBairro;
  end;
end;

procedure TFrmCadastroCliente.TgSTipoPessoaClick(Sender: TObject);
begin
  inherited;
  TipoPessoa;
end;

procedure TFrmCadastroCliente.TipoPessoa;
begin
  case TgSTipoPessoa.EditingValue of
    1: LblTipoPessoa.Caption := 'Fisico';
    2: LblTipoPessoa.Caption := 'Juridico';
  end;
end;

end.
