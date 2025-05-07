unit Rp.Controller.Bairro;

interface

uses
  Data.DB,
  Rp.Model.Entity.Bairro,
  Rp.Model.Dao.Generic,
  Rp.Model.List.Bairro, Rp.Model.Rest;

type
  iControllerBairro = interface
    ['{4A217C3A-6515-4EEE-88E3-3E4973C19F8B}']

    function DataSource( aDataSource: TDataSource ): iControllerBairro;
    function Find : iControllerBairro; overload;
    function Find (const aID : String ) : iControllerBairro; overload;
    function Insert : iControllerBairro;
    function Delete : Boolean;
    function Update : iControllerBairro;
    function LocalizaEntidade : iControllerBairro;

    function Entidade : TBairro;
  end;

  TControllerBairro = class(TInterfacedObject, iControllerBairro)
  private
    FEntidade : TBairro;
    FDAOGeneric : iDAOGeneric;
    FList : iListBairro;
    FDataSource : TDataSource;

  public
    constructor Create;
    destructor Destroy; override;
    class function New : iControllerBairro;

    function DataSource( aDataSource: TDataSource ): iControllerBairro;
    function Find : iControllerBairro; overload;
    function Find (const aID : String ) : iControllerBairro; overload;
    function Insert : iControllerBairro;
    function Delete : Boolean;
    function Update : iControllerBairro;
    function LocalizaEntidade : iControllerBairro;

    function Entidade : TBairro;
  end;

implementation

{ TControllerBairro }

constructor TControllerBairro.Create;
begin
  FEntidade := TBairro.Create;
  FList := TListBairro.New;
  FDAOGeneric := TDAOGeneric.New;
  FDAOGeneric.Request(ConnRequest.Resource('bairro'));
end;

function TControllerBairro.DataSource(
  aDataSource: TDataSource): iControllerBairro;
begin
  Result := Self;
  FDataSource := aDataSource;
  FDataSource.DataSet := FList.DataSet;
end;

function TControllerBairro.Delete: Boolean;
begin
  Result := FDAOGeneric.Delete(FDataSource.DataSet.FieldByName('id').AsString);
  Find;
end;

destructor TControllerBairro.Destroy;
begin
  FEntidade.Free;
  inherited;
end;

function TControllerBairro.Entidade: TBairro;
begin
  Result := FEntidade;
end;

function TControllerBairro.Find: iControllerBairro;
begin
  Result := Self;
  FList.SetData(FDAOGeneric.Find);
end;

function TControllerBairro.Find(const aID: String): iControllerBairro;
begin
  Result := Self;
end;

function TControllerBairro.Insert: iControllerBairro;
begin
  Result := Self;
  if FDAOGeneric.Insert(FList.GeneratorJson(FEntidade)) <> nil then
    Find;
end;

function TControllerBairro.LocalizaEntidade: iControllerBairro;
begin
  Result := Self;
  FEntidade := FList.LocalizaList;
end;

class function TControllerBairro.New: iControllerBairro;
begin
  Result := Self.Create;
end;

function TControllerBairro.Update: iControllerBairro;
begin
  Result := Self;
  FList.GetJson;
  if FDAOGeneric.Update(FList.GetJson) then
    Find;
end;

end.
