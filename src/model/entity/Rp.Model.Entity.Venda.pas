unit Rp.Model.Entity.Venda;

interface

type
  TVenda = class
  private
    Fid: Int64;
    FId_cliente: Int64;
    Fvlr_desc: Currency;
    Fvlr_frete: Currency;
    Fvlr_subtotal: Currency;
    Fvlr_total: Currency;
    Fdoc_cliente: string;
    Fvlr_acres: Currency;
    Fnome_cliente: string;
    Fdta_emissao: TDateTime;
    Fid_usuario: Int64;
    Ffone_cliente: string;

  public
    property id: Int64 read Fid write Fid;
    property id_cliente: Int64 read Fid_cliente write Fid_cliente;
    property nome_cliente: string read Fnome_cliente write Fnome_cliente;
    property doc_cliente: string read Fdoc_cliente write Fdoc_cliente;
    property fone_cliente: string read Ffone_cliente write Ffone_cliente;
    property id_usuario: Int64 read Fid_usuario write Fid_usuario;
    property dta_emissao: TDateTime read Fdta_emissao write Fdta_emissao;
    property vlr_subtotal: Currency read Fvlr_subtotal write Fvlr_subtotal;
    property vlr_frete: Currency read Fvlr_frete write Fvlr_frete;
    property vlr_desc: Currency read Fvlr_desc write Fvlr_desc;
    property vlr_acres: Currency read Fvlr_acres write Fvlr_acres;
    property vlr_total: Currency read Fvlr_total write Fvlr_total;
  end;

implementation

end.
