unit Rp.Model.Entity.MovimentoServico;

interface

type
  TMovimentoServico = class
  private
    Fid: Int64;
    Fid_movimento: Int64;
    Find_movimento: Int64;
    Fid_servico: Int64;
    Fqtd_servico: Real;
    Fvlr_unitario: Currency;
    Fvlr_total: Currency;
    Find_status: Int64;
    Fvlr_acrescimo: Currency;
    Fvlr_desconto: Currency;
    Fdescrservico: String;

  public
    property id: Int64 read Fid write Fid;
    property id_movimento: Int64 read Fid_movimento write Fid_movimento;
    property ind_movimento: Int64 read Find_movimento write Find_movimento;
    property ind_status: Int64 read Find_status write Find_status;
    property id_servico: Int64 read Fid_servico write Fid_servico;
    property descrservico: String read Fdescrservico write Fdescrservico;
    property qtd_servico: Real read Fqtd_servico write Fqtd_servico;
    property vlr_unitario: Currency read Fvlr_unitario write Fvlr_unitario;
    property vlr_desconto: Currency read Fvlr_desconto write Fvlr_desconto;
    property vlr_acrescimo: Currency read Fvlr_acrescimo write Fvlr_acrescimo;
    property vlr_total: Currency read Fvlr_total write Fvlr_total;
  end;

implementation

end.
