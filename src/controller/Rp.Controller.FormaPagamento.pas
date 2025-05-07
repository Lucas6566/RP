unit Rp.Controller.FormaPagamento;

interface

uses
  Data.DB,
  Rp.Model.Entity.FormaPagamento,
  Rp.Model.Dao.Generic,
  Rp.Model.List.FormaPagamento, Rp.Model.Rest;

type
  iControllerFormaPagamento = interface
    ['{4A217C3A-6515-4EEE-88E3-3E4973C19F8B}']

    function DataSource( aDataSource: TDataSource ): iControllerFormaPagamento;
    function Find : iControllerFormaPagamento; overload;
    function Find (const aID : String ) : iControllerFormaPagamento; overload;
    function Insert : iControllerFormaPagamento;
    function Delete : Boolean;
    function Update : iControllerFormaPagamento;
    function LocalizaEntidade : iControllerFormaPagamento;

    function Entidade : TFormaPagamento;
  end;

  TControllerFormaPagamento = class(TInterfacedObject, iControllerFormaPagamento)
  private
    FEntidade : TFormaPagamento;
    FDAOGeneric : iDAOGeneric;
    FList : iListFormaPagamento;
    FDataSource : TDataSource;

  public
    constructor Create;
    destructor Destroy; override;
    class function New : iControllerFormaPagamento;

    function DataSource( aDataSource: TDataSource ): iControllerFormaPagamento;
    function Find : iControllerFormaPagamento; overload;
    function Find (const aID : String ) : iControllerFormaPagamento; overload;
    function Insert : iControllerFormaPagamento;
    function Delete : Boolean;
    function Update : iControllerFormaPagamento;
    function LocalizaEntidade : iControllerFormaPagamento;

    function Entidade : TFormaPagamento;
  end;

implementation

{ TControllerFormaPagamento }

constructor TControllerFormaPagamento.Create;
begin
  FEntidade := TFormaPagamento.Create;
  FList := TListFormaPagamento.New;
  FDAOGeneric := TDAOGeneric.New;
  FDAOGeneric.Request(ConnRequest.Resource('formapagamento'));
end;

function TControllerFormaPagamento.DataSource(
  aDataSource: TDataSource): iControllerFormaPagamento;
begin
  Result := Self;
  FDataSource := aDataSource;
  FDataSource.DataSet := FList.DataSet;
end;

function TControllerFormaPagamento.Delete: Boolean;
begin
  Result := FDAOGeneric.Delete(FDataSource.DataSet.FieldByName('id').AsString);
  Find;
end;

destructor TControllerFormaPagamento.Destroy;
begin
  FEntidade.Free;
  inherited;
end;

function TControllerFormaPagamento.Entidade: TFormaPagamento;
begin
  Result := FEntidade;
end;

function TControllerFormaPagamento.Find: iControllerFormaPagamento;
begin
  Result := Self;
  FList.SetData(FDAOGeneric.Find);
end;

function TControllerFormaPagamento.Find(const aID: String): iControllerFormaPagamento;
begin
  Result := Self;
end;

function TControllerFormaPagamento.Insert: iControllerFormaPagamento;
begin
  Result := Self;
  if FDAOGeneric.Insert(FList.GeneratorJson(FEntidade)) <> nil then
    Find;
end;

function TControllerFormaPagamento.LocalizaEntidade: iControllerFormaPagamento;
begin
  Result := Self;
  FEntidade := FList.LocalizaList;
end;

class function TControllerFormaPagamento.New: iControllerFormaPagamento;
begin
  Result := Self.Create;
end;

function TControllerFormaPagamento.Update: iControllerFormaPagamento;
begin
  Result := Self;
  FList.GetJson;
  if FDAOGeneric.Update(FList.GetJson) then
    Find;
end;

end.
