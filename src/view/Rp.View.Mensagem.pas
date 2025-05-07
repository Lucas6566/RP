unit Rp.View.Mensagem;

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
  cxGraphics,
  cxLookAndFeels,
  cxLookAndFeelPainters,
  Vcl.Menus,
  Vcl.StdCtrls,
  cxButtons, 
  dxSkinsCore, 
  dxSkinBlack,
  dxGDIPlusClasses;

type
  TfrmMensagens = class(TForm)
    imgAviso: TImage;
    imgErro: TImage;
    imgPergunta: TImage;
    imgInformacao: TImage;
    mTexto: TMemo;
    btnConfirmar: TcxButton;
    btnYes: TcxButton;
    btnNo: TcxButton;
    procedure btnYesClick(Sender: TObject);
    procedure btnNoClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
  end;

var
  FrmMensagens: TFrmMensagens;

implementation

{$R *.dfm}

procedure TFrmMensagens.btnConfirmarClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TFrmMensagens.btnNoClick(Sender: TObject);
begin
  ModalResult := mrNo;
end;

procedure TFrmMensagens.btnYesClick(Sender: TObject);
begin
   ModalResult := mrYes;
end;

procedure TFrmMensagens.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    Perform(WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TFrmMensagens.FormShow(Sender: TObject);
begin
  Self.Top := (Screen.Height div 2) - (Self.Height div 2);
  Self.Left := (Screen.Width div 2) - (Self.Width div 2);
end;

end.
