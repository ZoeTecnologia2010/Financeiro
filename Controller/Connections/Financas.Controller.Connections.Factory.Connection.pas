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

uses
     System.SysUtils;

{ TControllerConnectionsFactoryConnection }

function TControllerConnectionsFactoryConnection.Connection: iModelConnection;
var
     Connection: Integer;
begin
     Connection := 0;

     case Connection of
          0: Result := TModelConnectionFactoryConnections.New
                         .ConnectionFiredac
                         .Params
                              .Database('D:\Bancos\Firebird\DIVERSOS.FDB')
                              .UserName('SYSDBA')
                              .Password('masterkey')
                              .DriverID('FB')
                              .Server('localhost')
                              .Porta(3050)
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
