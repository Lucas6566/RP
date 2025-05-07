unit Rp.Model.List.Cliente;

interface

uses
  Rp.Model.Entity.Cliente,
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
  iListCliente = Interface
    ['{83928C9F-2286-4132-BDC6-83BFE9EC608C}']
    function GeneratorJson( aObject : TCliente ) : TJSONObject;
    function GetJson : TJSONObject;

    function SetData(aJson: TJSONValue): iListCliente;
    function SetList(aJson: TJSONArray): iListCliente;
    function SetDataSet(aJson: TJSONArray): iListCliente;
    function SetObject(aObject : TCliente) : TCliente;

    function LocalizaList: TCliente; overload;
    function LocalizaList( aID : Integer ): TCliente; overload;

    function DataSet: TDataSet;
  End;


  TListCliente = Class(TInterfacedObject, iListCliente)
  private
    FList : TObjectList<TCliente>;
    FDataSet : TFDMemTable;
    FRecordCount : Integer;

    procedure CreateFieldsDataSet;
    function ObjectToJson( aObject : TCliente ) : TJSONObject;
    function JsonToObject(aJson: TJSONObject): TCliente;
  public
    constructor Create;
    destructor Destroy; override;
    class function New : iListCliente;

  public
    function GeneratorJson( aObject : TCliente ) : TJSONObject;
    function GetJson : TJSONObject;

    function SetData(aJson: TJSONValue): iListCliente;
    function SetList(aJson: TJSONArray): iListCliente;
    function SetDataSet(aJson: TJSONArray): iListCliente;
    function SetObject(aObject : TCliente) : TCliente;

    function LocalizaList: TCliente; overload;
    function LocalizaList( aID : Integer ): TCliente; overload;

    function DataSet: TDataSet;
  End;

implementation

{ TListCliente }

function TListCliente.GeneratorJson( aObject : TCliente ) : TJSONObject;
begin
  Result := ObjectToJson(aObject);
end;

function TListCliente.GetJson: TJSONObject;
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

function TListCliente.JsonToObject(aJson: TJSONObject): TCliente;
begin
  Result := TJson.JsonToObject<TCliente>(aJson, []);
end;

function TListCliente.LocalizaList(aID: Integer): TCliente;
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

function TListCliente.LocalizaList: TCliente;
begin
  Result := LocalizaList(FDataSet.FieldByName('id').AsInteger)
  {
  Result := nil;
  for var I := 0 to FList.Count-1 do
  begin
    if FList.Items[I].id = FDataSet.FieldByName('id').AsInteger then begin
      Result := FList.Items[I];
      break;
    end;
  end;
  }
end;

constructor TListCliente.Create;
begin
  FList := TObjectList<TCliente>.Create;
  FDataSet := TFDMemTable.Create(nil);
  CreateFieldsDataSet;
end;

procedure TListCliente.CreateFieldsDataSet;
begin
  FDataSet.FieldDefs.Add('id', ftInteger);
  FDataSet.FieldDefs.Add('nome', ftString, 100);
  FDataSet.FieldDefs.Add('tipo_pessoa', ftString, 1);
  FDataSet.FieldDefs.Add('id_documento', ftString, 14);
  FDataSet.FieldDefs.Add('telefone', ftString, 20);
  FDataSet.FieldDefs.Add('email', ftString, 100);
  FDataSet.FieldDefs.Add('sexo', ftString, 1);
  FDataSet.FieldDefs.Add('endereco', ftString, 100);
  FDataSet.FieldDefs.Add('cep', ftString, 20);
  FDataSet.FieldDefs.Add('Complemento', ftString, 100);
  FDataSet.FieldDefs.Add('id_bairro', ftInteger);

  FDataSet.CreateDataSet;

  FDataSet.IndexFieldNames := 'id';
end;

function TListCliente.DataSet: TDataSet;
begin
  Result := FDataSet;
end;

destructor TListCliente.Destroy;
begin
  FList.Free;
  FDataSet.DisposeOf;
  inherited;
end;

class function TListCliente.New: iListCliente;
begin
  Result := Self.Create;
end;

function TListCliente.ObjectToJson(aObject: TCliente): TJSONObject;
var
  lObject : TCliente;
begin
  lObject := aObject;
  Result := TJson.ObjectToJsonObject(lObject);
end;

function TListCliente.SetData(aJson: TJSONValue): iListCliente;
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

function TListCliente.SetDataSet(aJson: TJSONArray): iListCliente;
begin
  FDataSet.DisableControls;
  if FDataSet.FieldCount > 0 then
    FDataSet.EmptyDataSet;

  FDataSet.LoadFromJSON(aJson, False);

  FDataSet.EnableControls;

  FDataSet.Open;
end;

function TListCliente.SetList(aJson: TJSONArray): iListCliente;
begin
  FList.Clear;

  for var I := 0 to AJson.Count -1 do
    FList.Add(JsonToObject(aJson.Items[I] as TJSONObject));
end;

function TListCliente.SetObject(aObject : TCliente): TCliente;
begin
  FList.Add(aObject);
  Result := FList.Items[0];
end;

end.
