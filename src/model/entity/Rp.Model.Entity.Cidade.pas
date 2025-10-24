unit Rp.Model.Entity.Cidade;

interface

uses
  Rp.Util.EntityJSON;

type
  TCidade = class(TObject)
  private
    FId: Int64;
    FUf: String;
    FNome: String;

  published
    property id: Int64 read FId write FId;
    property nome: String read FNome write FNome;
    property uf: String read FUf write FUf;
  end;

implementation

end.
