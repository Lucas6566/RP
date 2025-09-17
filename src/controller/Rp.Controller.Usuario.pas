unit Rp.Controller.Usuario;

interface

uses
  Data.DB,
  Rp.Model.Entity.Usuario,
  Rp.Model.Dao.Generic,
  Rp.Model.List.Usuario, 
  Rp.Model.Rest;

type
  iControllerUsuario = interface
    ['{4A217C3A-6515-4EEE-88E3-3E4973C19F8B}']

    function DataSource( aDataSource: TDataSource ): iControllerUsuario;
    function Find : iControllerUsuario; overload;
    function Find (const aID : String ) : iControllerUsuario; overload;
    function Insert : iControllerUsuario;
    function Delete : Boolean;
    function Update : iControllerUsuario;
    function LocalizaEntidade : iControllerUsuario;

    function Entidade : TUsuario;
  end;

  TControllerUsuario = class(TInterfacedObject, iControllerUsuario)
  private
    FEntidade : TUsuario;
    FDAOGeneric : iDAOGeneric;
    FList : iListUsuario;
    FDataSource : TDataSource;

  public
    constructor Create;
    destructor Destroy; override;
    class function New : iControllerUsuario;

    function DataSource( aDataSource: TDataSource ): iControllerUsuario;
    function Find : iControllerUsuario; overload;
    function Find (const aID : String ) : iControllerUsuario; overload;
    function Insert : iControllerUsuario;
    function Delete : Boolean;
    function Update : iControllerUsuario;
    function LocalizaEntidade : iControllerUsuario;

    function Entidade : TUsuario;
  end;

implementation

{ TControllerUsuario }

constructor TControllerUsuario.Create;
begin
  FList := TListUsuario.New;
  FDAOGeneric := TDAOGeneric.New;
  //FDAOGeneric.Request(ConnRequest.Resource('Usuario'));
  FDAOGeneric.Request.Resource('usuario');
end;

function TControllerUsuario.DataSource(
  aDataSource: TDataSource): iControllerUsuario;
begin
  Result := Self;
  FDataSource := aDataSource;
  FDataSource.DataSet := FList.DataSet;
end;

function TControllerUsuario.Delete: Boolean;
begin
  Result := FDAOGeneric.Delete(FDataSource.DataSet.FieldByName('id').AsString);
  Find;
end;

destructor TControllerUsuario.Destroy;
begin
  inherited;
end;

function TControllerUsuario.Entidade: TUsuario;
begin
  if not Assigned(FEntidade) then
    FEntidade := TUsuario.Create;
  Result := FEntidade;
end;

function TControllerUsuario.Find: iControllerUsuario;
begin
  Result := Self;
  FList.SetData(FDAOGeneric.Find);
end;

function TControllerUsuario.Find(const aID: String): iControllerUsuario;
begin
  Result := Self;
  FEntidade := FList.SetData(FDAOGeneric.Find(aID));
end;

function TControllerUsuario.Insert: iControllerUsuario;
begin
  Result := Self;
  if FDAOGeneric.Insert(FList.GeneratorJson(FEntidade)) <> nil then
    Find;
end;

function TControllerUsuario.LocalizaEntidade: iControllerUsuario;
begin
  Result := Self;
  FEntidade := FList.LocalizaList;
end;

class function TControllerUsuario.New: iControllerUsuario;
begin
  Result := Self.Create;
end;

function TControllerUsuario.Update: iControllerUsuario;
begin
  Result := Self;
  FList.GetJson;
  if FDAOGeneric.Update(FList.GetJson) then
    Find;
end;

end.
