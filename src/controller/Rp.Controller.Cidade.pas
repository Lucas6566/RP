unit Rp.Controller.Cidade;

interface

uses
  Data.DB,
  Rp.Model.Entity.Cidade,
  Rp.Model.Dao.Generic,
  Rp.Model.List.Cidade,
  Rp.Model.Rest,
  Rp.Controller.Generic,
  System.Generics.Collections,
  System.JSON,
  FireDAC.Comp.Client;

type
//  iControllerCidade = interface
//    ['{4A217C3A-6515-4EEE-88E3-3E4973C19F8B}']
//
//    function DataSource( aDataSource: TDataSource ): iControllerCidade;
//    function Find : iControllerCidade; overload;
//    function Find (const aID : String ) : iControllerCidade; overload;
//    function Insert : iControllerCidade;
//    function Delete : Boolean;
//    function Update : iControllerCidade;
//    function LocalizaEntidade : iControllerCidade;
//
//    function Entidade : TCidade;
//  end;
//
//  iControllerCidades = interface
//    ['{D28F256A-5C6C-4329-81EF-50EBB458DDB4}']
//  end;

  TControllerCidade = class(TControllerGeneric<TCidade>, iControllerGeneric<TCidade>)
  protected
    procedure RequestSource; override;

  public
    constructor Create;
    destructor Destroy; override;
    class function New : iControllerGeneric<TCidade>;

    function NewEntidade: iControllerGeneric<TCidade>;
  end;

implementation

{ TControllerCidade }

constructor TControllerCidade.Create;
begin
  inherited;
end;

destructor TControllerCidade.Destroy;
begin

  inherited;
end;

class function TControllerCidade.New: iControllerGeneric<TCidade>;
begin
  Result := Self.Create;
end;

function TControllerCidade.NewEntidade: iControllerGeneric<TCidade>;
begin
  FEntidade := TCidade.Create;
end;

procedure TControllerCidade.RequestSource;
begin
  DAOGeneric.Request.Resource('cidade');
end;

end.
