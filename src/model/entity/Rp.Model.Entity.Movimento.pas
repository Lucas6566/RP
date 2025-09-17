unit Rp.Model.Entity.Movimento;

interface

type
  TMovimento = class
  private
    Fid: Int64;
    Find_movimento: Int64;
    Fid_cliente: Int64;
    FVlr_desconto: Currency;
    Fvlr_subtotal: Currency;
    Fvlr_total: Currency;
    Fdoc_cliente: string;
    FVlr_acrescimo: Currency;
    Fnome_cliente: string;
    Fdta_emissao: TDateTime;
    Fid_usuario: Int64;
    Ffone_cliente: string;
    Find_status: Int64;

  public
    property Id: Int64 read Fid write Fid;
    property ind_movimento: Int64 read Find_movimento write Find_movimento;
    property ind_status: Int64 read Find_status write Find_status;
    property Id_cliente: Int64 read FId_cliente write FId_cliente;
    property Nome_cliente: string read FNome_cliente write FNome_cliente;
    property Doc_cliente: string read FDoc_cliente write FDoc_cliente;
    property Fone_cliente: string read FFone_cliente write FFone_cliente;
    property Id_usuario: Int64 read FId_usuario write FId_usuario;
    property Dta_emissao: TDateTime read FDta_emissao write Fdta_emissao;
    property Vlr_subtotal: Currency read FVlr_subtotal write FVlr_subtotal;
    property Vlr_desconto: Currency read FVlr_desconto write FVlr_desconto;
    property Vlr_acrescimo: Currency read FVlr_acrescimo write FVlr_acrescimo;
    property Vlr_total: Currency read FVlr_total write FVlr_total;
  end;

implementation

end.
