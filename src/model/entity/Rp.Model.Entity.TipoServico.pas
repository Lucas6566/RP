unit Rp.Model.Entity.TipoServico;

interface

type
  TTipoServico = class
  private
    FId: Int64;
    FDescricao: String;

  public
    property Id: Int64 read FId write FId;
    property Descricao: String read FDescricao write FDescricao;
  end;

implementation

end.
