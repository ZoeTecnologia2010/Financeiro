unit Financas.Controller.Connections.Factory;

interface

uses Financas.Controller.Connections.Interfaces,
          // ormbr
          ormbr.container.dataset.interfaces, ormbr.factory.interfaces, ormbr.container.clientdataset, ormbr.factory.sqlite3, SQLiteTable3;

Type
     TControllerConnectionsFactory = class(TInterfacedObject, iControllerFactoryConnection)
     private
         FDatabase: TSQLiteDatabase;
         oConn: IDBConnection;
     public
          constructor Create;
          destructor Destroy; override;
          class function New: iControllerFactoryConnection;
          function Connection: IDBConnection;
     end;

implementation

uses System.SysUtils, Financas.Controller.IniFiles.Factory;

{ TControllerConnectionsFactoryConnection }

function TControllerConnectionsFactory.Connection: IDBConnection;
begin
     Result := oConn;
end;

constructor TControllerConnectionsFactory.Create;
begin
     FDatabase := TSQLiteDatabase.Create;
     FDatabase.Filename := TControllerIniFileFactory.New.Database;
     //
     oConn := TFactorySQLite.Create(FDatabase, dnSQLite);
end;

destructor TControllerConnectionsFactory.Destroy;
begin
     FDatabase.Free;
     //
     inherited;
end;

class function TControllerConnectionsFactory.New: iControllerFactoryConnection;
begin
     Result := Self.Create;
end;

end.
