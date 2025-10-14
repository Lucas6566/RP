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
  end;

implementation

constructor TRpDataSet.Create;
begin
  inherited Create(nil);
end;

destructor TRpDataSet.Destroy;
begin
  Free;
  inherited;
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
