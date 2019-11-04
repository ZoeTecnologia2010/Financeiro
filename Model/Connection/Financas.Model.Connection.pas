unit Financas.Model.Connection;

interface

uses Data.DB, Datasnap.DBClient, Financas.Model.Connection.Interfaces,
     FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
     FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait, FireDAC.Stan.ExprFuncs, FireDAC.Phys.SQLiteDef, FireDAC.Phys.SQLite, FireDAC.Comp.UI,
     FireDAC.Comp.Client,
     // ormbr
     ormbr.factory.firedac, ormbr.container.fdmemtable, ormbr.factory.interfaces, ormbr.dml.generator.sqlite, ormbr.container.clientdataset, ormbr.container.dataset.interfaces, ormbr.criteria, ormbr.container.objectset, ormbr.container.objectset.interfaces, ormbr.factory.sqlite3, SQLiteTable3;

type
     TModelConnection = class(TInterfacedObject, iModelConnection)
     private
          FConnection: TFDConnection;
          oConn: IDBConnection;
     public
          constructor Create;
          destructor Destroy; override;
          class function New: iModelConnection;
          function Connection: TCustomConnection;
          function SQL(SQLCommand: String): TDataSet;
     end;

implementation

uses Financas.Controller.IniFile.Factory, System.SysUtils;

{ TModelConnection }

function ConvertToDataSet(LResultSet: IDBResultSet): TDataSet;
var
     LClientDataSet: TClientDataSet;
     LDataSet: TDataSet;
     Contador: Integer;
begin
     LClientDataSet := TClientDataSet.Create(nil);
     //
     try
          LClientDataSet.Close;
          LClientDataSet.FieldDefs.Clear;
          LClientDataSet.FieldDefs := LResultSet.FieldDefs;
          LClientDataSet.CreateDataSet;
          //
          LClientDataSet.Open;
          //
          while LResultSet.NotEof do
          begin
               LClientDataSet.Insert;
               //
               for Contador := 0 to LClientDataSet.FieldCount-1 do
                    LClientDataSet.Fields[Contador].Value := LResultSet.FieldByName(LClientDataSet.Fields[Contador].FieldName).Value;
               //
               LClientDataSet.Post;
          end;
          //
          LDataSet := LClientDataSet;
          //
          //LClientDataSet.Free;
     finally
          Result := LDataSet;
     end;
end;

function TModelConnection.Connection: TCustomConnection;
begin
     Result := FConnection;
end;

constructor TModelConnection.Create;
begin
     FConnection := TFDConnection.Create(nil);
     FConnection.Params.DriverID := TControllerIniFileFactory.New.DriverID;
     FConnection.Params.Database := TControllerIniFileFactory.New.Database;
end;

destructor TModelConnection.Destroy;
begin
     FreeAndNil(FConnection);
     //
     inherited;
end;

class function TModelConnection.New: iModelConnection;
begin
     Result := Self.Create;
end;

function TModelConnection.SQL(SQLCommand: String): TDataSet;
var
     LResultSet: IDBResultSet;
     LDataSet: TDataSet;
begin
     oConn := TFactoryFireDAC.Create(FConnection, dnSQLite);
     //
     try
          LResultSet := oConn.CreateResultSet(SQLCommand);
          //
          LDataSet := ConvertToDataSet(LResultSet);
     finally
          Result := LDataSet;
     end;
end;

end.
