unit Rp.Model.Rest;

interface

uses
  RESTRequest4D,
  System.IniFiles,
  System.IOUtils,
  Rp.Model.Session;

var
  FPorta : String;
  FUrl : String;
  FPortaAuth : String;
  FUrlAuth : String;

  procedure DefinePortas;

  function ConnRequest( const aAuth : Boolean = True ) : iRequest;
  function AuthToken ( const aRequest : iRequest ) : IRequest;

implementation

uses
  System.SysUtils;

procedure DefinePortas;
var
  FIniConfig: TIniFile;
begin
  FIniConfig := TIniFile.Create(TPath.GetDirectoryName(ParamStr(0))+'\Config.ini');
  try
    FUrl   := FIniConfig.ReadString('SERVIDOR','Url', 'http://localhost:');
    FPorta := FIniConfig.ReadString('SERVIDOR','Porta', '9000/');
  finally
    FIniConfig.Free;
  end;
end;

function ConnRequest( const aAuth : Boolean ) : iRequest;
var
  FRequest : iRequest;
begin
  FRequest := TRequest.New;

  FRequest.BaseURL(FURL+FPorta);

  Result := FRequest;

  if aAuth then
    Result := AuthToken(FRequest);
end;

function AuthToken ( const aRequest : iRequest ) : IRequest;
begin
  if not TSession.GetInstance.Token.Access.Trim.IsEmpty then
    aRequest.Token('bearer ' + TSession.GetInstance.Token.Access);

  Result := aRequest;
end;


end.
