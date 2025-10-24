
unit Rp.Controller.Generic;

interface

uses
  Data.DB,
  System.Generics.Collections,
  Rp.Model.Dao.Generic,
  System.JSON,
  FireDAC.Comp.Client,
  Rp.Util.DataSet,
  Rp.Util.EntityJSON,
  System.StrUtils,
  System.Math;

type
  iControllerGeneric<T : Class, constructor> = interface
    ['{615DC1F9-6F12-4050-93C0-2FE6DC8B2204}']

    function Find : iControllerGeneric<T>; overload;
    function Find (const ID : String ) : iControllerGeneric<T>; overload;
    function Find (const Param, Value : String ) : iControllerGeneric<T>; overload;
    function Insert : iControllerGeneric<T>;
    function Delete : Boolean;
    function Update : iControllerGeneric<T>;
    function SetEntidade : T;

    function Entidade : T;

    function NewEntidade: iControllerGeneric<T>;

    function DataSource : TDataSource; overload;
    function DataSource( Value : TDataSource ): iControllerGeneric<T>; overload;

    function DataSet : TRpDataSet;

    function List : TList<T>; overload;
    function List ( Value: TList<T> ): iControllerGeneric<T>; overload;
  end;

  TControllerGeneric<T : class, constructor> = class(TInterfacedObject, iControllerGeneric<T>)
  private
    FDAOGeneric : iDAOGeneric;
    FList: TList<T>;
    FDataSet : TRpDataSet;
    FMemTable : TFDMemTable;
    FDataSource : TDataSource;
    FRecordCount: Integer;

    procedure JSONValueToData(JsonValue: TJsonValue);
    function EntitiesToJSONObject: TJSONObject;
  protected
    FEntidade : T;

    property DAOGeneric: iDAOGeneric read FDAOGeneric write FDAOGeneric;

    procedure RequestSource; virtual;
    procedure CreateFieldsDataSet; virtual;

  public
    constructor Create;
    destructor Destroy; override;
    class function New : iControllerGeneric<T>;

  public
    function Find : iControllerGeneric<T>; overload;
    function Find (const ID : String ) : iControllerGeneric<T>; overload;
    function Find (const Param, Value : String ) : iControllerGeneric<T>; overload;
    function Insert : iControllerGeneric<T>;
    function Delete : Boolean;
    function Update : iControllerGeneric<T>;
    function SetEntidade : T;

    function Entidade : T;
    function NewEntidade: iControllerGeneric<T>;

    function DataSource : TDataSource; overload;
    function DataSource( Value : TDataSource ): iControllerGeneric<T>; overload;

    function DataSet : TRpDataSet;

    function List : TList<T>; overload;
    function List ( Value: TList<T> ): iControllerGeneric<T>; overload;

  public
    property RecordCount: Integer read FRecordCount write FRecordCount;

  end;

implementation

uses
  DataSet.Serialize;


constructor TControllerGeneric<T>.Create;
begin
  DAOGeneric := TDAOGeneric.New;

  FDataSet := TRpDataSet.Create;

  List(TList<T>.Create);

  RequestSource;
  CreateFieldsDataSet;
end;

procedure TControllerGeneric<T>.CreateFieldsDataSet;
begin
  //Virtual
end;

function TControllerGeneric<T>.DataSet: TRpDataSet;
begin
  Result := FDataSet;
end;

function TControllerGeneric<T>.DataSource(
  Value: TDataSource): iControllerGeneric<T>;
begin
  Result := Self;
  FDataSource := Value;
  FDataSource.DataSet := DataSet;
end;

function TControllerGeneric<T>.DataSource: TDataSource;
begin
  Result := FDataSource;
end;

function TControllerGeneric<T>.Delete: Boolean;
begin
  Result := FDAOGeneric.Delete(DataSet.FieldByName('id').AsString);
  Find;
end;

destructor TControllerGeneric<T>.Destroy;
begin
  if Assigned(FEntidade) then
    FEntidade.Free;

  FList.Clear;
  FList.Free;

  DataSet.Free;
  inherited;
end;
function TControllerGeneric<T>.Entidade: T;
begin
  Result := FEntidade;
end;

function TControllerGeneric<T>.EntitiesToJSONObject: TJSONObject;
begin
  Result := nil;

  if Assigned(FEntidade) then
    Result := TEntityJSON.EntityToJSONObject(FEntidade);
end;

function TControllerGeneric<T>.Find(const Param,
  Value: String): iControllerGeneric<T>;
begin
  FDAOGeneric.Request.AddParam(Param, Value);
  Result := Find;
end;

function TControllerGeneric<T>.Find(const ID: String): iControllerGeneric<T>;
begin

end;

function TControllerGeneric<T>.Find: iControllerGeneric<T>;
begin
  JsonValueToData(FDAOGeneric.Find);
end;

function TControllerGeneric<T>.Insert: iControllerGeneric<T>;
begin
  Result := Self;
  if Assigned(FDAOGeneric.Insert(TEntityJSON.EntityToJSONObject(FEntidade))) then
    Find;
end;

procedure TControllerGeneric<T>.JsonValueToData(JsonValue: TJsonValue);
var
  JsonArray : TJSONArray;
begin
  JsonValue.TryGetValue<Integer>('records', FRecordCount);

  if JsonValue.TryGetValue<TJSONArray>('data', JsonArray) then
    DataSet.LoadData(JsonArray);
end;

function TControllerGeneric<T>.List(Value: TList<T>): iControllerGeneric<T>;
begin
  Result := Self;
  FList := Value;
end;

function TControllerGeneric<T>.List: TList<T>;
begin
  Result := FList;
end;

class function TControllerGeneric<T>.New: iControllerGeneric<T>;
begin
  Result := Self.Create;
end;

function TControllerGeneric<T>.NewEntidade: iControllerGeneric<T>;
begin
  //Virtual
end;

procedure TControllerGeneric<T>.RequestSource;
begin
  //Virtual
end;

function TControllerGeneric<T>.SetEntidade: T;
begin
  if Assigned(FEntidade) then
    FEntidade.Free;
  FEntidade := DataSet.ToObject<T>;
  Result := FEntidade;
end;

function TControllerGeneric<T>.Update: iControllerGeneric<T>;
begin
  if FDAOGeneric.Update(TEntityJSON.EntityToJSONObject(FEntidade)) then
    Find;
end;

end.
