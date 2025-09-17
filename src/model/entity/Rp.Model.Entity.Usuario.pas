unit Rp.Model.Entity.Usuario;

interface

type
  TUsuario = class
  private
    FId: Int64;
    FNome: String;
    FSenha: String;
    FLogin: String;
  public
    property id: Int64 read FId write FId;
    property nome: String read FNome write FNome;
    property login: String read FLogin write FLogin;
    property senha: String read FSenha write FSenha;
  end;

implementation

end.
