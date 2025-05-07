unit Rp.Controller.VendaServico;

interface

uses
  Data.DB,
  Rp.Model.Entity.VendaServico,
  Rp.Model.Dao.Generic,
  Rp.Model.List.VendaServico,
  Rp.Model.Rest,
  System.SysUtils;

type
  iControllerVendaServico = interface
    ['{4A217C3A-6515-4EEE-88E3-3E4973C19F8B}']

    function DataSource( aDataSource: TDataSource ): iControllerVendaServico;

    function CreateList : iControllerVendaServico;

    function Find : iControllerVendaServico; overload;
    function Find (const aID : Integer ) : iControllerVendaServico; overload;
    function Insert : iControllerVendaServico;
    function InsertDataSet : iControllerVendaServico;
    function Delete : Boolean;
    function DeleteDataSet : iControllerVendaServico;
    function Update : iControllerVendaServico;
    function LocalizaEntidade : iControllerVendaServico;
    function ClearField : iControllerVendaServico;

    function Entidade : TVendaServico; overload;
    function Entidade( aIndex: Integer ) : TVendaServico; overload;
    function RecordCount : Integer;
  end;

  TControllerVendaServico = class(TInterfacedObject, iControllerVendaServico)
  private
    FEntidade : TVendaServico;
    FDAOGeneric : iDAOGeneric;
    FList : iListVendaServico;
    FDataSource : TDataSource;

  public
    constructor Create;
    destructor Destroy; override;
    class function New : iControllerVendaServico;

    function CreateList : iControllerVendaServico;

    function DataSource( aDataSource: TDataSource ): iControllerVendaServico;
    function Find : iControllerVendaServico; overload;
    function Find (const aID : Integer ) : iControllerVendaServico; overload;
    function Insert : iControllerVendaServico;
    function InsertDataSet : iControllerVendaServico;
    function Delete : Boolean;
    function DeleteDataSet : iControllerVendaServico;
    function Update : iControllerVendaServico;
    function LocalizaEntidade : iControllerVendaServico;
    function ClearField : iControllerVendaServico;

    function Entidade : TVendaServico; overload;
    function Entidade( aIndex: Integer ) : TVendaServico; overload;
    function RecordCount : Integer;
  end;

implementation

{ TControllerVendaServico }

function TControllerVendaServico.ClearField: iControllerVendaServico;
begin
  Result := Self;
  FList.ClearFiels;
end;

constructor TControllerVendaServico.Create;
begin
  FList := TListVendaServico.New;
  FDAOGeneric := TDAOGeneric.New;
  FDAOGeneric.Request(ConnRequest.Resource('vendaservico'));
end;

function TControllerVendaServico.CreateList: iControllerVendaServico;
begin
  Result := Self;
  FEntidade := TVendaServico.Create;
end;

function TControllerVendaServico.DataSource(
  aDataSource: TDataSource): iControllerVendaServico;
begin
  Result := Self;
  FDataSource := aDataSource;
  FDataSource.DataSet := FList.DataSet;
end;

function TControllerVendaServico.Delete: Boolean;
begin
  Result := FDAOGeneric.Delete(FDataSource.DataSet.FieldByName('id').AsString);
  Find;
end;

function TControllerVendaServico.DeleteDataSet: iControllerVendaServico;
begin
  FList.DataSet.Delete;
end;

destructor TControllerVendaServico.Destroy;
begin
  inherited;
end;

function TControllerVendaServico.Entidade(aIndex: Integer): TVendaServico;
begin
  Result := FList.Item(aIndex);
end;

function TControllerVendaServico.Entidade: TVendaServico;
begin
  if not Assigned(FEntidade) then
    FEntidade := TVendaServico.Create;
  Result := FEntidade;
end;

function TControllerVendaServico.Find: iControllerVendaServico;
begin
  Result := Self;
  FList.SetData(FDAOGeneric.Find);
end;

function TControllerVendaServico.Find(const aID: Integer): iControllerVendaServico;
begin
  Result := Self;
  FList.SetData(FDAOGeneric.Find(IntToStr(aID)));
end;

function TControllerVendaServico.Insert: iControllerVendaServico;
begin
  Result := Self;
  if FDAOGeneric.Insert(FList.GeneratorJson(FEntidade)) <> nil then
    Find;
end;

function TControllerVendaServico.InsertDataSet: iControllerVendaServico;
begin
  Result := Self;
  FList.AddList(FEntidade);
  FList.IncludeRegiter(FList.GeneratorJson(FEntidade));
end;

function TControllerVendaServico.LocalizaEntidade: iControllerVendaServico;
begin
  Result := Self;
  FEntidade := FList.LocalizaList;
end;

class function TControllerVendaServico.New: iControllerVendaServico;
begin
  Result := Self.Create;
end;

function TControllerVendaServico.RecordCount: Integer;
begin
  Result := FList.RecordCount;
end;

function TControllerVendaServico.Update: iControllerVendaServico;
begin
  Result := Self;
  FList.GetJson;
  if FDAOGeneric.Update(FList.GetJson) then
    Find;
end;

end.
