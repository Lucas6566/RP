unit Rp.Controller.TipoServico;

interface

uses
  Data.DB,
  Rp.Model.Entity.TipoServico,
  Rp.Model.Dao.Generic,
  Rp.Model.List.TipoServico,
  Rp.Model.Rest,
  System.SysUtils;

type
  iControllerTipoServico = interface
    ['{4A217C3A-6515-4EEE-88E3-3E4973C19F8B}']

    function DataSource( aDataSource: TDataSource ): iControllerTipoServico;
    function Find : iControllerTipoServico; overload;
    function Find (const aID : Integer ) : iControllerTipoServico; overload;
    function Insert : iControllerTipoServico;
    function Delete : Boolean;
    function Update : iControllerTipoServico;
    function LocalizaEntidade : iControllerTipoServico;

    function Entidade : TTipoServico;
  end;

  TControllerTipoServico = class(TInterfacedObject, iControllerTipoServico)
  private
    FEntidade : TTipoServico;
    FDAOGeneric : iDAOGeneric;
    FList : iListTipoServico;
    FDataSource : TDataSource;

  public
    constructor Create;
    destructor Destroy; override;
    class function New : iControllerTipoServico;

    function DataSource( aDataSource: TDataSource ): iControllerTipoServico;
    function Find : iControllerTipoServico; overload;
    function Find (const aID : Integer ) : iControllerTipoServico; overload;
    function Insert : iControllerTipoServico;
    function Delete : Boolean;
    function Update : iControllerTipoServico;
    function LocalizaEntidade : iControllerTipoServico;

    function Entidade : TTipoServico;
  end;

implementation

{ TControllerTipoServico }

constructor TControllerTipoServico.Create;
begin
  FList := TListTipoServico.New;
  FEntidade := FList.SetObject(TTipoServico.Create);
  FDAOGeneric := TDAOGeneric.New;
  FDAOGeneric.Request(ConnRequest.Resource('tiposervico'));
end;

function TControllerTipoServico.DataSource(
  aDataSource: TDataSource): iControllerTipoServico;
begin
  Result := Self;
  FDataSource := aDataSource;
  FDataSource.DataSet := FList.DataSet;
end;

function TControllerTipoServico.Delete: Boolean;
begin
  Result := FDAOGeneric.Delete(FDataSource.DataSet.FieldByName('id').AsString);
  Find;
end;

destructor TControllerTipoServico.Destroy;
begin

  inherited;
end;

function TControllerTipoServico.Entidade: TTipoServico;
begin
  Result := FEntidade;
end;

function TControllerTipoServico.Find: iControllerTipoServico;
begin
  Result := Self;
  FList.SetData(FDAOGeneric.Find);
end;

function TControllerTipoServico.Find(const aID: Integer): iControllerTipoServico;
begin
  Result := Self;
  FEntidade := FList.SetData(FDAOGeneric.Find(IntToStr(aID)));
end;

function TControllerTipoServico.Insert: iControllerTipoServico;
begin
  Result := Self;
  if FDAOGeneric.Insert(FList.GeneratorJson(FEntidade)) <> nil then
    Find;
end;

function TControllerTipoServico.LocalizaEntidade: iControllerTipoServico;
begin
  Result := Self;
  FEntidade := FList.LocalizaList;
end;

class function TControllerTipoServico.New: iControllerTipoServico;
begin
  Result := Self.Create;
end;

function TControllerTipoServico.Update: iControllerTipoServico;
begin
  Result := Self;
  FList.GetJson;
  if FDAOGeneric.Update(FList.GetJson) then
    Find;
end;

end.
