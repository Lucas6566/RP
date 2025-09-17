unit Rp.Model.Entity.Cliente;

interface

type
  TCliente = class
  private
    Fid: Int64;
    FNome: string;
    FTipo_Pessoa: string;
    FId_Documento: string;
    FTelefone: string;
    FEmail: string;
    FSexo: string;
    FEndereco: string;
    FCEP: string;
    FComplemento: string;
    FId_Bairro: Int64;

  public
    property Id: Int64 read FId write FId;
    property Nome: string read FNome write FNome;
    property Tipo_pessoa: string read FTipo_Pessoa write FTipo_Pessoa;
    property Id_documento: string read FId_Documento write FId_Documento;
    property Telefone: string read FTelefone write FTelefone;
    property Email: string read FEmail write FEmail;
    property Sexo: string read FSexo write FSexo;
    property Endereco: string read FEndereco write FEndereco;
    property Cep: string read FCEP write FCEP;
    property Complemento: string read FComplemento write FComplemento;
    property Id_bairro: Int64 read FId_Bairro write FId_Bairro;
  end;

implementation

end.
