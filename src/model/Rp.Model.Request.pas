unit Rp.Model.Request;

interface

uses
  RestRequest4D,
  System.JSON,
  System.Classes,
  REST.Types,
  Rp.Model.Session,
  System.SysUtils,
  System.IOUtils;

type
  IResponse = RestRequest4D.IResponse;
  iRequest = interface
    ['{226182F1-740D-4F41-8330-F8DC76F710DE}']
    function BaseURL(const AValue: string): IRequest;
    function Resource(const AValue: string): IRequest;
    function ResourceSuffix(const AValue: string): IRequest;
    function AddBody(const ABody: TJSONObject; const AOwns: Boolean = True): IRequest;
    function AddParam(const AKey, AValue: string): IRequest;
    function ClearBody: IRequest;
    function ClearParams: IRequest;
    function Get: IResponse;
    function Post: IResponse;
    function Delete: IResponse;
    function Put: IResponse;

    function SetUpHooks: iRequest;
  end;


  TRequest = class(TInterfacedObject, IRequest)
  private
    FRequest: RestRequest4D.IRequest;

  private

    function BaseURL(const AValue: string): IRequest;
    function Resource(const AValue: string): IRequest;
    function ResourceSuffix(const AValue: string): IRequest;
    function AddBody(const ABody: TJSONObject; const AOwns: Boolean = True): IRequest;
    function AddParam(const AKey, AValue: string): IRequest;
    function ClearBody: IRequest;
    function ClearParams: IRequest;
    function Get: IResponse;
    function Post: IResponse;
    function Delete: IResponse;
    function Put: IResponse;

    procedure DoBeforeExecute;
    function Execute(const AMethod: TRESTRequestMethod): IResponse;

    function RenovarToken: Boolean;
    function SetUpHooks: iRequest;

    constructor Create;
  public
    destructor Destroy; override;
    class function New: iRequest;
  end;


implementation

uses
  System.IniFiles;

{ TRequest }

function TRequest.AddBody(const ABody: TJSONObject;
  const AOwns: Boolean): IRequest;
begin
  Result := Self;
  FRequest.AddBody(ABody, AOwns);
end;

function TRequest.AddParam(const AKey, AValue: string): IRequest;
begin
  Result := Self;
  FRequest.AddParam(aKey, aValue);
end;

function TRequest.BaseURL(const AValue: string): IRequest;
begin
  Result := Self;
  FRequest.BaseURL(aValue);
end;

function TRequest.ClearBody: IRequest;
begin
  Result := Self;
  FRequest.ClearBody;
end;

function TRequest.ClearParams: IRequest;
begin
  Result := Self;
  FRequest.ClearParams;
end;

constructor TRequest.Create;
begin
  FRequest := RestRequest4D.TRequest.New;
  SetUpHooks;
end;

function TRequest.Delete: IResponse;
begin
  Result := Execute(TRESTRequestMethod.rmDELETE);
end;

destructor TRequest.Destroy;
begin
  FRequest := nil;
  inherited;
end;

procedure TRequest.DoBeforeExecute;
begin
  if not TSession.GetInstance.Token.Access.Trim.IsEmpty then
    FRequest.Token('bearer ' + TSession.GetInstance.Token.Access);
end;

function TRequest.Execute(const AMethod: TRESTRequestMethod): IResponse;
begin
  DoBeforeExecute;

  case aMethod of
    rmPOST:   Result := FRequest.Post;
    rmPUT:    Result := FRequest.Put;
    rmGET:    Result := FRequest.Get;
    rmDELETE: Result := FRequest.Delete;
    rmPATCH:  Result := FRequest.Patch;
  end;

  if Result.StatusCode = 201 then
    if RenovarToken then
      Execute(AMethod);

  FRequest.ClearParams;
end;

function TRequest.Get: IResponse;
begin
  Result := Execute(TRESTRequestMethod.rmGET);
end;

class function TRequest.New: iRequest;
begin
  Result := Self.Create;
end;

function TRequest.Post: IResponse;
begin
  Result := Execute(TRESTRequestMethod.rmPOST);
end;

function TRequest.Put: IResponse;
begin
  Result := Execute(TRESTRequestMethod.rmPUT);
end;

function TRequest.RenovarToken: Boolean;
var
  lResponse: IResponse;
begin
  lResponse := FRequest
    .Token('bearer ' + TSession.GetInstance.Token.Refresh)
    .Resource('refresh')
    .Get;
  Result := (LResponse.StatusCode = 200);
  if Result then
    TSession.GetInstance.Token.Access := LResponse.JSONValue.GetValue<string>('access');
end;

function TRequest.Resource(const AValue: string): IRequest;
begin
  FRequest.Resource(AValue);
  Result := Self;
end;

function TRequest.ResourceSuffix(const AValue: string): IRequest;
begin
  FRequest.ResourceSuffix(AValue);
  Result := Self;
end;

function TRequest.SetUpHooks: iRequest;
var
  FIniConfig: TIniFile;
  lUrl, lPorta: String;
begin
  FIniConfig := TIniFile.Create(TPath.GetDirectoryName(ParamStr(0))+'\Config.ini');
  try
    lUrl   := FIniConfig.ReadString('SERVIDOR','Url', 'http://localhost:');
    lPorta := FIniConfig.ReadString('SERVIDOR','Porta', '9000/');

    BaseURL(lUrl+lPorta);
  finally
    FIniConfig.Free;
  end;
end;

end.
