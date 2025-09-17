unit Rp.Model.Dao.Generic;

interface

uses
  Datasnap.DBClient,
  Data.DB,
  //RESTRequest4D,
  Rp.Model.Rest,
  Rp.Model.List.Generic,
  System.Generics.Collections,
  REST.Json,
  System.SysUtils,
  System.JSON,
  Rp.Model.Request,
  DataSet.Serialize;

type
  iDAOGeneric = interface
    ['{78FAD1A0-3E5F-4178-A8D1-F89EA93FEA79}']
    function Request : iRequest;

    function Find : TJSONValue; overload;
    function Find (const aID : String ) : TJSONValue; overload;
    function Insert ( aObject : TJSONObject ) : TJSONValue;
    function Update ( aObject : TJSONObject ) : Boolean;
    function Delete : Boolean; overload;
    function Delete (const aID : String) : Boolean; overload;

    function Post ( aObject : TJSONObject ) : IResponse;
  end;

  TDAOGeneric = class(TInterfacedObject, iDAOGeneric)
  protected
    FRequest : iRequest;

  public
    constructor Create;
    destructor Destroy; override;
    class function New: iDAOGeneric;

    function Request : iRequest;

    function Find : TJSONValue; overload;
    function Find (const aID : String ) : TJSONValue; overload;
    function Insert( aObject : TJSONObject ) : TJSONValue;
    function Update ( aObject : TJSONObject ): Boolean;
    function Delete : Boolean; overload;
    function Delete (const aID : String) : Boolean; overload;

    function Post ( aObject : TJSONObject ) : IResponse;
  end;

implementation

{ TDAOGeneric }

constructor TDAOGeneric.Create;
begin
  FRequest := TRequest.New;
end;

function TDAOGeneric.Delete(const aID: String): Boolean;
var
  lResponse: IResponse;
begin
  lResponse := FRequest.ClearBody
              .ResourceSuffix(aID)
              .Delete;

  Result := lResponse.StatusCode = 204;
end;

function TDAOGeneric.Delete: Boolean;
var
  lResponse: IResponse;
begin
  lResponse := FRequest.ClearBody
              .ResourceSuffix(EmptyStr)
              .Delete;

  Result := lResponse.StatusCode = 204;
end;

destructor TDAOGeneric.Destroy;
begin

  inherited;
end;

function TDAOGeneric.Find(const aID: String): TJSONValue;
var
  lResponse: IResponse;
begin
  Result := nil;
  lResponse := FRequest.ClearBody
                 .ResourceSuffix(aID)
                 .Get;

  if lResponse.StatusCode = 200 then
    Result := lResponse.JSONValue;
end;

function TDAOGeneric.Find: TJSONValue;
var
  lResponse: IResponse;
begin
  Result := nil;
  lResponse := FRequest.ClearBody
                 .ResourceSuffix(EmptyStr)
                 .Get;

  if lResponse.StatusCode = 200 then
    Result := lResponse.JSONValue;

  FRequest.ClearParams;
end;

function TDAOGeneric.Insert( aObject : TJSONObject ) : TJSONValue;
var
  lResponse: IResponse;
begin
  Result := nil;
  lResponse := FRequest.ClearBody
              .AddBody(aObject)
              .ResourceSuffix(EmptyStr)
              .Post;

  if lResponse.StatusCode in [200,201,204] then
    Result := lResponse.JSONValue;
end;

class function TDAOGeneric.New: iDAOGeneric;
begin
  Result := Self.Create();
end;

function TDAOGeneric.Post(aObject: TJSONObject): IResponse;
var
  lResponse: IResponse;
begin
  lResponse := FRequest.ClearBody
              .AddBody(aObject)
              .ResourceSuffix(EmptyStr)
              .Post;

  Result := lResponse;
end;

function TDAOGeneric.Request: iRequest;
begin
  Result := FRequest;
end;

function TDAOGeneric.Update( aObject : TJSONObject ): Boolean;
var
  lResponse: IResponse;
begin
  lResponse := FRequest.ClearBody
              .AddBody(aObject)
              .ResourceSuffix(EmptyStr)
              .Put;

  Result := lResponse.StatusCode in [200,201,204];
end;

end.
