unit Financas.Model.IniFile;

interface

uses Financas.Model.Interfaces;

type
     TModelIniFile = class(TInterfacedObject, iModelIniFile)
     private
          FDatabase: String;
          FUserName: String;
          FPassword: String;
          FDriverID: String;
          FServer: String;
          FPort: String;
          procedure SetDatabase(const Value: String);
          procedure SetUserName(const Value: String);
          procedure SetPassword(const Value: String);
          procedure SetDriverID(const Value: String);
          procedure SetServer(const Value: String);
          procedure SetPort(const Value: String);
     published
          property Database: String read FDatabase write SetDatabase;
          property UserName: String read FUserName write SetUserName;
          property Password: String read FPassword write SetPassword;
          property DriverID: String read FDriverID write SetDriverID;
          property Server: String read FServer write SetServer;
          property Port: String read FPort write SetPort;
          constructor Create;
          destructor Destroy; override;
          class function New: iModelIniFile;
     end;

implementation

{ TModelIniFile }

uses Winapi.Windows, System.SysUtils, System.Classes, Math, FMX.Forms;

function GetFileInfo(FileName, KeyName: String): String;
begin
     Result := 'X-' + KeyName + '-X';
end;

constructor TModelIniFile.Create;
var
     FileName: String;
begin
     FileName := Application.Title + '.INI';
     //
     SetDatabase(GetFileInfo(FileName, 'Database'));
     SetUserName(GetFileInfo(FileName, 'UserName'));
     SetPassword(GetFileInfo(FileName, 'Password'));
     SetDriverID(GetFileInfo(FileName, 'DriverID'));
     SetServer(GetFileInfo(FileName, 'Server'));
     SetPort(GetFileInfo(FileName, 'Port'));
end;

destructor TModelIniFile.Destroy;
begin
     inherited;
end;

class function TModelIniFile.New: iModelIniFile;
begin
     Result := Self.Create;
end;

procedure TModelIniFile.SetDatabase(const Value: String);
begin
     FDatabase := Value;
end;

procedure TModelIniFile.SetUserName(const Value: String);
begin
     FUserName := Value;
end;

procedure TModelIniFile.SetPassword(const Value: String);
begin
     FPassword := Value;
end;

procedure TModelIniFile.SetDriverID(const Value: String);
begin
     FDriverID := Value;
end;

procedure TModelIniFile.SetServer(const Value: String);
begin
     FServer := Value;
end;

procedure TModelIniFile.SetPort(const Value: String);
begin
     FPort := Value;
end;

end.
