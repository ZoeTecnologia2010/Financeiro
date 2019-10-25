unit Financas.Model.Connection.Interfaces;

interface

uses Data.DB;

type
     iModelConnection = interface
          ['{50A4403C-7DBF-48E7-AE77-9368249643ED}']
          function Connection: TCustomConnection;
     end;

     iModelQuery = interface
          ['{E28E3388-34D3-4497-830B-D3BC351D711C}']
          function Query: TDataSet;
     end;

     iModelConnectionFactory = interface
          ['{5EBF8D54-0A15-4A32-A123-D78C2DEF7E98}']
          function Connection: iModelConnection;
          function Query: iModelQuery;
     end;

implementation

end.
