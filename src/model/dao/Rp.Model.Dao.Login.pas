unit Rp.Model.Dao.Login;

interface

uses
  System.JSON,
  Rp.Model.Dao.Generic,
  REST.Json,
  RESTRequest4D,
  System.SysUtils;

type
  iDAOLogin = interface
    ['{920E937B-C088-4F2B-B014-3907AF1268D0}']
    function Login( aObject : TJSONObject ) : TJSONValue;
  end;

  TDAOLogin = class(TDAOGeneric, iDAOLogin)
  private

  public
    class function New : iDAOLogin;
    constructor Create;
    destructor Destroy; override;

    function Login( aObject : TJSONObject ) : TJSONValue;

  end;

implementation

{ TDAOLogin }

constructor TDAOLogin.Create;
begin

  inherited;
end;

destructor TDAOLogin.Destroy;
begin

  inherited;
end;

function TDAOLogin.Login(aObject: TJSONObject): TJSONValue;
var
  lResponse: IResponse;
begin
  lResponse := FRequest.ClearBody
              .ResourceSuffix(EmptyStr)
              .Post;

  Result := lResponse.JSONValue;
end;

class function TDAOLogin.New: iDAOLogin;
begin
  Result := Self.Create;
end;

end.
