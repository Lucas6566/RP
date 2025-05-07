unit Rp.Model.List.FormaPagamento;

interface

uses
  Rp.Model.Entity.FormaPagamento,
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
  iListFormaPagamento = Interface
    ['{83928C9F-2286-4132-BDC6-83BFE9EC608C}']
    function GeneratorJson( aObject : TFormaPagamento ) : TJSONObject;
    function GetJson : TJSONObject;

    function SetData(aJson: TJSONValue): iListFormaPagamento;
    function SetList(aJson: TJSONArray): iListFormaPagamento;
    function SetDataSet(aJson: TJSONArray): iListFormaPagamento;

    function LocalizaList: TFormaPagamento;

    function DataSet: TDataSet;
  End;


  TListFormaPagamento = Class(TInterfacedObject, iListFormaPagamento)
  private
    FList : TObjectList<TFormaPagamento>;
    FDataSet : TFDMemTable;
    FRecordCount : Integer;

    procedure CreateFieldsDataSet;
    function ObjectToJson( aObject : TFormaPagamento ) : TJSONObject;
    function JsonToObject(aJson: TJSONObject): TFormaPagamento;
  public
    constructor Create;
    destructor Destroy; override;
    class function New : iListFormaPagamento;

  public
    function GeneratorJson( aObject : TFormaPagamento ) : TJSONObject;
    function GetJson : TJSONObject;

    function SetData(aJson: TJSONValue): iListFormaPagamento;
    function SetList(aJson: TJSONArray): iListFormaPagamento;
    function SetDataSet(aJson: TJSONArray): iListFormaPagamento;

    function LocalizaList: TFormaPagamento;

    function DataSet: TDataSet;
  End;

implementation

{ TListFormaPagamento }

function TListFormaPagamento.GeneratorJson( aObject : TFormaPagamento ) : TJSONObject;
begin
  Result := ObjectToJson(aObject);
end;

function TListFormaPagamento.GetJson: TJSONObject;
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

function TListFormaPagamento.JsonToObject(aJson: TJSONObject): TFormaPagamento;
begin
  Result := TJson.JsonToObject<TFormaPagamento>(aJson, []);
end;

function TListFormaPagamento.LocalizaList: TFormaPagamento;
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

constructor TListFormaPagamento.Create;
begin
  FList := TObjectList<TFormaPagamento>.Create;
  FDataSet := TFDMemTable.Create(nil);
  CreateFieldsDataSet;
end;

procedure TListFormaPagamento.CreateFieldsDataSet;
begin
  FDataSet.FieldDefs.Add('id', ftInteger);
  FDataSet.FieldDefs.Add('descricao', ftString, 100);

  FDataSet.CreateDataSet;

  FDataSet.IndexFieldNames := 'id';
end;

function TListFormaPagamento.DataSet: TDataSet;
begin
  Result := FDataSet;
end;

destructor TListFormaPagamento.Destroy;
begin
  FList.Free;
  FDataSet.DisposeOf;
  inherited;
end;

class function TListFormaPagamento.New: iListFormaPagamento;
begin
  Result := Self.Create;
end;

function TListFormaPagamento.ObjectToJson(aObject: TFormaPagamento): TJSONObject;
var
  lObject : TFormaPagamento;
begin
  lObject := aObject;
  Result := TJson.ObjectToJsonObject(lObject);
end;

function TListFormaPagamento.SetData(aJson: TJSONValue): iListFormaPagamento;
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

function TListFormaPagamento.SetDataSet(aJson: TJSONArray): iListFormaPagamento;
begin
  FDataSet.DisableControls;
  if FDataSet.FieldCount > 0 then
    FDataSet.EmptyDataSet;

  FDataSet.LoadFromJSON(aJson, False);

  FDataSet.EnableControls;

  FDataSet.Open;
end;

function TListFormaPagamento.SetList(aJson: TJSONArray): iListFormaPagamento;
begin
  FList.Clear;

  for var I := 0 to AJson.Count -1 do
    FList.Add(JsonToObject(aJson.Items[I] as TJSONObject));
end;

end.
