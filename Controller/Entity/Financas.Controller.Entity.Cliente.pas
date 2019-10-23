unit Financas.Controller.Entity.Cliente;

interface

uses Financas.Controller.Entity.Interfaces, Financas.Model.Connections.Interfaces, Financas.Controller.Connections.Factory.Connection, Financas.Controller.Connections.Factory.DataSet, Financas.Model.Entity.Interfaces, Financas.Model.Entity.Factory, Data.DB;

Type
     TControllerEntityCliente = class(TInterfacedObject, iControllerEntity)
     private
          FConnection: iModelConnection;
          FDataSet: iModelDataSet;
          FEntity: iModelEntity;
     public
          constructor Create;
          destructor Destroy; override;
          class function New: iControllerEntity;
          function Lista(aDataSource: TDataSource): iControllerEntity;
     end;

implementation

{ TControllerEntityCliente }

constructor TControllerEntityCliente.Create;
begin
     FConnection := TControllerConnectionsFactoryConnection.New.Connection;
     FDataSet := TControllerConnectionsFactoryDataSet.New.DataSet(FConnection);
     FEntity := TModelEntityFactory.New.Clientes(FDataSet);
end;

destructor TControllerEntityCliente.Destroy;
begin
     inherited;
end;

function TControllerEntityCliente.Lista(aDataSource: TDataSource): iControllerEntity;
begin
     Result := Self;
     //
     aDataSource.DataSet := TDataSet(FEntity.Listar);
end;

class function TControllerEntityCliente.New: iControllerEntity;
begin
     Result := Self.Create;
end;

end.
