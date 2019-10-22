unit Financas.Model.Connections.Factory.Connection;

interface

uses Financas.Model.Connections.Interfaces, Financas.Model.Connections.ConnectionFiredac;

Type
     TModelConnectionFactoryConnections = class(TInterfacedObject, iModelFactoryConnection)
     private
     public
          constructor Create;
          destructor Destroy; override;
          class function New: iModelFactoryConnection;
          function ConnectionFiredac: iModelConnection;
     end;

implementation

{ TModelConnectionFactoryConnections }

function TModelConnectionFactoryConnections.ConnectionFiredac: iModelConnection;
begin
     Result := TModelConnectionFiredac.New;
end;

constructor TModelConnectionFactoryConnections.Create;
begin

end;

destructor TModelConnectionFactoryConnections.Destroy;
begin
     inherited;
end;

class function TModelConnectionFactoryConnections.New: iModelFactoryConnection;
begin
     Result := Self.Create;
end;

end.
