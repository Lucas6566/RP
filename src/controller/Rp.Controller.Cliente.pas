unit Rp.Controller.Cliente;

interface

uses
  Data.DB,
  Rp.Model.Entity.Cliente,
  Rp.Model.Dao.Generic,
  Rp.Model.List.Cliente,
  Rp.Model.Rest,
  System.SysUtils, Rp.Controller.Bairro;

type
  iControllerCliente = interface
    ['{4A217C3A-6515-4EEE-88E3-3E4973C19F8B}']

    function DataSource( aDataSource: TDataSource ): iControllerCliente;
    function Find : Boolean; overload;
    function Find (aField, aValue : String) : Boolean; overload;
    function Insert : iControllerCliente;
    function Delete : Boolean;
    function Update : iControllerCliente;

    function LocalizaEntidade : iControllerCliente; overload;
    function LocalizaEntidade( aId: Integer ) : iControllerCliente; overload;

    function Entidade : TCliente;

    function Bairro : iControllerBairro;
  end;

  TControllerCliente = class(TInterfacedObject, iControllerCliente)
  private
    FEntidade : TCliente;
    FDAOGeneric : iDAOGeneric;
    FList : iListCliente;
    FDataSource : TDataSource;

    FBairro : iControllerBairro;
  public
    constructor Create;
    destructor Destroy; override;
    class function New : iControllerCliente;

    function DataSource( aDataSource: TDataSource ): iControllerCliente;
    function Find : Boolean; overload;
    function Find (aField, aValue : String) : Boolean; overload;
    function Insert : iControllerCliente;
    function Delete : Boolean;
    function Update : iControllerCliente;

    function LocalizaEntidade : iControllerCliente; overload;
    function LocalizaEntidade( aId: Integer ) : iControllerCliente; overload;

    function Entidade : TCliente;

    function Bairro : iControllerBairro;
  end;

implementation

{ TControllerCliente }

function TControllerCliente.Bairro: iControllerBairro;
begin
  if not Assigned(FBairro) then
    FBairro := TControllerBairro.New;
  Result := FBairro;
end;

constructor TControllerCliente.Create;
begin
  FList := TListCliente.New;
  FDAOGeneric := TDAOGeneric.New;
  FDAOGeneric.Request.Resource('cliente');
end;

function TControllerCliente.DataSource(
  aDataSource: TDataSource): iControllerCliente;
begin
  Result := Self;
  FDataSource := aDataSource;
  FDataSource.DataSet := FList.DataSet;
end;

function TControllerCliente.Delete: Boolean;
begin
  Result := FDAOGeneric.Delete(FDataSource.DataSet.FieldByName('id').AsString);
  Find;
end;

destructor TControllerCliente.Destroy;
begin
  inherited;
end;

function TControllerCliente.Entidade: TCliente;
begin
  if not Assigned(FEntidade) then
    FEntidade := FList.GetObject;
  Result := FEntidade;
end;

function TControllerCliente.Find(aField, aValue: String): Boolean;
begin
  FDAOGeneric.Request.AddParam(aField, aValue);
  Result := Find;
end;

function TControllerCliente.Find: Boolean;
begin
  Result := FList.SetData(FDAOGeneric.Find);
end;

function TControllerCliente.Insert: iControllerCliente;
begin
  Result := Self;
  if FDAOGeneric.Insert(FList.GeneratorJson(FEntidade)) <> nil then
    Find;
end;

function TControllerCliente.LocalizaEntidade(aId: Integer): iControllerCliente;
begin
  Result := Self;
  FEntidade := FList.LocalizaList(aId);
end;

function TControllerCliente.LocalizaEntidade: iControllerCliente;
begin
  Result := Self;
  FEntidade := FList.LocalizaList;
end;

class function TControllerCliente.New: iControllerCliente;
begin
  Result := Self.Create;
end;

function TControllerCliente.Update: iControllerCliente;
begin
  Result := Self;
  FList.GetJson;
  if FDAOGeneric.Update(FList.GetJson) then
    Find;
end;

end.
