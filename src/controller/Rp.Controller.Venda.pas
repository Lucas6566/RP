unit Rp.Controller.Venda;

interface

uses
  Data.DB,
  Rp.Model.Entity.Venda,
  Rp.Model.Dao.Generic,
  Rp.Model.List.Venda,
  Rp.Model.Rest,
  Rp.Controller.VendaParcela,
  Rp.Controller.VendaServico;

type
  iControllerVenda = interface
    ['{4A217C3A-6515-4EEE-88E3-3E4973C19F8B}']

    function DataSource( aDataSource: TDataSource ): iControllerVenda;
    function Find : iControllerVenda; overload;
    function Find (const aID : String ) : iControllerVenda; overload;
    function Insert : iControllerVenda;
    function Delete : Boolean;
    function Update : iControllerVenda;
    function LocalizaEntidade : iControllerVenda;

    function Servico : iControllerVendaServico;
    function Parcela : iControllerVendaParcela;

    function Entidade : TVenda;
  end;

  TControllerVenda = class(TInterfacedObject, iControllerVenda)
  private
    FEntidade : TVenda;
    FDAOGeneric : iDAOGeneric;
    FList : iListVenda;
    FDataSource : TDataSource;

    FServico : iControllerVendaServico;
    FParcela : iControllerVendaParcela;

  public
    constructor Create;
    destructor Destroy; override;
    class function New : iControllerVenda;

    function DataSource( aDataSource: TDataSource ): iControllerVenda;
    function Find : iControllerVenda; overload;
    function Find (const aID : String ) : iControllerVenda; overload;
    function Insert : iControllerVenda;
    function Delete : Boolean;
    function Update : iControllerVenda;
    function LocalizaEntidade : iControllerVenda;

    function Servico : iControllerVendaServico;
    function Parcela : iControllerVendaParcela;

    function Entidade : TVenda;
  end;

implementation

uses
  System.JSON;

{ TControllerVenda }

constructor TControllerVenda.Create;
begin
  //FEntidade := TVenda.Create;
  FList := TListVenda.New;
  FDAOGeneric := TDAOGeneric.New;
  FDAOGeneric.Request(ConnRequest.Resource('venda'));
end;

function TControllerVenda.DataSource(
  aDataSource: TDataSource): iControllerVenda;
begin
  Result := Self;
  FDataSource := aDataSource;
  FDataSource.DataSet := FList.DataSet;
end;

function TControllerVenda.Delete: Boolean;
begin
  Result := FDAOGeneric.Delete(FDataSource.DataSet.FieldByName('id').AsString);
  Find;
end;

destructor TControllerVenda.Destroy;
begin
  //FEntidade.Free;
  inherited;
end;

function TControllerVenda.Entidade: TVenda;
begin
  if not Assigned(FEntidade) then
    FEntidade := TVenda.Create;
  Result := FEntidade;
end;

function TControllerVenda.Find: iControllerVenda;
begin
  Result := Self;
  FList.SetData(FDAOGeneric.Find);
end;

function TControllerVenda.Find(const aID: String): iControllerVenda;
begin
  Result := Self;
end;

function TControllerVenda.Insert: iControllerVenda;
var
  lJson : TJSONValue;
begin
  Result := Self;
  lJson := FDAOGeneric.Insert(FList.GeneratorJson(FEntidade));
  if lJson <> nil then begin
    FList.SetData(lJson);
    FEntidade := FList.LastItem;
    FServico.Entidade.Id_venda := FEntidade.Id;
    FServico.Insert;
    FParcela.Entidade.Id_venda := FEntidade.Id;
    FParcela.Insert;
    Find;
  end;
end;

function TControllerVenda.LocalizaEntidade: iControllerVenda;
begin
  Result := Self;
  FEntidade := FList.LocalizaList;
end;

class function TControllerVenda.New: iControllerVenda;
begin
  Result := Self.Create;
end;

function TControllerVenda.Parcela: iControllerVendaParcela;
begin
  if not Assigned(FParcela) then
    FParcela := TControllerVendaParcela.New;
  Result := FParcela;
end;

function TControllerVenda.Servico: iControllerVendaServico;
begin
  if not Assigned(FServico) then
    FServico := TControllerVendaServico.New;
  Result := FServico;
end;

function TControllerVenda.Update: iControllerVenda;
begin
  Result := Self;
  FList.GetJson;
  if FDAOGeneric.Update(FList.GetJson) then
    Find;
end;

end.
