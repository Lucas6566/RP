unit Rp.Util.Funcoes;

interface

uses
  Rp.Util.Types,
  Rp.View.Mensagem,
  Vcl.Controls,
  System.SysUtils;

  function Mensagem(pMensagem:string; pType:TTypeMensagem = tpAviso): Boolean;

implementation

function Mensagem(pMensagem:string; pType:TTypeMensagem = tpAviso): Boolean;
var
  lMensagem : TFrmMensagens;
begin
  lMensagem := TFrmMensagens.Create(Nil);
  try
    lMensagem.imgAviso.Visible      := False;
    lMensagem.imgErro.Visible       := False;
    lMensagem.imgPergunta.Visible   := False;
    lMensagem.imgInformacao.Visible := False;
    lMensagem.btnConfirmar.Visible  := False;
    lMensagem.btnYes.Visible        := False;
    lMensagem.btnNo.Visible         := False;
    lMensagem.Caption               := 'Pergunta!';

    lMensagem.mTexto.Lines.Clear;
    lMensagem.mTexto.Lines.Text := pMensagem;
    case pType of
           tpAviso : begin
                       lMensagem.imgAviso.Visible      := True;
                       lMensagem.btnConfirmar.Visible  := True;
                       lMensagem.Caption               := 'Aviso!';
                     end;
            tpErro : begin
                       lMensagem.imgErro.Visible       := True;
                       lMensagem.btnConfirmar.Visible  := True;
                       lMensagem.Caption               := 'Erro!';
                     end;
      tpInformacao : begin
                       lMensagem.imgInformacao.Visible := True;
                       lMensagem.btnConfirmar.Visible  := True;
                       lMensagem.Caption               := 'Informação!';
                     end;
        tpPergunta : begin
                       lMensagem.imgPergunta.Visible   := True;
                       lMensagem.btnYes.Visible        := True;
                       lMensagem.btnNo.Visible         := True;
                       lMensagem.Caption               := 'Pergunta!';
                     end;
    end;

    lMensagem.ShowModal;

    Result := (lMensagem.ModalResult = MrOk) or (lMensagem.ModalResult = MrYes);

    if pType = tpErro then
      Abort;
  finally
    lMensagem.DisposeOf;
  end;
end;

end.
