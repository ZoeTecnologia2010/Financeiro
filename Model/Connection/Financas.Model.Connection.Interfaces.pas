unit Financas.Model.Connection.Interfaces;

interface

uses ormbr.container.dataset.interfaces, ormbr.factory.interfaces;

type

  iModelConnectionFactory = interface
    ['{5EBF8D54-0A15-4A32-A123-D78C2DEF7E98}']
    function Connection : IDBConnection;
  end;

implementation

end.
