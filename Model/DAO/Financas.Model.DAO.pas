unit Financas.Model.DAO;

interface

uses Financas.Model.DAO.Interfaces, Financas.Model.Connection.Interfaces, Data.DB,
     // ormbr
     ormbr.factory.interfaces, ormbr.dml.generator.sqlite, ormbr.container.clientdataset, ormbr.container.dataset.interfaces, ormbr.criteria, ormbr.container.objectset, ormbr.container.objectset.interfaces, ormbr.factory.sqlite3, SQLiteTable3;

type
     TModelDAO<T: class, constructor> = class(TInterfacedObject, iModelDAO<T>)
     private
          FConnection: iModelConnection;
          FQuery: iModelQuery;
          oConn: IDBConnection;
          oContainer: IContainerDataSet<T>;
     public
          constructor Create;
          destructor Destroy; override;
          class function New: iModelDAO<T>;
          function DataSet(aValue: TDataSource): iModelDAO<T>; overload;
          function DataSet(aValue: TDataSet): iModelDAO<T>; overload;
          function Open: iModelDAO<T>;
          function ApplyUpdate: iModelDAO<T>;
          function Save: iModelDAO<T>;
          function _this: iModelDAO<T>;
          function _newthis: iModelDAO<T>;
     end;

implementation

uses Financas.Model.Connection.Factory;

{ TModelDAO }

function TModelDAO<T>.ApplyUpdate: iModelDAO<T>;
begin

end;

constructor TModelDAO<T>.Create;
begin
     FConnection := TModelConnectionFactory.New.Connection;
     //
     //oConn := TFactoryFireDAC.Create(FConnection, dnSQLite);
     //
     FQuery := TModelConnectionFactory.New.Query;
     //
     //oContainer := TContainerClientDataSet<T>.Create(oConn, FQuery);
end;

function TModelDAO<T>.DataSet(aValue: TDataSource): iModelDAO<T>;
begin

end;

function TModelDAO<T>.DataSet(aValue: TDataSet): iModelDAO<T>;
begin

end;

destructor TModelDAO<T>.Destroy;
begin
     inherited;
end;

class function TModelDAO<T>.New: iModelDAO<T>;
begin

end;

function TModelDAO<T>.Open: iModelDAO<T>;
begin

end;

function TModelDAO<T>.Save: iModelDAO<T>;
begin

end;

function TModelDAO<T>._newthis: iModelDAO<T>;
begin

end;

function TModelDAO<T>._this: iModelDAO<T>;
begin

end;

end.
