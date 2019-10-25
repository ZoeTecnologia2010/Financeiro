unit Financas.Model.DAO.Interfaces;

interface

uses Data.DB;

type
     iModelDAO<T> = interface
          ['{5BD503C2-17E6-4B24-980C-529989E9F1EF}']
          function DataSet(aValue: TDataSource): iModelDAO<T>; overload;
          function DataSet(aValue: TDataSet): iModelDAO<T>; overload;
          function Open: iModelDAO<T>;
          function ApplyUpdate: iModelDAO<T>;
          function Save: iModelDAO<T>;
          function _this: iModelDAO<T>;
          function _newthis: iModelDAO<T>;
     end;

implementation

end.
