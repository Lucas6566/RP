unit Rp.Controller.Movimento;

interface

uses
  Data.DB,
  Rp.Model.Entity.Movimento,
  Rp.Model.Dao.Generic,
  Rp.Model.List.Movimento,
  Rp.Model.Rest,
  Rp.Controller.MovimentoServico;

type
  iControllerMovimento = interface
    ['{4A217C3A-6515-4EEE-88E3-3E4973C19F8B}']

    function DataSource( aDataSource: TDataSource ): iControllerMovimento;
    function AddParam(aField, aValue: String): iControllerMovimento;
    function Find : Boolean; overload;
    function Find(aField, aValue: String): Boolean; overload;
    function Insert : iControllerMovimento;
    function Delete : Boolean;
    function Update : iControllerMovimento;
    function LocalizaEntidade : iControllerMovimento;

    function Servico : iControllerMovimentoServico;

    function Entidade : TMovimento;
  end;

  TControllerMovimento = class(TInterfacedObject, iControllerMovimento)
  private
    FEntidade : TMovimento;
    FDAOGeneric : iDAOGeneric;
    FList : iListMovimento;
    FDataSource : TDataSource;

    FServico : iControllerMovimentoServico;

  public
    constructor Create;
    destructor Destroy; override;
    class function New : iControllerMovimento;

    function DataSource( aDataSource: TDataSource ): iControllerMovimento;
    function AddParam(aField, aValue: String): iControllerMovimento;
    function Find : Boolean; overload;
    function Find(aField, aValue: String): Boolean; overload;
    function Insert : iControllerMovimento;
    function Delete : Boolean;
    function Update : iControllerMovimento;
    function LocalizaEntidade : iControllerMovimento;

    function Servico : iControllerMovimentoServico;

    function Entidade : TMovimento;
  end;

implementation

uses
  System.JSON;

{ TControllerMovimento }

function TControllerMovimento.AddParam(aField,
  aValue: String): iControllerMovimento;
begin
  Result := Self;
  FDAOGeneric.Request.AddParam(aField, aValue);
end;

constructor TControllerMovimento.Create;
begin
  FList := TListMovimento.New;
  FDAOGeneric := TDAOGeneric.New;
  FDAOGeneric.Request.Resource('movimento');
end;

function TControllerMovimento.DataSource(
  aDataSource: TDataSource): iControllerMovimento;
begin
  Result := Self;
  FDataSource := aDataSource;
  FDataSource.DataSet := FList.DataSet;
end;

function TControllerMovimento.Delete: Boolean;
var
  lId, lIndMovimento: String;
begin
  lId           := FDataSource.DataSet.FieldByName('id').AsString;
  lIndMovimento := FDataSource.DataSet.FieldByName('ind_movimento').AsString;
  Servico.Delete(lId, lIndMovimento);

  FDAOGeneric.Request.AddParam('id', lId);
  FDAOGeneric.Request.AddParam('ind_movimento', lIndMovimento);

  Result := FDAOGeneric.Delete;
  Find;
end;

destructor TControllerMovimento.Destroy;
begin
  inherited;
end;

function TControllerMovimento.Entidade: TMovimento;
begin
  if not Assigned(FEntidade) then
    FEntidade := FList.Item;
  Result := FEntidade;
end;

function TControllerMovimento.Find(aField, aValue: String): Boolean;
begin
  FDAOGeneric.Request.AddParam(aField, aValue);
  Result := Find;
end;

function TControllerMovimento.Find: Boolean;
begin
  FList.SetData(FDAOGeneric.Find);
  Result := FList.DataSet.RecordCount > 0;
end;

function TControllerMovimento.Insert: iControllerMovimento;
var
  lJson : TJSONValue;
begin
  Result := Self;
  lJson := FDAOGeneric.Insert(FList.GeneratorJson(FEntidade));
  if lJson <> nil then begin
    FList.SetData(lJson);
    FEntidade := FList.LastItem;
    if Assigned(FEntidade) then begin
      FServico.Entidade.Id_Movimento  := FEntidade.Id;
      FServico.Entidade.ind_movimento := FEntidade.ind_movimento;
      FServico.Entidade.ind_status    := FEntidade.ind_status;
      FServico.Insert;
    end;
    Find;
  end;
end;

function TControllerMovimento.LocalizaEntidade: iControllerMovimento;
begin
  Result := Self;
  FEntidade := FList.LocalizaList;
end;

class function TControllerMovimento.New: iControllerMovimento;
begin
  Result := Self.Create;
end;

function TControllerMovimento.Servico: iControllerMovimentoServico;
begin
  if not Assigned(FServico) then
    FServico := TControllerMovimentoServico.New;
  Result := FServico;
end;

function TControllerMovimento.Update: iControllerMovimento;
begin
  Result := Self;
  FList.GetJson;
  if FDAOGeneric.Update(FList.GetJson) then
    Find;
end;

end.
