unit Rp.Controller.MovimentoServico;

interface

uses
  Data.DB,
  Rp.Model.Entity.MovimentoServico,
  Rp.Model.Dao.Generic,
  Rp.Model.List.MovimentoServico,
  Rp.Model.Rest,
  System.SysUtils;

type
  iControllerMovimentoServico = interface
    ['{4A217C3A-6515-4EEE-88E3-3E4973C19F8B}']

    function DataSource( aDataSource: TDataSource ): iControllerMovimentoServico;

    function CreateNewList : iControllerMovimentoServico;

    function Find : iControllerMovimentoServico; overload;
    function Find (const aID : Integer ) : iControllerMovimentoServico; overload;
    function Insert : iControllerMovimentoServico;
    function InsertDataSet : iControllerMovimentoServico;
    function Delete : Boolean; overload;
    function Delete(aId, aIndMovimento: String) : Boolean; overload;
    function DeleteDataSet : iControllerMovimentoServico;
    function Update : iControllerMovimentoServico;
    function LocalizaEntidade : iControllerMovimentoServico;
    function ClearField : iControllerMovimentoServico;

    function Entidade : TMovimentoServico; overload;
    function Entidade( aIndex: Integer ) : TMovimentoServico; overload;
    function RecordCount : Integer;
  end;

  TControllerMovimentoServico = class(TInterfacedObject, iControllerMovimentoServico)
  private
    FEntidade : TMovimentoServico;
    FDAOGeneric : iDAOGeneric;
    FList : iListMovimentoServico;
    FDataSource : TDataSource;

  public
    constructor Create;
    destructor Destroy; override;
    class function New : iControllerMovimentoServico;

    function CreateNewList : iControllerMovimentoServico;

    function DataSource( aDataSource: TDataSource ): iControllerMovimentoServico;
    function Find : iControllerMovimentoServico; overload;
    function Find (const aID : Integer ) : iControllerMovimentoServico; overload;
    function Insert : iControllerMovimentoServico;
    function InsertDataSet : iControllerMovimentoServico;
    function Delete : Boolean; overload;
    function Delete(aId, aIndMovimento: String) : Boolean; overload;
    function DeleteDataSet : iControllerMovimentoServico;
    function Update : iControllerMovimentoServico;

    function LocalizaEntidade : iControllerMovimentoServico;
    function ClearField : iControllerMovimentoServico;

    function Entidade : TMovimentoServico; overload;
    function Entidade( aIndex: Integer ) : TMovimentoServico; overload;
    function RecordCount : Integer;
  end;

implementation

{ TControllerMovimentoServico }

function TControllerMovimentoServico.ClearField: iControllerMovimentoServico;
begin
  Result := Self;
  FList.ClearFiels;
end;

constructor TControllerMovimentoServico.Create;
begin
  FList := TListMovimentoServico.New;
  FDAOGeneric := TDAOGeneric.New;
  FDAOGeneric.Request.Resource('movimentoservico');
end;

function TControllerMovimentoServico.CreateNewList: iControllerMovimentoServico;
begin
  Result := Self;
  FEntidade := FList.CreateNewList;
end;

function TControllerMovimentoServico.DataSource(
  aDataSource: TDataSource): iControllerMovimentoServico;
begin
  Result := Self;
  FDataSource := aDataSource;
  FDataSource.DataSet := FList.DataSet;
end;

function TControllerMovimentoServico.Delete: Boolean;
begin
  Result := FDAOGeneric.Delete(FDataSource.DataSet.FieldByName('id').AsString);
  Find;
end;

function TControllerMovimentoServico.Delete(aId,
  aIndMovimento: String): Boolean;
begin
  FDAOGeneric.Request.AddParam('id_movimento', aId);
  FDAOGeneric.Request.AddParam('ind_movimento', aIndMovimento);

  Result := FDAOGeneric.Delete;
end;

function TControllerMovimentoServico.DeleteDataSet: iControllerMovimentoServico;
begin
  FList.DataSet.Delete;
end;

destructor TControllerMovimentoServico.Destroy;
begin
  inherited;
end;

function TControllerMovimentoServico.Entidade(aIndex: Integer): TMovimentoServico;
begin
  Result := FList.Item(aIndex);
end;

function TControllerMovimentoServico.Entidade: TMovimentoServico;
begin
  if not Assigned(FEntidade) then
    FEntidade := FList.Item;
  Result := FEntidade;
end;

function TControllerMovimentoServico.Find: iControllerMovimentoServico;
begin
  Result := Self;
  FList.SetData(FDAOGeneric.Find);
end;

function TControllerMovimentoServico.Find(const aID: Integer): iControllerMovimentoServico;
begin
  Result := Self;
  FList.SetData(FDAOGeneric.Find(IntToStr(aID)));
end;

function TControllerMovimentoServico.Insert: iControllerMovimentoServico;
begin
  Result := Self;
  if FDAOGeneric.Insert(FList.GeneratorJson(FEntidade)) <> nil then
    Find;
end;

function TControllerMovimentoServico.InsertDataSet: iControllerMovimentoServico;
begin
  Result := Self;
  FList.IncludeRegiter(FList.GeneratorJson(FEntidade));
end;

function TControllerMovimentoServico.LocalizaEntidade: iControllerMovimentoServico;
begin
  Result := Self;
  FEntidade := FList.LocalizaList;
end;

class function TControllerMovimentoServico.New: iControllerMovimentoServico;
begin
  Result := Self.Create;
end;

function TControllerMovimentoServico.RecordCount: Integer;
begin
  Result := FList.RecordCount;
end;

function TControllerMovimentoServico.Update: iControllerMovimentoServico;
begin
  Result := Self;
  FList.GetJson;
  if FDAOGeneric.Update(FList.GetJson) then
    Find;
end;

end.
