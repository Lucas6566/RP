unit Rp.Model.Entity.TipoServico;

interface

type
  TTipoServico = class
  private
    FId: Int64;
    FDescricao: String;
    procedure SetId(const aValue: Int64);
    procedure SetDescricao(const aValue: String);

  public
    property Id: Int64 read FId write SetId;
    property Descricao: String read FDescricao write SetDescricao;
  end;

implementation

{ TTipoServico }

procedure TTipoServico.SetId(const aValue: Int64);
begin
  FId := aValue;
end;

procedure TTipoServico.SetDescricao(const aValue: String);
begin
  FDescricao := aValue;
end;

end.
