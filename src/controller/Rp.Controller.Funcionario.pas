unit Rp.Controller.Funcionario;

interface

uses
  Data.DB,
  Rp.Model.Entity.Funcionario,
  Rp.Model.Dao.Generic,
  Rp.Model.List.Funcionario, Rp.Model.Rest;

type
  iControllerFuncionario = interface
    ['{4A217C3A-6515-4EEE-88E3-3E4973C19F8B}']

    function DataSource( aDataSource: TDataSource ): iControllerFuncionario;
    function Find : iControllerFuncionario; overload;
    function Find (const aID : String ) : iControllerFuncionario; overload;
    function Insert : iControllerFuncionario;
    function Delete : Boolean;
    function Update : iControllerFuncionario;
    function LocalizaEntidade : iControllerFuncionario;

    function Entidade : TFuncionario;
  end;

  TControllerFuncionario = class(TInterfacedObject, iControllerFuncionario)
  private
    FEntidade : TFuncionario;
    FDAOGeneric : iDAOGeneric;
    FList : iListFuncionario;
    FDataSource : TDataSource;

  public
    constructor Create;
    destructor Destroy; override;
    class function New : iControllerFuncionario;

    function DataSource( aDataSource: TDataSource ): iControllerFuncionario;
    function Find : iControllerFuncionario; overload;
    function Find (const aID : String ) : iControllerFuncionario; overload;
    function Insert : iControllerFuncionario;
    function Delete : Boolean;
    function Update : iControllerFuncionario;
    function LocalizaEntidade : iControllerFuncionario;

    function Entidade : TFuncionario;
  end;

implementation

{ TControllerFuncionario }

constructor TControllerFuncionario.Create;
begin
  FEntidade := TFuncionario.Create;
  FList := TListFuncionario.New;
  FDAOGeneric := TDAOGeneric.New;
  FDAOGeneric.Request(ConnRequest.Resource('funcionario'));
end;

function TControllerFuncionario.DataSource(
  aDataSource: TDataSource): iControllerFuncionario;
begin
  Result := Self;
  FDataSource := aDataSource;
  FDataSource.DataSet := FList.DataSet;
end;

function TControllerFuncionario.Delete: Boolean;
begin
  Result := FDAOGeneric.Delete(FDataSource.DataSet.FieldByName('id').AsString);
  Find;
end;

destructor TControllerFuncionario.Destroy;
begin
  FEntidade.Free;
  inherited;
end;

function TControllerFuncionario.Entidade: TFuncionario;
begin
  Result := FEntidade;
end;

function TControllerFuncionario.Find: iControllerFuncionario;
begin
  Result := Self;
  FList.SetData(FDAOGeneric.Find);
end;

function TControllerFuncionario.Find(const aID: String): iControllerFuncionario;
begin
  Result := Self;
end;

function TControllerFuncionario.Insert: iControllerFuncionario;
begin
  Result := Self;
  if FDAOGeneric.Insert(FList.GeneratorJson(FEntidade)) <> nil then
    Find;
end;

function TControllerFuncionario.LocalizaEntidade: iControllerFuncionario;
begin
  Result := Self;
  FEntidade := FList.LocalizaList;
end;

class function TControllerFuncionario.New: iControllerFuncionario;
begin
  Result := Self.Create;
end;

function TControllerFuncionario.Update: iControllerFuncionario;
begin
  Result := Self;
  FList.GetJson;
  if FDAOGeneric.Update(FList.GetJson) then
    Find;
end;

end.
