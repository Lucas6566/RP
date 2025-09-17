unit Rp.Controller.Login;

interface

uses
  Data.DB,
  Rp.Model.Entity.Usuario,
  Rp.Model.Dao.Generic,
  Rp.Model.List.Usuario,
  Rp.Model.Rest,
  Rp.Model.Session,
  Rp.Model.Request;

type
  iControllerLogin = interface
    ['{4A217C3A-6515-4EEE-88E3-3E4973C19F8B}']

    function DataSource( aDataSource: TDataSource ): iControllerLogin;

    function Login( aLogin, aSenha: String ): Boolean;

    function Entidade : TUsuario;
  end;

  TControllerLogin = class(TInterfacedObject, iControllerLogin)
  private
    FEntidade : TUsuario;
    FDAOGeneric : iDAOGeneric;
    FList : iListUsuario;
    FDataSource : TDataSource;

  public
    constructor Create;
    destructor Destroy; override;
    class function New : iControllerLogin;

    function DataSource( aDataSource: TDataSource ): iControllerLogin;

    function Login( aLogin, aSenha: String ): Boolean;

    function Entidade : TUsuario;
  end;

implementation

uses
  System.JSON,
  Vcl.Dialogs,
  System.SysUtils;

{ TControllerLogin }

constructor TControllerLogin.Create;
begin
  FList := TListUsuario.New;
  FDAOGeneric := TDAOGeneric.New;
end;

function TControllerLogin.DataSource(
  aDataSource: TDataSource): iControllerLogin;
begin
  Result := Self;
  FDataSource := aDataSource;
  FDataSource.DataSet := FList.DataSet;
end;


destructor TControllerLogin.Destroy;
begin
  inherited;
end;

function TControllerLogin.Entidade: TUsuario;
begin
  if not Assigned(FEntidade) then
    FEntidade := TUsuario.Create;
  Result := FEntidade;
end;

function TControllerLogin.Login(aLogin, aSenha: String): Boolean;
var
  LJSON: TJSONObject;
  lResponse: iResponse;
begin
  lJSON := TJSONObject.Create;
  lJSON.AddPair('login', aLogin);
  lJSON.AddPair('senha', aSenha);

  FDAOGeneric.Request.Resource('login');
  lResponse := FDAOGeneric.Post(lJSON);

  if lResponse.StatusCode in [200,201,204] then
  begin
    TSession.GetInstance.Token.Access := LResponse.JSONValue.GetValue<string>('access');
    TSession.GetInstance.Token.Refresh := LResponse.JSONValue.GetValue<string>('refresh');
  end else
    ShowMessage(IntToStr(LResponse.StatusCode) +
                lResponse.StatusText);

  Result := lResponse.StatusCode in [200,201,204];
end;

class function TControllerLogin.New: iControllerLogin;
begin
  Result := Self.Create;
end;

end.
