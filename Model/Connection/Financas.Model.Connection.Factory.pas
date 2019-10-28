unit Financas.Model.Connection.Factory;

interface

uses Financas.Model.Connection.Interfaces;

type
     TModelConnectionFactory = class(TInterfacedObject, iModelConnectionFactory)
     private

     public
          constructor Create;
          destructor Destroy; override;
          class function New: iModelConnectionFactory;
          function Connection: iModelConnection;
          function Query: iModelQuery;
     end;

implementation

uses System.SysUtils, Financas.Model.Connection, Financas.Model.Connection.Query;

{ TModelConnectionFactory }

function TModelConnectionFactory.Connection: iModelConnection;
begin
     Result := TModelConnection.New;
end;

constructor TModelConnectionFactory.Create;
begin

end;

destructor TModelConnectionFactory.Destroy;
begin
     inherited;
end;

class function TModelConnectionFactory.New: iModelConnectionFactory;
begin
     Result := Self.Create;
end;

function TModelConnectionFactory.Query: iModelQuery;
begin
     Result := TModelConnectionQuery.New;
end;

end.
