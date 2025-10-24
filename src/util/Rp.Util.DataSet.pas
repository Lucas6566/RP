unit Rp.Util.DataSet;

interface

uses
  System.JSON,
  DataSet.Serialize,
  Data.DB,

  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,

  System.Classes;

type
  TRpDataSet = class(TFDMemTable)
  public
    constructor Create;
    destructor Destroy;

    procedure LoadData( Value: TJSONArray );
    function DataToJson: TJSONObject;
    function ToObject<T: class, constructor>: T;
  end;

implementation

uses
  REST.Json;

constructor TRpDataSet.Create;
begin
  inherited Create(nil);
end;

function TRpDataSet.DataToJson: TJSONObject;
begin
  Result := Self.ToJSONObject;
end;

destructor TRpDataSet.Destroy;
begin
  Free;
  inherited;
end;

function TRpDataSet.ToObject<T>: T;
begin
  var JSON := DataToJson;
  try
    Result := TJson.JsonToObject<T>(JSON, []);
  finally
    JSON.Free;
  end;
end;

procedure TRpDataSet.LoadData(Value: TJSONArray);
begin
  DisableControls;
  if FieldCount > 0 then
    EmptyDataSet;

  LoadFromJSON(Value, False);

  EnableControls;
  Open;
end;

end.
