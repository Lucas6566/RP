unit Rp.Util.EntityJSON;

interface

uses
  System.JSON,
  DataSet.Serialize,
  REST.Json;

type
  TEntityJSON = class
  public
    class function EntityToJSONObject(Value: TObject): TJSONObject;
  end;

implementation

{ TEntityJSON }

class function TEntityJSON.EntityToJSONObject(Value: TObject): TJSONObject;
begin
  Result := TJson.ObjectToJsonObject(Value);
end;

end.
