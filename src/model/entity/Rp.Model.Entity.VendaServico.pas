unit Rp.Model.Entity.VendaServico;

interface

type
  TVendaServico = class
  private
    Fid: Int64;
    FId_venda: Int64;
    FId_servico: Int64;
    Fqtd_servico: Currency;
    Fvlr_unitario: Currency;
    Fvlr_total: Currency;
    Fdescrservico: String;
    Fvlr_desc: Currency;
    Fvlr_acres: Currency;
	
  public
    property Id: Int64 read Fid write Fid;
    property Id_venda: Int64 read Fid_venda write Fid_venda;
    property Id_servico: Int64 read Fid_servico write Fid_servico;
    property descrservico: String read Fdescrservico write Fdescrservico;
    property qtd_servico: Currency read Fqtd_servico write Fqtd_servico;
    property vlr_unitario: Currency read Fvlr_unitario write Fvlr_unitario;
    property vlr_Desc: Currency read Fvlr_desc write Fvlr_desc;
    property vlr_Acres: Currency read Fvlr_acres write Fvlr_acres;
    property vlr_total: Currency read Fvlr_total write Fvlr_total;
  end;

implementation

end.
