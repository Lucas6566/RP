unit Rp.Model.List.MovimentoServico;

interface

uses
  Rp.Model.Entity.MovimentoServico,
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
  Rp.Controller.Servico,
  System.SysUtils;

type
  iListMovimentoServico = Interface
    ['{83928C9F-2286-4132-BDC6-83BFE9EC608C}']
    function GeneratorJson( aObject : TMovimentoServico ) : TJSONObject;
    function GetJson : TJSONObject;

    function SetData(aJson: TJSONValue): Boolean;
    function SetList(aJson: TJSONArray): iListMovimentoServico;
    function SetDataSet(aJson: TJSONArray): iListMovimentoServico;

    function CreateNewList : TMovimentoServico;

    function IncludeRegiter(aJson: TJSONObject): iListMovimentoServico;
    function DeleteRegister: iListMovimentoServico;

    function LocalizaList: TMovimentoServico;
    function Item: TMovimentoServico; overload;
    function Item( aIndex: Integer ): TMovimentoServico; overload;

    function ClearFiels : iListMovimentoServico;

    function DataSet: TDataSet;
    function RecordCount : Integer;
    function List : TObjectList<TMovimentoServico>;
  End;


  TListMovimentoServico = Class(TInterfacedObject, iListMovimentoServico)
  private
    FList : TObjectList<TMovimentoServico>;
    FDataSet : TFDMemTable;
    FRecordCount : Integer;

    procedure CreateFieldsDataSet;
    procedure SetInfServico;
    function ObjectToJson( aObject : TMovimentoServico ) : TJSONObject;
    function JsonToObject(aJson: TJSONObject): TMovimentoServico;
    function List: TObjectList<TMovimentoServico>;

  public
    constructor Create;
    destructor Destroy; override;
    class function New : iListMovimentoServico;

  public
    function GeneratorJson( aObject : TMovimentoServico ) : TJSONObject;
    function GetJson : TJSONObject;

    function SetData(aJson: TJSONValue): Boolean;
    function SetList(aJson: TJSONArray): iListMovimentoServico;
    function SetDataSet(aJson: TJSONArray): iListMovimentoServico;

    function CreateNewList : TMovimentoServico;

    function IncludeRegiter(aJson: TJSONObject): iListMovimentoServico;
    function DeleteRegister: iListMovimentoServico;

    function ClearFiels : iListMovimentoServico;

    function LocalizaList: TMovimentoServico;
    function Item: TMovimentoServico; overload;
    function Item( aIndex: Integer ): TMovimentoServico; overload;

    function DataSet: TDataSet;
    function RecordCount : Integer;
  End;

implementation

{ TListMovimentoServico }

function TListMovimentoServico.GeneratorJson( aObject : TMovimentoServico ) : TJSONObject;
begin
  Result := ObjectToJson(aObject);
end;

function TListMovimentoServico.GetJson: TJSONObject;
begin
  Result := ObjectToJson(LocalizaList);
end;

function TListMovimentoServico.IncludeRegiter(aJson: TJSONObject): iListMovimentoServico;
begin
  Result := Self;
  FDataSet.DisableControls;
  FDataSet.LoadFromJSON(aJson);
  FDataSet.EnableControls;
end;

function TListMovimentoServico.Item: TMovimentoServico;
begin
  if FList.Count = 0 then
    FList.Add(TMovimentoServico.Create);
  Result := FList.Last;
end;

function TListMovimentoServico.JsonToObject(aJson: TJSONObject): TMovimentoServico;
begin
  Result := TJson.JsonToObject<TMovimentoServico>(aJson, []);
end;

function TListMovimentoServico.Item( aIndex: Integer ): TMovimentoServico;
begin
  Result := FList.Items[aIndex];
end;

function TListMovimentoServico.List: TObjectList<TMovimentoServico>;
begin
  Result := FList;
end;

function TListMovimentoServico.LocalizaList: TMovimentoServico;
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

