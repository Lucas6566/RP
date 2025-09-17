unit Rp.Controller.Servico;

interface

uses
  Data.DB,
  Rp.Model.Entity.Servico,
  Rp.Model.Dao.Generic,
  Rp.Model.List.Servico,
  Rp.Model.Rest;

type
  iControllerServico = interface
    ['{4A217C3A-6515-4EEE-88E3-3E4973C19F8B}']

    function DataSource( aDataSource: TDataSource ): iControllerServico;
    function Find : Boolean; overload;
    function Find (const aId : String) : Boolean; overload;
    function Find (const aField, aValue : String) : Boolean; overload;
    function Insert : iControllerServico;
    function Delete : Boolean;
    function Update : iControllerServico;
    function LocalizaEntidade : iControllerServico;

    function Entidade : TServico;
  end;

  TControllerServico = class(TInterfacedObject, iControllerServico)
  private
    FEntidade : TServico;
    FDAOGeneric : iDAOGeneric;
    FList : iListServico;
    FDataSource : TDataSource;

  public
    constructor Create;
    destructor Destroy; override;
    class function New : iControllerServico;

    function DataSource( aDataSource: TDataSource ): iControllerServico;
    function Find : Boolean; overload;
    function Find (const aId : String) : Boolean; overload;
    function Find (const aField, aValue : String) : Boolean; overload;
    function Insert : iControllerServico;
    function Delete : Boolean;
    function Update : iControllerServico;
    function LocalizaEntidade : iControllerServico;

    function Entidade : TServico;

  end;

implementation

{ TControllerServico }

constructor TControllerServico.Create;
begin
  FList := TListServico.New;
  FDAOGeneric := TDAOGeneric.New;
  FDAOGeneric.Request.Resource('servico');
end;

function TControllerServico.DataSource(
  aDataSource: TDataSource): iControllerServico;
begin
  Result := Self;
  FDataSource := aDataSource;
  FDataSource.DataSet := FList.DataSet;
end;

function TControllerServico.Delete: Boolean;
begin
  Result := FDAOGeneric.Delete(FDataSource.DataSet.FieldByName('id').AsString);
  Find;
end;

destructor TControllerServico.Destroy;
begin
  inherited;
end;

function TControllerServico.Entidade: TServico;
begin
  if not Assigned(FEntidade) then
    FEntidade := FList.Item;
  Result := FEntidade;
end;

function TControllerServico.Find(const aId: String): Boolean;
begin
  Result := FList.SetData(FDAOGeneric.Find(aID));
end;

function TControllerServico.Find(const aField, aValue: String): Boolean;
begin
  FDAOGeneric.Request.AddParam(aField, aValue);
  Result := Find;
end;

function TControllerServico.Find: Boolean;
begin
  Result := FList.SetData(FDAOGeneric.Find);
end;

function TControllerServico.Insert: iControllerServico;
begin
  Result := Self;
  if FDAOGeneric.Insert(FList.GeneratorJson(FEntidade)) <> nil then
    Find;
end;

function TControllerServico.LocalizaEntidade: iControllerServico;
begin
  Result := Self;
  FEntidade := FList.LocalizaList;
end;

class function TControllerServico.New: iControllerServico;
begin
  Result := Self.Create;
end;

function TControllerServico.Update: iControllerServico;
begin
  Result := Self;
  FList.GetJson;
  if FDAOGeneric.Update(FList.GetJson) then
    Find;
end;

end.
