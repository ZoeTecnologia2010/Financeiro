unit Financas.Controller.Entity.Produtos;

interface

uses Financas.Controller.Entity.Interfaces, Financas.Model.Connections.Interfaces, Financas.Controller.Connections.Factory.Connection, Financas.Controller.Connections.Factory.DataSet, Financas.Model.Entity.Interfaces, Financas.Model.Entity.Factory, Data.DB;

Type
     TControllerEntityProdutos = class(TInterfacedObject, iControllerEntity)
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

{ TControllerEntityProdutos }

constructor TControllerEntityProdutos.Create;
begin
     FConnection := TControllerConnectionsFactoryConnection.New.Connection;
     FDataSet := TControllerConnectionsFactoryDataSet.New.DataSet(FConnection);
     FEntity := TModelEntityFactory.New.Produtos(FDataSet);
end;

destructor TControllerEntityProdutos.Destroy;
begin

     inherited;
end;

function TControllerEntityProdutos.Lista(aDataSource: TDataSource): iControllerEntity;
begin
     Result := Self;
     aDataSource.DataSet := TDataSet(FEntity.Listar);
end;

class function TControllerEntityProdutos.New: iControllerEntity;
begin
     Result := Self.Create;
end;

end.
