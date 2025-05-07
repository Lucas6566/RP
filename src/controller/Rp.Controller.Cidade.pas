unit Rp.Controller.Cidade;

interface

uses
  Data.DB,
  Rp.Model.Entity.Cidade,
  Rp.Model.Dao.Generic,
  Rp.Model.List.Cidade, Rp.Model.Rest;

type
  iControllerCidade = interface
    ['{4A217C3A-6515-4EEE-88E3-3E4973C19F8B}']

    function DataSource( aDataSource: TDataSource ): iControllerCidade;
    function Find : iControllerCidade; overload;
    function Find (const aID : String ) : iControllerCidade; overload;
    function Insert : iControllerCidade;
    function Delete : Boolean;
    function Update : iControllerCidade;
    function LocalizaEntidade : iControllerCidade;

    function Entidade : TCidade;
  end;

  TControllerCidade = class(TInterfacedObject, iControllerCidade)
  private
    FEntidade : TCidade;
    FDAOGeneric : iDAOGeneric;//<TCidade>;
    FList : iListCidade;
    FDataSource : TDataSource;

  public
    constructor Create;
    destructor Destroy; override;
    class function New : iControllerCidade;

    function DataSource( aDataSource: TDataSource ): iControllerCidade;
    function Find : iControllerCidade; overload;
    function Find (const aID : String ) : iControllerCidade; overload;
    function Insert : iControllerCidade;
    function Delete : Boolean;
    function Update : iControllerCidade;
    function LocalizaEntidade : iControllerCidade;

    function Entidade : TCidade;
  end;

implementation

{ TControllerCidade }

constructor TControllerCidade.Create;
begin
  FEntidade := TCidade.Create;
  FList := TListCidade.New;
  FDAOGeneric := TDAOGeneric.New;
  FDAOGeneric.Request(ConnRequest.Resource('cidade'));
end;

function TControllerCidade.DataSource(
  aDataSource: TDataSource): iControllerCidade;
begin
  Result := Self;
  FDataSource := aDataSource;
  FDataSource.DataSet := FList.DataSet;
end;

function TControllerCidade.Delete: Boolean;
begin
  Result := FDAOGeneric.Delete(FDataSource.DataSet.FieldByName('id').AsString);
  Find;
end;

destructor TControllerCidade.Destroy;
begin
  FEntidade.Free;
  inherited;
end;

function TControllerCidade.Entidade: TCidade;
begin
  Result := FEntidade;
end;

function TControllerCidade.Find: iControllerCidade;
begin
  Result := Self;
  FList.SetData(FDAOGeneric.Find);
end;

function TControllerCidade.Find(const aID: String): iControllerCidade;
begin
  Result := Self;
end;

function TControllerCidade.Insert: iControllerCidade;
begin
  Result := Self;
  if FDAOGeneric.Insert(FList.GeneratorJson(FEntidade)) <> nil then
    Find;
end;

function TControllerCidade.LocalizaEntidade: iControllerCidade;
begin
  Result := Self;
  FEntidade := FList.LocalizaList;
end;

class function TControllerCidade.New: iControllerCidade;
begin
  Result := Self.Create;
end;

function TControllerCidade.Update: iControllerCidade;
begin
  Result := Self;
  FList.GetJson;
  if FDAOGeneric.Update(FList.GetJson) then
    Find;
end;

end.
