unit Rp.Model.List.Bairro;

interface

uses
  Rp.Model.Entity.Bairro,
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
  iListBairro = Interface
    ['{83928C9F-2286-4132-BDC6-83BFE9EC608C}']
    function GeneratorJson( aObject : TBairro ) : TJSONObject;
    function GetJson : TJSONObject;

    function SetData(aJson: TJSONValue): iListBairro;
    function SetList(aJson: TJSONArray): iListBairro;
    function SetDataSet(aJson: TJSONArray): iListBairro;

    function LocalizaList: TBairro;

    function DataSet: TDataSet;
  End;


  TListBairro = Class(TInterfacedObject, iListBairro)
  private
    FList : TObjectList<TBairro>;
    FDataSet : TFDMemTable;
    FRecordCount : Integer;

    procedure CreateFieldsDataSet;
    function ObjectToJson( aObject : TBairro ) : TJSONObject;
    function JsonToObject(aJson: TJSONObject): TBairro;
  public
    constructor Create;
    destructor Destroy; override;
    class function New : iListBairro;

  public
    function GeneratorJson( aObject : TBairro ) : TJSONObject;
    function GetJson : TJSONObject;

    function SetData(aJson: TJSONValue): iListBairro;
    function SetList(aJson: TJSONArray): iListBairro;
    function SetDataSet(aJson: TJSONArray): iListBairro;

    function LocalizaList: TBairro;

    function DataSet: TDataSet;
  End;

implementation

{ TListBairro }

function TListBairro.GeneratorJson( aObject : TBairro ) : TJSONObject;
begin
  Result := ObjectToJson(aObject);
end;

function TListBairro.GetJson: TJSONObject;
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

function TListBairro.JsonToObject(aJson: TJSONObject): TBairro;
begin
  Result := TJson.JsonToObject<TBairro>(aJson, []);
end;

function TListBairro.LocalizaList: TBairro;
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

constructor TListBairro.Create;
begin
  FList := TObjectList<TBairro>.Create;
  FDataSet := TFDMemTable.Create(nil);
  CreateFieldsDataSet;
end;

procedure TListBairro.CreateFieldsDataSet;
begin
  FDataSet.FieldDefs.Add('id', ftInteger);
  FDataSet.FieldDefs.Add('nome', ftString, 100);
  FDataSet.FieldDefs.Add('taxa_entrega', ftFloat);
  FDataSet.FieldDefs.Add('id_cidade', ftInteger);

  FDataSet.CreateDataSet;

  FDataSet.IndexFieldNames := 'id';
end;

function TListBairro.DataSet: TDataSet;
begin
  Result := FDataSet;
end;

destructor TListBairro.Destroy;
begin
  FList.Free;
  FDataSet.DisposeOf;
  inherited;
end;

class function TListBairro.New: iListBairro;
begin
  Result := Self.Create;
end;

function TListBairro.ObjectToJson(aObject: TBairro): TJSONObject;
var
  lObject : TBairro;
begin
  lObject := aObject;
  Result := TJson.ObjectToJsonObject(lObject);
end;

function TListBairro.SetData(aJson: TJSONValue): iListBairro;
var
  lJsonArray : TJSONArray;
begin
  Result := nil;
  FRecordCount := aJson.GetValue<Integer>('records');
  if aJson.TryGetValue<TJSONArray>('data', lJsonArray) then begin
    SetDataSet(lJsonArray);
    SetList(lJsonArray);
  end;
end;

function TListBairro.SetDataSet(aJson: TJSONArray): iListBairro;
begin
  FDataSet.DisableControls;
  if FDataSet.FieldCount > 0 then
    FDataSet.EmptyDataSet;

  FDataSet.LoadFromJSON(aJson, False);

  FDataSet.EnableControls;
  FDataSet.Open;
end;

function TListBairro.SetList(aJson: TJSONArray): iListBairro;
begin
  FList.Clear;

  for var I := 0 to AJson.Count -1 do
    FList.Add(JsonToObject(aJson.Items[I] as TJSONObject));
end;

end.
