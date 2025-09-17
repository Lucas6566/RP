unit Rp.Model.List.Movimento;

interface

uses
  Rp.Model.Entity.Movimento,
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

  DataSet.Serialize,
  System.SysUtils;

type
  iListMovimento = Interface
    ['{83928C9F-2286-4132-BDC6-83BFE9EC608C}']
    function GeneratorJson( aObject : TMovimento ) : TJSONObject;
    function GetJson : TJSONObject;

    function SetData(aJson: TJSONValue): iListMovimento;
    function SetList(aJson: TJSONArray): iListMovimento;
    function SetDataSet(aJson: TJSONArray): iListMovimento;

    function LocalizaList: TMovimento;

    function DataSet: TDataSet;
    function LastItem : TMovimento;
    function Item: TMovimento;
  End;


  TListMovimento = Class(TInterfacedObject, iListMovimento)
  private
    FList : TObjectList<TMovimento>;
    FDataSet : TFDMemTable;
    FRecordCount : Integer;

    procedure CreateFieldsDataSet;
    function ObjectToJson( aObject : TMovimento ) : TJSONObject;
    function JsonToObject(aJson: TJSONObject): TMovimento;
  public
    constructor Create;
    destructor Destroy; override;
    class function New : iListMovimento;

  public
    function GeneratorJson( aObject : TMovimento ) : TJSONObject;
    function GetJson : TJSONObject;

    function SetData(aJson: TJSONValue): iListMovimento;
    function SetList(aJson: TJSONArray): iListMovimento;
    function SetDataSet(aJson: TJSONArray): iListMovimento;

    function LocalizaList: TMovimento;

    function DataSet: TDataSet;
    function LastItem : TMovimento;
    function Item: TMovimento;
  End;

implementation

{ TListMovimento }

function TListMovimento.GeneratorJson( aObject : TMovimento ) : TJSONObject;
begin
  Result := ObjectToJson(aObject);
end;

function TListMovimento.GetJson: TJSONObject;
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

function TListMovimento.Item: TMovimento;
begin
  if FList.Count = 0 then
    FList.Add(TMovimento.Create);
  Result := FList.Last;
end;

function TListMovimento.JsonToObject(aJson: TJSONObject): TMovimento;
begin
  Result := TJson.JsonToObject<TMovimento>(aJson);
end;

function TListMovimento.LastItem: TMovimento;
begin
  Result := nil;
  if FList.Count > 0 then
    Result := FList.Last;
end;

function TListMovimento.LocalizaList: TMovimento;
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

constructor TListMovimento.Create;
begin
  FList := TObjectList<TMovimento>.Create;
  FDataSet := TFDMemTable.Create(nil);
  CreateFieldsDataSet;
end;

procedure TListMovimento.CreateFieldsDataSet;
begin
  FDataSet.FieldDefs.Add('id', ftInteger);
  FDataSet.FieldDefs.Add('ind_movimento', ftInteger);
  FDataSet.FieldDefs.Add('ind_status', ftInteger);
  FDataSet.FieldDefs.Add('id_cliente', ftInteger);
  FDataSet.FieldDefs.Add('nome_cliente', ftString, 100);
  FDataSet.FieldDefs.Add('doc_cliente', ftString, 14);
  FDataSet.FieldDefs.Add('fone_cliente', ftString, 20);
  FDataSet.FieldDefs.Add('id_usuario ', ftInteger);
  FDataSet.FieldDefs.Add('dta_emissao', ftDateTime);
  FDataSet.FieldDefs.Add('vlr_subtotal', ftCurrency);
  FDataSet.FieldDefs.Add('vlr_frete', ftCurrency);
  FDataSet.FieldDefs.Add('vlr_desc', ftCurrency);
  FDataSet.FieldDefs.Add('vlr_acres', ftCurrency);
  FDataSet.FieldDefs.Add('vlr_total', ftCurrency);

  FDataSet.CreateDataSet;

  FDataSet.IndexFieldNames := 'id';
end;

function TListMovimento.DataSet: TDataSet;
begin
  Result := FDataSet;
end;

destructor TListMovimento.Destroy;
begin
  FList.Free;
  FDataSet.DisposeOf;
  inherited;
end;

class function TListMovimento.New: iListMovimento;
begin
  Result := Self.Create;
end;

function TListMovimento.ObjectToJson(aObject: TMovimento): TJSONObject;
var
  lObject : TMovimento;
begin
  lObject := aObject;
  Result := TJson.ObjectToJsonObject(lObject);
end;

function TListMovimento.SetData(aJson: TJSONValue): iListMovimento;
var
  lJsonArray : TJSONArray;
begin
  Result := nil;

  aJson.TryGetValue<Integer>('records', FRecordCount);
  aJson.TryGetValue<TJSONArray>('data', lJsonArray);

  if (Assigned(lJsonArray)) and (lJsonArray.Count > 0) then
  begin
    SetDataSet(lJsonArray);
    SetList(lJsonArray);
  end
  else if FDataSet.FieldCount > 0 then
    FDataSet.EmptyDataSet;
end;

function TListMovimento.SetDataSet(aJson: TJSONArray): iListMovimento;
begin
  FDataSet.DisableControls;
  if FDataSet.FieldCount > 0 then
    FDataSet.EmptyDataSet;

  FDataSet.LoadFromJSON(aJson, False);

  FDataSet.EnableControls;

  FDataSet.Open;
end;

function TListMovimento.SetList(aJson: TJSONArray): iListMovimento;
begin
  FList.Clear;

  for var I := 0 to AJson.Count -1 do
    FList.Add(JsonToObject(aJson.Items[I] as TJSONObject));
end;

end.
