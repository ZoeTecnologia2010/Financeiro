unit Financas.Model.Connections.ConnectionFiredac;

interface

uses Financas.Model.Connections.Interfaces, FireDAC.Comp.Client, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.FMXUI.Wait, FireDAC.Phys.FBDef, FireDAC.Phys.IBBase, FireDAC.Phys.FB, FireDAC.Comp.UI, Data.DB, FireDAC.DApt,
     FireDAC.Stan.ExprFuncs, FireDAC.Phys.SQLiteDef, FireDAC.Phys.SQLite;

Type
     TModelConnectionFiredac = class(TInterfacedObject, iModelConnection, iModelConnectionParams)
     private
          FConnection: TFDConnection;
          FDGUIxWaitCursor1: TFDGUIxWaitCursor;
          FDPhysFBDriverLink1: TFDPhysFBDriverLink;
          FDatabase: String;
          FUserName: String;
          FPassword: String;
          FDriverID: String;
          FServer: String;
          FPorta: Integer;
          procedure ReadParams;
     public
          constructor Create;
          destructor Destroy; override;
          class function New: iModelConnection;
          function EndConnection: TComponent;
          function Database(Value: String): iModelConnectionParams;
          function UserName(Value: String): iModelConnectionParams;
          function Password(Value: String): iModelConnectionParams;
          function DriverID(Value: String): iModelConnectionParams;
          function Server(Value: String): iModelConnectionParams;
          function Porta(Value: Integer): iModelConnectionParams;
          function EndParams: iModelConnection;
          function Params: iModelConnectionParams;
          function Conectar: iModelConnection;
     end;

implementation

uses System.SysUtils;

{ TModelConnectionFiredac }

function TModelConnectionFiredac.Conectar: iModelConnection;
begin
     Result := Self;
     //
     ReadParams;
     //
     try
          FConnection.LoginPrompt := False;
          FConnection.Connected := True;
     except
          on E: Exception do
               raise Exception.Create(E.Message);
     end;
end;

constructor TModelConnectionFiredac.Create;
begin
     FConnection := TFDConnection.Create(nil);
     FDGUIxWaitCursor1 := TFDGUIxWaitCursor.Create(nil);
     FDPhysFBDriverLink1 := TFDPhysFBDriverLink.Create(nil);
end;

function TModelConnectionFiredac.Database(Value: String): iModelConnectionParams;
begin
     Result := Self;
     //
     FDatabase := Value;
end;

destructor TModelConnectionFiredac.Destroy;
begin
     FDGUIxWaitCursor1.Free;
     FDPhysFBDriverLink1.Free;
     FConnection.Free;
     //
     inherited;
end;

function TModelConnectionFiredac.DriverID(Value: String): iModelConnectionParams;
begin
     Result := Self;
     //
     FDriverID := Value;
end;

function TModelConnectionFiredac.EndConnection: TComponent;
begin
     Result := FConnection;
end;

function TModelConnectionFiredac.EndParams: iModelConnection;
begin
     Result := Self;
end;

procedure TModelConnectionFiredac.ReadParams;
begin
     FConnection.Params.Database := FDatabase;
     FConnection.Params.UserName := FUserName;
     FConnection.Params.Password := FPassword;
     FConnection.Params.DriverID := FDriverID;
     FConnection.Params.Add('Server=' + FServer);
     FConnection.Params.Add('Port=' + IntToStr(FPorta));
end;

class function TModelConnectionFiredac.New: iModelConnection;
begin
     Result := Self.Create;
end;

function TModelConnectionFiredac.Params: iModelConnectionParams;
begin
     Result := Self;
end;

function TModelConnectionFiredac.Password(Value: String): iModelConnectionParams;
begin
     Result := Self;
     //
     FPassword := Value;
end;

function TModelConnectionFiredac.Porta(Value: Integer): iModelConnectionParams;
begin
     Result := Self;
     //
     FPorta := Value;
end;

function TModelConnectionFiredac.Server(Value: String): iModelConnectionParams;
begin
     Result := Self;
     //
     FServer := Value;
end;

function TModelConnectionFiredac.UserName(Value: String): iModelConnectionParams;
begin
     Result := Self;
     //
     FUserName := Value;
end;

end.
