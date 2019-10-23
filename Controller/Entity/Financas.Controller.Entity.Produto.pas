unit Financas.Controller.Entity.Produto;

interface

uses Financas.Controller.Entity.Interfaces, Financas.Model.Connections.Interfaces, Financas.Controller.Connections.Factory.Connection, Financas.Controller.Connections.Factory.DataSet, Financas.Model.Entity.Interfaces, Financas.Model.Entity.Factory, Data.DB;

Type
     TControllerEntityProduto = class(TInterfacedObject, iControllerEntity)
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

constructor TControllerEntityProduto.Create;
begin
     FConnection := TControllerConnectionsFactoryConnection.New.Connection;
     FDataSet := TControllerConnectionsFactoryDataSet.New.DataSet(FConnection);
     FEntity := TModelEntityFactory.New.Produtos(FDataSet);
end;

destructor TControllerEntityProduto.Destroy;
begin

     inherited;
end;

function TControllerEntityProduto.Lista(aDataSource: TDataSource): iControllerEntity;
begin
     Result := Self;
     //
     aDataSource.DataSet := TDataSet(FEntity.Listar);
end;

class function TControllerEntityProduto.New: iControllerEntity;
begin
     Result := Self.Create;
end;

end.
