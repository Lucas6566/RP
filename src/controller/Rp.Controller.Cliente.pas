unit Rp.Controller.Cliente;

interface

uses
  Data.DB,
  Rp.Model.Entity.Cliente,
  Rp.Model.Dao.Generic,
  Rp.Model.List.Cliente,
  Rp.Model.Rest,
  System.SysUtils;

type
  iControllerCliente = interface
    ['{4A217C3A-6515-4EEE-88E3-3E4973C19F8B}']

    function DataSource( aDataSource: TDataSource ): iControllerCliente;
    function Find : iControllerCliente; overload;
    function Find (const aID : String ) : iControllerCliente; overload;
    function Insert : iControllerCliente;
    function Delete : Boolean;
    function Update : iControllerCliente;

    function LocalizaEntidade : iControllerCliente; overload;
    function LocalizaEntidade( aId: Integer ) : iControllerCliente; overload;

    function Entidade : TCliente;
  end;

  TControllerCliente = class(TInterfacedObject, iControllerCliente)
  private
    FEntidade : TCliente;
    FDAOGeneric : iDAOGeneric;
    FList : iListCliente;
    FDataSource : TDataSource;

  public
    constructor Create;
    destructor Destroy; override;
    class function New : iControllerCliente;

    function DataSource( aDataSource: TDataSource ): iControllerCliente;
    function Find : iControllerCliente; overload;
    function Find (const aID : String ) : iControllerCliente; overload;
    function Insert : iControllerCliente;
    function Delete : Boolean;
    function Update : iControllerCliente;

    function LocalizaEntidade : iControllerCliente; overload;
    function LocalizaEntidade( aId: Integer ) : iControllerCliente; overload;

    function Entidade : TCliente;
  end;

implementation

{ TControllerCliente }

constructor TControllerCliente.Create;
begin
  FList := TListCliente.New;
  FEntidade := FList.SetObject(TCliente.Create);
  FDAOGeneric := TDAOGeneric.New;
  FDAOGeneric.Request(ConnRequest.Resource('cliente'));
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
//  if Assigned(FEntidade) then
//    FEntidade.Free;
  inherited;
end;

function TControllerCliente.Entidade: TCliente;
begin
  Result := FEntidade;
end;

function TControllerCliente.Find: iControllerCliente;
begin
  Result := Self;
  FList.SetData(FDAOGeneric.Find);
end;

function TControllerCliente.Find(const aID: String): iControllerCliente;
begin
  Result := Self;
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
