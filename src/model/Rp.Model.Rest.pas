unit Rp.Model.Rest;

interface

uses
  RESTRequest4D,
  System.IniFiles,
  System.IOUtils;

var
  FPorta : String;
  FUrl : String;
  FPortaAuth : String;
  FUrlAuth : String;

  procedure DefinePortas;

  function ConnRequest : iRequest;

implementation

procedure DefinePortas;
var
  FIniConfig: TIniFile;
begin
  FIniConfig := TIniFile.Create(TPath.GetDirectoryName(ParamStr(0))+'\Config.ini');
  FUrl       := FIniConfig.ReadString('SERVIDOR','Url', 'http://localhost:');
  FPorta     := FIniConfig.ReadString('SERVIDOR','Porta', '9000/');
end;

function ConnRequest : iRequest;
var
  FRequest : iRequest;
begin
  FRequest := TRequest.New;

  FRequest.BaseURL(FURL+FPorta);

  Result := FRequest;
end;

end.
