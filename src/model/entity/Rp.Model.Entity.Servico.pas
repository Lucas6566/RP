unit Rp.Model.Entity.Servico;

interface

type
  TServico = class
  private
    FId: Int64;
    FDescricao: String;
    FVlr_Venda: Currency;

  public
    property Id: Int64 read FId write FId;
    property Descricao: String read FDescricao write FDescricao;
    property Vlr_Venda: Currency read FVlr_Venda write FVlr_Venda;
  end;

implementation

{ TServico }

end.
