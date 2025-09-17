unit Rp.Model.List.Usuario;

interface

uses
  Rp.Model.Entity.Usuario,
  System.Generics.Collections,
  System.JSON,
  REST.JSON,
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

  DataSet.Serialize;

type
  iListUsuario = Interface
    ['{83928C9F-2286-4132-BDC6-83BFE9EC608C}']
    function GeneratorJson( aObject : TUsuario ) : TJSONObject;
    function GetJson : TJSONObject;

    function SetData(aJson: TJSONValue): TUsuario;
    function SetList(aJson: TJSONArray): TUsuario;
    function SetDataSet(aJson: TJSONArray): iListUsuario;

    function LocalizaList: TUsuario;

    function DataSet: TDataSet;
  End;


  TListUsuario = Class(TInterfacedObject, iListUsuario)
  private
    FList : TObjectList<TUsuario>;
    FDataSet : TFDMemTable;
    FRecordCount : Integer;

    procedure CreateFieldsDataSet;
    function ObjectToJson( aObject : TUsuario ) : TJSONObject;
    function JsonToObject(aJson: TJSONObject): TUsuario;
  public
    constructor Create;
    destructor Destroy; override;
    class function New : iListUsuario;

  public
    function GeneratorJson( aObject : TUsuario ) : TJSONObject;
    function GetJson : TJSONObject;

    function SetData(aJson: TJSONValue): TUsuario;
    function SetList(aJson: TJSONArray): TUsuario;
    function SetDataSet(aJson: TJSONArray): iListUsuario;

    function LocalizaList: TUsuario;

    function DataSet: TDataSet;
  End;

implementation

{ TListUsuario }

function TListUsuario.GeneratorJson( aObject : TUsuario ) : TJSONObject;
begin
  Result := ObjectToJson(aObject);
end;

function TListUsuario.GetJson: TJSONObject;
begin
  Result := nil;
  for var I := 0 to FList.Count-1 do
  begin
    if FList.Items[I].id = FDataSet.FieldByName('id').AsInteger then
    begin
      Result := ObjectToJson(FList.Items[I]);
      Break;
    end;
  end;
end;

function TListUsuario.JsonToObject(aJson: TJSONObject): TUsuario;
begin
  Result := TJson.JsonToObject<TUsuario>(aJson, []);
end;

function TListUsuario.LocalizaList: TUsuario;
begin
  Result := nil;
  for var I := 0 to FList.Count-1 do
  begin
    if FList.Items[I].id = FDataSet.FieldByName('id').AsInteger then begin
      Result := FList.Items[I];
      break;
    end;
  end;
end;

constructor TListUsuario.Create;
begin
  FList := TObjectList<TUsuario>.Create;
  FDataSet := TFDMemTable.Create(nil);
  CreateFieldsDataSet;
end;

procedure TListUsuario.CreateFieldsDataSet;
begin
  FDataSet.FieldDefs.Add('id', ftInteger);
  FDataSet.FieldDefs.Add('nome', ftString, 100);
  FDataSet.FieldDefs.Add('taxa_entrega', ftFloat);
  FDataSet.FieldDefs.Add('id_cidade', ftInteger);

  FDataSet.CreateDataSet;

  FDataSet.IndexFieldNames := 'id';
end;

function TListUsuario.DataSet: TDataSet;
begin
  Result := FDataSet;
end;

destructor TListUsuario.Destroy;
begin
  FList.Free;
  FDataSet.DisposeOf;
  inherited;
end;

class function TListUsuario.New: iListUsuario;
begin
  Result := Self.Create;
end;

function TListUsuario.ObjectToJson(aObject: TUsuario): TJSONObject;
var
  lObject : TUsuario;
begin
  lObject := aObject;
  Result := TJson.ObjectToJsonObject(lObject);
end;

function TListUsuario.SetData(aJson: TJSONValue): TUsuario;
var
  lJsonArray : TJSONArray;
begin
  Result := nil;
  FRecordCount := aJson.GetValue<Integer>('records');
  if aJson.TryGetValue<TJSONArray>('data', lJsonArray) then begin
    SetDataSet(lJsonArray);
    Result := SetList(lJsonArray);
  end;
end;

function TListUsuario.SetDataSet(aJson: TJSONArray): iListUsuario;
begin
  FDataSet.DisableControls;
  if FDataSet.FieldCount > 0 then
    FDataSet.EmptyDataSet;

  FDataSet.LoadFromJSON(aJson, False);

  FDataSet.EnableControls;
  FDataSet.Open;
end;

function TListUsuario.SetList(aJson: TJSONArray): TUsuario;
begin
  FList.Clear;

  for var I := 0 to AJson.Count -1 do
    FList.Add(JsonToObject(aJson.Items[I] as TJSONObject));

  Result := FList.Last;
end;

end.