function TListMovimentoServico.ClearFiels: iListMovimentoServico;
begin
  for var I := Pred(FList.Count) downto  0 do
    FList.delete(i);

  FDataSet.EmptyDataSet;
end;

constructor TListMovimentoServico.Create;
begin
  FList := TObjectList<TMovimentoServico>.Create;
  FDataSet := TFDMemTable.Create(nil);
  CreateFieldsDataSet;
end;

procedure TListMovimentoServico.CreateFieldsDataSet;
begin
  FDataSet.FieldDefs.Add('id', ftInteger);
  FDataSet.FieldDefs.Add('id_servico', ftInteger);
  FDataSet.FieldDefs.Add('descrservico', ftString, 100);
  FDataSet.FieldDefs.Add('vlr_unitario', ftCurrency);
  FDataSet.FieldDefs.Add('qtd_servico', ftCurrency);
  FDataSet.FieldDefs.Add('vlr_desconto', ftCurrency);
  FDataSet.FieldDefs.Add('vlr_acrescimo', ftCurrency);
  FDataSet.FieldDefs.Add('vlr_total', ftCurrency);

  FDataSet.CreateDataSet;

  FDataSet.IndexFieldNames := 'id';
end;

function TListMovimentoServico.DataSet: TDataSet;
begin
  Result := FDataSet;
end;

function TListMovimentoServico.DeleteRegister: iListMovimentoServico;
begin
  FList.Remove(LocalizaList);
  DataSet.Delete;
end;

destructor TListMovimentoServico.Destroy;
begin
  FDataSet.EmptyDataSet;
  FList.Free;
  FDataSet.DisposeOf;
  inherited;
end;

class function TListMovimentoServico.New: iListMovimentoServico;
begin
  Result := Self.Create;
end;

function TListMovimentoServico.ObjectToJson(aObject: TMovimentoServico): TJSONObject;
var
  lObject : TMovimentoServico;
begin
  Result := nil;
  if Assigned(aObject) then begin
    lObject := aObject;
    Result := TJson.ObjectToJsonObject(lObject);
  end;
end;

function TListMovimentoServico.RecordCount: Integer;
begin
  Result := FList.Count;
end;

function TListMovimentoServico.SetData(aJson: TJSONValue): Boolean;
var
  lJsonArray : TJSONArray;
begin
  FRecordCount := aJson.GetValue<Integer>('records');

  Result := FRecordCount > 0;

  if aJson.TryGetValue<TJSONArray>('data', lJsonArray) then begin
    SetDataSet(lJsonArray);
    SetList(lJsonArray);
  end;
end;

function TListMovimentoServico.SetDataSet(aJson: TJSONArray): iListMovimentoServico;
begin
  FDataSet.DisableControls;
  if FDataSet.FieldCount > 0 then
    FDataSet.EmptyDataSet;

  FDataSet.LoadFromJSON(aJson, False);

  SetInfServico;

  FDataSet.EnableControls;

  FDataSet.Open;
end;

procedure TListMovimentoServico.SetInfServico;
var
  lServico: iControllerServico;
begin
  lServico := TControllerServico.New;

  FDataSet.Open;
  FDataSet.FIrst;

  while not FDataSet.Eof do begin
    FDataSet.edit;
    if lServico.Find(FDataSet.FieldByName('id_servico').AsString) then begin
      FDataSet.FieldByName('descrservico').AsString := lServico.Entidade.Descricao;
    end;
    FDataSet.Post;
    FDataSet.Next;
  end;
end;

function TListMovimentoServico.SetList(aJson: TJSONArray): iListMovimentoServico;
begin
  FList.Clear;

  for var I := 0 to AJson.Count -1 do
    FList.Add(JsonToObject(aJson.Items[I] as TJSONObject));
end;

function TListMovimentoServico.CreateNewList: TMovimentoServico;
begin
  FList.Add(TMovimentoServico.Create);
  Result := FList.Last;
end;

end.
