unit Financas.Controller.Connections.Factory.DataSet;

interface

uses Financas.Controller.Connections.Interfaces, Financas.Model.Connections.Interfaces,
  Financas.Model.Connections.Factory.DataSet;

Type
  TControllerConnectionsFactoryDataSet = class(TInterfacedObject, iControllerFactoryDataSet)
    private
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iControllerFactoryDataSet;
      function DataSet(Connection : iModelConnection) : iModelDataSet;
  end;

implementation

{ TControllerConnectionsFactoryDataSet }

constructor TControllerConnectionsFactoryDataSet.Create;
begin

end;

function TControllerConnectionsFactoryDataSet.DataSet(Connection : iModelConnection) : iModelDataSet;
begin
  Result := TModelConnectionFactoryDataSet.New.DataSetFiredac(Connection);
end;

destructor TControllerConnectionsFactoryDataSet.Destroy;
begin

  inherited;
end;

class function TControllerConnectionsFactoryDataSet.New: iControllerFactoryDataSet;
begin
  Result := Self.Create;
end;

end.
