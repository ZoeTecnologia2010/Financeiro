unit Financas.Controller.Connections.Factory.Connection;

interface

uses Financas.Controller.Connections.Interfaces, Financas.Model.Connections.Interfaces, Financas.Model.Connections.Factory.Connection;

Type
     TControllerConnectionsFactoryConnection = class(TInterfacedObject, iControllerFactoryConnection)
     private
     public
          constructor Create;
          destructor Destroy; override;
          class function New: iControllerFactoryConnection;
          function Connection: iModelConnection;
     end;

implementation

uses System.SysUtils, Financas.Controller.IniFiles.Factory;

{ TControllerConnectionsFactoryConnection }

function TControllerConnectionsFactoryConnection.Connection: iModelConnection;
var
     Connection: Integer;
begin
     Connection := 0;
     //
     case Connection of
          0: Result := TModelConnectionFactoryConnections.New
                         .ConnectionFiredac
                         .Params
                              .Database(TControllerIniFileFactory.New.Database)
                              .UserName(TControllerIniFileFactory.New.UserName)
                              .Password(TControllerIniFileFactory.New.Password)
                              .DriverID(TControllerIniFileFactory.New.DriverID)
                              .Server(TControllerIniFileFactory.New.Server)
                              .Porta(StrToInt(TControllerIniFileFactory.New.Port))
                         .EndParams
                         .Conectar;

          1: raise Exception.Create('Componente de acesso não configurado');
     end;
end;

constructor TControllerConnectionsFactoryConnection.Create;
begin

end;

destructor TControllerConnectionsFactoryConnection.Destroy;
begin
     inherited;
end;

class function TControllerConnectionsFactoryConnection.New: iControllerFactoryConnection;
begin
     Result := Self.Create;
end;

end.
