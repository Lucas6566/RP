unit Rp.Model.List.Servico;

interface

uses
  Rp.Model.Entity.Servico,
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
  iListServico = Interface
    ['{83928C9F-2286-4132-BDC6-83BFE9EC608C}']
    function GeneratorJson( aObject : TServico ) : TJSONObject;
    function GetJson : TJSONObject;

    function SetData(aJson: TJSONValue): iListServico;
    function SetList(aJson: TJSONArray): iListServico;
    function SetDataSet(aJson: TJSONArray): iListServico;
    function SetObject(aObject : TServico) : TServico;

    function LocalizaList: TServico;

    function DataSet: TDataSet;
  End;


  TListServico = Class(TInterfacedObject, iListServico)
  private
    FList : TObjectList<TServico>;
    FDataSet : TFDMemTable;
    FRecordCount : Integer;

    procedure CreateFieldsDataSet;
    function ObjectToJson( aObject : TServico ) : TJSONObject;
    function JsonToObject(aJson: TJSONObject): TServico;
  public
    constructor Create;
    destructor Destroy; override;
    class function New : iListServico;

  public
    function GeneratorJson( aObject : TServico ) : TJSONObject;
    function GetJson : TJSONObject;

    function SetData(aJson: TJSONValue): iListServico;
    function SetList(aJson: TJSONArray): iListServico;
    function SetDataSet(aJson: TJSONArray): iListServico;
    function SetObject(aObject : TServico) : TServico;

    function LocalizaList: TServico;

    function DataSet: TDataSet;
  End;

implementation

{ TListServico }

function TListServico.GeneratorJson( aObject : TServico ) : TJSONObject;
begin
  Result := ObjectToJson(aObject);
end;

function TListServico.GetJson: TJSONObject;
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

function TListServico.JsonToObject(aJson: TJSONObject): TServico;
begin
  Result := TJson.JsonToObject<TServico>(aJson, []);
end;

function TListServico.LocalizaList: TServico;
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

constructor TListServico.Create;
begin
  FList := TObjectList<TServico>.Create;
  FDataSet := TFDMemTable.Create(nil);
  CreateFieldsDataSet;
end;

procedure TListServico.CreateFieldsDataSet;
begin
  FDataSet.FieldDefs.Add('id', ftInteger);
  FDataSet.FieldDefs.Add('descricao', ftString, 100);
  FDataSet.FieldDefs.Add('vlr_venda', ftCurrency);
  FDataSet.FieldDefs.Add('id_tipo_servico', ftInteger);

  FDataSet.CreateDataSet;

  FDataSet.IndexFieldNames := 'id';
end;

function TListServico.DataSet: TDataSet;
begin
  Result := FDataSet;
end;

destructor TListServico.Destroy;
begin
  FList.Free;
  FDataSet.DisposeOf;
  inherited;
end;

class function TListServico.New: iListServico;
begin
  Result := Self.Create;
end;

function TListServico.ObjectToJson(aObject: TServico): TJSONObject;
var
  lObject : TServico;
begin
  lObject := aObject;
  Result := TJson.ObjectToJsonObject(lObject);
end;

function TListServico.SetData(aJson: TJSONValue): iListServico;
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

function TListServico.SetDataSet(aJson: TJSONArray): iListServico;
begin
  FDataSet.DisableControls;
  if FDataSet.FieldCount > 0 then
    FDataSet.EmptyDataSet;

  FDataSet.LoadFromJSON(aJson, False);

  FDataSet.EnableControls;

  FDataSet.Open;
end;

function TListServico.SetList(aJson: TJSONArray): iListServico;
begin
  FList.Clear;

  for var I := 0 to AJson.Count -1 do
    FList.Add(JsonToObject(aJson.Items[I] as TJSONObject));
end;

function TListServico.SetObject(aObject: TServico): TServico;
begin
  FList.Add(aObject);
  Result := FList.Items[0];
end;

end.
