unit Rp.View.Login;

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
  cxGraphics,
  cxControls,
  cxLookAndFeels,
  cxLookAndFeelPainters,
  cxContainer,
  cxEdit,
  dxSkinsCore,
  dxSkinBlack,
  dxGDIPlusClasses,
  cxImage,
  Vcl.Menus,
  Vcl.StdCtrls,
  cxButtons,
  cxCheckBox,
  Vcl.Imaging.pngimage,
  cxTextEdit,
  Rp.Controller.Login;

type
  TFrmLogin = class(TFrmBase)
    pnlBackgroundLogo: TPanel;
    ImgLogo: TcxImage;
    cbxLembrarSenha: TcxCheckBox;
    pnlBackgroundLogin: TPanel;
    pnlTitulo: TPanel;
    Label3: TLabel;
    pnlText: TPanel;
    Label4: TLabel;
    pnlBackgroundSenha: TPanel;
    pnlSenha: TPanel;
    pnlSenhaImg: TPanel;
    pnlBackgroundUsuario: TPanel;
    pnlUsuario: TPanel;
    pnlUsuarioImg: TPanel;
    bvlUsuarioImg: TBevel;
    imgUsuario: TImage;
    edtUsuario: TcxTextEdit;
    edtSenha: TcxTextEdit;
    bvlSenhaImg: TBevel;
    imgSenha: TImage;
    pnlLembrarSenha: TPanel;
    pnlBackgroundCancelar: TPanel;
    pnlCancelar: TPanel;
    btnCancelar: TcxButton;
    pnlBackgroundEntrar: TPanel;
    pnlEntrar: TPanel;
    btnLogin: TcxButton;
    procedure FormShow(Sender: TObject);
    procedure btnLoginClick(Sender: TObject);
  private
    procedure EfetuarLogin(aLogin, aSenha: String);
  public
    class function Login : Boolean;
  end;

var
  FrmLogin: TFrmLogin;

implementation

{$R *.dfm}

procedure TFrmLogin.btnLoginClick(Sender: TObject);
begin
  inherited;
  EfetuarLogin(edtUsuario.Text, edtSenha.Text);
end;

procedure TFrmLogin.EfetuarLogin(aLogin, aSenha: String);
var
  iLogin : iControllerLogin;
begin
  if aLogin.IsEmpty or aSenha.IsEmpty then
    ShowMessage('Login ou senha não preenchido');

  iLogin := TControllerLogin.New;

  if iLogin.Login(aLogin, aSenha) then
    ModalResult := mrOk;
end;

procedure TFrmLogin.FormShow(Sender: TObject);
begin
  inherited;
  edtUsuario.SetFocus;
end;

class function TFrmLogin.Login: Boolean;
begin
  FrmLogin := TFrmLogin.Create(nil);
  try
    FrmLogin.ShowModal;
    Result := FrmLogin.ModalResult = mrOk;
  finally
    FreeAndNil(FrmLogin);
  end;
end;

end.
