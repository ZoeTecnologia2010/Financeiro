unit Financas.Model.Entity.Factory;

interface

uses Financas.Model.Entity.Interfaces, Financas.Model.Connections.Interfaces, Financas.Model.Entity.Produtos;

Type
     TModelEntityFactory = class(TInterfacedObject, iModelEntityFactory)
     private
     public
          constructor Create;
          destructor Destroy; override;
          class function New: iModelEntityFactory;
          function Produtos(DataSet: iModelDataSet): iModelEntity;
          function Clientes(DataSet: iModelDataSet): iModelEntity;
     end;

implementation

{ TModelEntityFactory }

uses Financas.Model.Entity.Clientes;

function TModelEntityFactory.Clientes(DataSet: iModelDataSet): iModelEntity;
begin
     Result := TModelEntityCliente.New(DataSet);
end;

constructor TModelEntityFactory.Create;
begin

end;

destructor TModelEntityFactory.Destroy;
begin
     inherited;
end;

class function TModelEntityFactory.New: iModelEntityFactory;
begin
     Result := Self.Create;
end;

function TModelEntityFactory.Produtos(DataSet: iModelDataSet): iModelEntity;
begin
     Result := TModelEntityProdutos.New(DataSet);
end;

end.
