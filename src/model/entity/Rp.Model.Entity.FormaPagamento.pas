unit Rp.Model.Entity.FormaPagamento;

interface

type
  TFormaPagamento = class
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

{ TFormaPagamento }

procedure TFormaPagamento.SetId(const aValue: Int64);
begin
  FId := aValue;
end;

procedure TFormaPagamento.SetDescricao(const aValue: String);
begin
  FDescricao := aValue;
end;

end.
