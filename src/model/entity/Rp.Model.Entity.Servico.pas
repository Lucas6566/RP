unit Rp.Model.Entity.Servico;

interface

type
  TServico = class
  private
    FId: Int64;
    FDescricao: String;
    FId_Tipo_Servico: Int64;
    FVlr_Venda: Currency;

  public
    property Id: Int64 read FId write FId;
    property Descricao: String read FDescricao write FDescricao;
    property Vlr_Venda: Currency read FVlr_Venda write FVlr_Venda;
    property Id_Tipo_Servico: Int64 read FId_Tipo_Servico write FId_Tipo_Servico;
  end;

implementation

{ TServico }

end.
