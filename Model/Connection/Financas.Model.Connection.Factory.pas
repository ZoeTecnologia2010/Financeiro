unit Financas.Model.Connection.Factory;

interface

uses Financas.Model.Connection.Interfaces, ormbr.container.dataset.interfaces, ormbr.factory.interfaces, ormbr.container.clientdataset, ormbr.factory.sqlite3, SQLiteTable3;

Type
     TModelConnectionFactory = class(TInterfacedObject, iModelConnectionFactory)
     private
         FDatabase: TSQLiteDatabase;
         oConn: IDBConnection;
     public
          constructor Create;
          destructor Destroy; override;
          class function New: iModelConnectionFactory;
          function Connection: IDBConnection;
     end;

implementation

uses System.SysUtils, Financas.Controller.IniFile.Factory;

{ TControllerConnectionsFactoryConnection }

function TModelConnectionFactory.Connection: IDBConnection;
begin
     Result := oConn;
end;

constructor TModelConnectionFactory.Create;
begin
     FDatabase := TSQLiteDatabase.Create;
     FDatabase.Filename := TControllerIniFileFactory.New.Database;
     //
     oConn := TFactorySQLite.Create(FDatabase, dnSQLite);
end;

destructor TModelConnectionFactory.Destroy;
begin
     FDatabase.Free;
     //
     inherited;
end;

class function TModelConnectionFactory.New: iModelConnectionFactory;
begin
     Result := Self.Create;
end;

end.
