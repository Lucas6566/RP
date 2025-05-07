unit Rp.Model.List.VendaParcela;

interface

uses
  Rp.Model.Entity.VendaParcela,
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
  iListVendaParcela = Interface
    ['{83928C9F-2286-4132-BDC6-83BFE9EC608C}']
    function GeneratorJson( aObject : TVendaParcela ) : TJSONObject;
    function GetJson : TJSONObject;

    function SetData(aJson: TJSONValue): iListVendaParcela;
    function SetList(aJson: TJSONArray): iListVendaParcela;
    function SetDataSet(aJson: TJSONArray): iListVendaParcela;

    function LocalizaList: TVendaParcela;

    function DataSet: TDataSet;
  End;


  TListVendaParcela = Class(TInterfacedObject, iListVendaParcela)
  private
    FList : TObjectList<TVendaParcela>;
    FDataSet : TFDMemTable;
    FRecordCount : Integer;

    procedure CreateFieldsDataSet;
    function ObjectToJson( aObject : TVendaParcela ) : TJSONObject;
    function JsonToObject(aJson: TJSONObject): TVendaParcela;
  public
    constructor Create;
    destructor Destroy; override;
    class function New : iListVendaParcela;

  public
    function GeneratorJson( aObject : TVendaParcela ) : TJSONObject;
    function GetJson : TJSONObject;

    function SetData(aJson: TJSONValue): iListVendaParcela;
    function SetList(aJson: TJSONArray): iListVendaParcela;
    function SetDataSet(aJson: TJSONArray): iListVendaParcela;

    function LocalizaList: TVendaParcela;

    function DataSet: TDataSet;
  End;

implementation

{ TListVendaParcela }

function TListVendaParcela.GeneratorJson( aObject : TVendaParcela ) : TJSONObject;
begin
  Result := ObjectToJson(aObject);
end;

function TListVendaParcela.GetJson: TJSONObject;
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

function TListVendaParcela.JsonToObject(aJson: TJSONObject): TVendaParcela;
begin
  Result := TJson.JsonToObject<TVendaParcela>(aJson, []);
end;

function TListVendaParcela.LocalizaList: TVendaParcela;
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

constructor TListVendaParcela.Create;
begin
  FList := TObjectList<TVendaParcela>.Create;
  FDataSet := TFDMemTable.Create(nil);
  CreateFieldsDataSet;
end;

procedure TListVendaParcela.CreateFieldsDataSet;
begin
  FDataSet.FieldDefs.Add('id', ftInteger);
  FDataSet.FieldDefs.Add('descricao', ftString, 100);

  FDataSet.CreateDataSet;

  FDataSet.IndexFieldNames := 'id';
end;

function TListVendaParcela.DataSet: TDataSet;
begin
  Result := FDataSet;
end;

destructor TListVendaParcela.Destroy;
begin
  FList.Free;
  FDataSet.DisposeOf;
  inherited;
end;

class function TListVendaParcela.New: iListVendaParcela;
begin
  Result := Self.Create;
end;

function TListVendaParcela.ObjectToJson(aObject: TVendaParcela): TJSONObject;
var
  lObject : TVendaParcela;
begin
  lObject := aObject;
  Result := TJson.ObjectToJsonObject(lObject);
end;

function TListVendaParcela.SetData(aJson: TJSONValue): iListVendaParcela;
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

function TListVendaParcela.SetDataSet(aJson: TJSONArray): iListVendaParcela;
begin
  FDataSet.DisableControls;
  if FDataSet.FieldCount > 0 then
    FDataSet.EmptyDataSet;

  FDataSet.LoadFromJSON(aJson, False);

  FDataSet.EnableControls;

  FDataSet.Open;
end;

function TListVendaParcela.SetList(aJson: TJSONArray): iListVendaParcela;
begin
  FList.Clear;

  for var I := 0 to AJson.Count -1 do
    FList.Add(JsonToObject(aJson.Items[I] as TJSONObject));
end;

end.
