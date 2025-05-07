unit Rp.Controller.Servico;

interface

uses
  Data.DB,
  Rp.Model.Entity.Servico,
  Rp.Model.Dao.Generic,
  Rp.Model.List.Servico, Rp.Model.Rest, Rp.Controller.TipoServico;

type
  iControllerServico = interface
    ['{4A217C3A-6515-4EEE-88E3-3E4973C19F8B}']

    function DataSource( aDataSource: TDataSource ): iControllerServico;
    function Find : iControllerServico; overload;
    function Find (const aID : String ) : iControllerServico; overload;
    function Insert : iControllerServico;
    function Delete : Boolean;
    function Update : iControllerServico;
    function LocalizaEntidade : iControllerServico;

    function Entidade : TServico;

    function TipoServico : iControllerTipoServico;
  end;

  TControllerServico = class(TInterfacedObject, iControllerServico)
  private
    FEntidade : TServico;
    FDAOGeneric : iDAOGeneric;
    FList : iListServico;
    FDataSource : TDataSource;

    FTipoServico : iControllerTipoServico;

  public
    constructor Create;
    destructor Destroy; override;
    class function New : iControllerServico;

    function DataSource( aDataSource: TDataSource ): iControllerServico;
    function Find : iControllerServico; overload;
    function Find (const aID : String ) : iControllerServico; overload;
    function Insert : iControllerServico;
    function Delete : Boolean;
    function Update : iControllerServico;
    function LocalizaEntidade : iControllerServico;

    function Entidade : TServico;

    function TipoServico : iControllerTipoServico;
  end;

implementation

{ TControllerServico }

constructor TControllerServico.Create;
begin
  FList := TListServico.New;
  FEntidade := FList.SetObject(TServico.Create);
  FDAOGeneric := TDAOGeneric.New;
  FDAOGeneric.Request(ConnRequest.Resource('servico'));
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
  Result := FEntidade;
end;

function TControllerServico.Find: iControllerServico;
begin
  Result := Self;
  FList.SetData(FDAOGeneric.Find);
end;

function TControllerServico.Find(const aID: String): iControllerServico;
begin
  Result := Self;
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

function TControllerServico.TipoServico: iControllerTipoServico;
begin
  if not Assigned(FTipoServico) then
    FTipoServico := TControllerTipoServico.New;
  Result := FTipoServico;
end;

function TControllerServico.Update: iControllerServico;
begin
  Result := Self;
  FList.GetJson;
  if FDAOGeneric.Update(FList.GetJson) then
    Find;
end;

end.
