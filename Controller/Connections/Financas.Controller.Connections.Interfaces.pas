unit Financas.Controller.Connections.Interfaces;

interface

uses ormbr.container.dataset.interfaces, ormbr.factory.interfaces, ormbr.container.clientdataset, ormbr.factory.sqlite3, SQLiteTable3;

type

  iControllerFactoryConnection = interface
    ['{5EBF8D54-0A15-4A32-A123-D78C2DEF7E98}']
    function Connection : IDBConnection;
  end;

implementation

end.
