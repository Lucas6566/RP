unit Rp.Model.Entity.Usuario;

interface

type
  TUsuario = class
  private
    FId: Int64;
    FNome: String;
    FSenha: String;
    FLogin: String;
    procedure SetId(const aValue: Int64);
    procedure SetNome(const aValue: String);
    procedure SetLogin(const Value: String);
    procedure SetSenha(const Value: String);

  public
    constructor Create;
    destructor Destroy; override;

  published
    property id: Int64 read FId write SetId;
    property nome: String read FNome write SetNome;
    property login: String read FLogin write SetLogin;
    property senha: String read FSenha write SetSenha;
  end;

implementation

{ TUsuario }

procedure TUsuario.SetId(const aValue: Int64);
begin
  FId := aValue;
end;

procedure TUsuario.SetLogin(const Value: String);
begin
  FLogin := Value;
end;

procedure TUsuario.SetNome(const aValue: String);
begin
  FNome := aValue;
end;

procedure TUsuario.SetSenha(const Value: String);
begin
  FSenha := Value;
end;

end.
