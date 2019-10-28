unit Financas.Model.DAO;

interface

uses Financas.Model.DAO.Interfaces, Financas.Model.Connection.Interfaces, Data.DB,
     // ormbr
     ormbr.factory.firedac, ormbr.container.fdmemtable, ormbr.factory.interfaces, ormbr.dml.generator.sqlite, ormbr.container.clientdataset, ormbr.container.dataset.interfaces, ormbr.criteria, ormbr.container.objectset, ormbr.container.objectset.interfaces, ormbr.factory.sqlite3, SQLiteTable3;

type
     TModelDAO<T: class, constructor> = class(TInterfacedObject, iModelDAO<T>)
     private
          oConn: IDBConnection;
          oContainer: IContainerDataSet<T>;
          FConnection: iModelConnection;
          FQuery: iModelQuery;
          FNewThis: T;
     public
          constructor Create;
          destructor Destroy; override;
          class function New: iModelDAO<T>;
          function DataSet(aValue: TDataSource): iModelDAO<T>; overload;
          function DataSet(aValue: TDataSet): iModelDAO<T>; overload;
          function Open: iModelDAO<T>;
          function ApplyUpdate: iModelDAO<T>;
          function Save: iModelDAO<T>;
          function _this: T;
          function _newthis: T;
     end;

implementation

uses Financas.Model.Connection.Factory;

{ TModelDAO }

function TModelDAO<T>.ApplyUpdate: iModelDAO<T>;
begin
     Result := Self;
     //
     try
          oConn.StartTransaction;
          oContainer.ApplyUpdates(0);
          oConn.Commit;
     except
          oConn.Rollback;
     end;
end;

constructor TModelDAO<T>.Create;
begin
     FConnection := TModelConnectionFactory.New.Connection;
     FQuery := TModelConnectionFactory.New.Query;
     FNewThis := nil;
     //
     oConn := TFactoryFireDAC.Create(FConnection.Connection, dnSQLite);
     oContainer := TContainerClientDataSet<T>.Create(oConn, FQuery.Query);
end;

function TModelDAO<T>.DataSet(aValue: TDataSource): iModelDAO<T>;
begin
     Result := Self;
     //
     aValue.DataSet := FQuery.Query;
end;

function TModelDAO<T>.DataSet(aValue: TDataSet): iModelDAO<T>;
begin
     Result := Self;
     //
     aValue.Assign(FQuery.Query);
end;

destructor TModelDAO<T>.Destroy;
begin
     inherited;
end;

class function TModelDAO<T>.New: iModelDAO<T>;
begin
     Result := Self.Create;
end;

function TModelDAO<T>.Open: iModelDAO<T>;
begin
     Result := Self;
     //
     oContainer.Open;
end;

function TModelDAO<T>.Save: iModelDAO<T>;
begin
     Result := Self;
     //
     oContainer.Save(FNewThis);
     //
     Self.ApplyUpdate;
     //
     FNewThis := nil;
end;

function TModelDAO<T>._newthis: T;
begin
     if FNewThis = nil then FNewThis := oContainer.Current;
     //
     Result := FNewThis;
end;

function TModelDAO<T>._this: T;
begin
     Result := oContainer.Current;
end;

end.
