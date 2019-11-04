unit Financas.Model.Connection.Interfaces;

interface

uses Data.DB;

type
     iModelConnection = interface
          ['{50A4403C-7DBF-48E7-AE77-9368249643ED}']
          function Connection: TCustomConnection;
          function SQL(SQLCommand: String): TDataSet;
     end;

     iModelQuery = interface
          ['{E28E3388-34D3-4497-830B-D3BC351D711C}']
          function Query: TDataSet;
     end;

implementation

end.
