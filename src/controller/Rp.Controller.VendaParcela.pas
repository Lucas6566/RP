unit Rp.Controller.VendaParcela;

interface

uses
  Data.DB,
  Rp.Model.Entity.VendaParcela,
  Rp.Model.Dao.Generic,
  Rp.Model.List.VendaParcela, Rp.Model.Rest;

type
  iControllerVendaParcela = interface
    ['{4A217C3A-6515-4EEE-88E3-3E4973C19F8B}']

    function DataSource( aDataSource: TDataSource ): iControllerVendaParcela;
    function Find : iControllerVendaParcela; overload;
    function Find (const aID : String ) : iControllerVendaParcela; overload;
    function Insert : iControllerVendaParcela;
    function Delete : Boolean;
    function Update : iControllerVendaParcela;
    function LocalizaEntidade : iControllerVendaParcela;

    function Entidade : TVendaParcela;
  end;

  TControllerVendaParcela = class(TInterfacedObject, iControllerVendaParcela)
  private
    FEntidade : TVendaParcela;
    FDAOGeneric : iDAOGeneric;
    FList : iListVendaParcela;
    FDataSource : TDataSource;

  public
    constructor Create;
    destructor Destroy; override;
    class function New : iControllerVendaParcela;

    function DataSource( aDataSource: TDataSource ): iControllerVendaParcela;
    function Find : iControllerVendaParcela; overload;
    function Find (const aID : String ) : iControllerVendaParcela; overload;
    function Insert : iControllerVendaParcela;
    function Delete : Boolean;
    function Update : iControllerVendaParcela;
    function LocalizaEntidade : iControllerVendaParcela;

    function Entidade : TVendaParcela;
  end;

implementation

{ TControllerVendaParcela }

constructor TControllerVendaParcela.Create;
begin
  FEntidade := TVendaParcela.Create;
  FList := TListVendaParcela.New;
  FDAOGeneric := TDAOGeneric.New;
  FDAOGeneric.Request(ConnRequest.Resource('vendaparcela'));
end;

function TControllerVendaParcela.DataSource(
  aDataSource: TDataSource): iControllerVendaParcela;
begin
  Result := Self;
  FDataSource := aDataSource;
  FDataSource.DataSet := FList.DataSet;
end;

function TControllerVendaParcela.Delete: Boolean;
begin
  Result := FDAOGeneric.Delete(FDataSource.DataSet.FieldByName('id').AsString);
  Find;
end;

destructor TControllerVendaParcela.Destroy;
begin
  FEntidade.Free;
  inherited;
end;

function TControllerVendaParcela.Entidade: TVendaParcela;
begin
  Result := FEntidade;
end;

function TControllerVendaParcela.Find: iControllerVendaParcela;
begin
  Result := Self;
  FList.SetData(FDAOGeneric.Find);
end;

function TControllerVendaParcela.Find(const aID: String): iControllerVendaParcela;
begin
  Result := Self;
end;

function TControllerVendaParcela.Insert: iControllerVendaParcela;
begin
  Result := Self;
  if FDAOGeneric.Insert(FList.GeneratorJson(FEntidade)) <> nil then
    Find;
end;

function TControllerVendaParcela.LocalizaEntidade: iControllerVendaParcela;
begin
  Result := Self;
  FEntidade := FList.LocalizaList;
end;

class function TControllerVendaParcela.New: iControllerVendaParcela;
begin
  Result := Self.Create;
end;

function TControllerVendaParcela.Update: iControllerVendaParcela;
begin
  Result := Self;
  FList.GetJson;
  if FDAOGeneric.Update(FList.GetJson) then
    Find;
end;

end.
