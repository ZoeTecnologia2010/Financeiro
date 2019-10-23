unit Financas.Controller.Entity.Factory;

interface

uses Financas.Controller.Entity.Interfaces;

Type
     TControllerEntityFactory = class(TInterfacedObject, iControllerEntityFactory)
     private
     public
          constructor Create;
          destructor Destroy; override;
          class function New: iControllerEntityFactory;
          function Produto: iControllerEntity;
          function Cliente: iControllerEntity;
     end;

implementation

{ TControllerEntityFactory }

uses Financas.Controller.Entity.Cliente, Financas.Controller.Entity.Produto;

function TControllerEntityFactory.Cliente: iControllerEntity;
begin
     Result := TControllerEntityCliente.New;
end;

constructor TControllerEntityFactory.Create;
begin

end;

destructor TControllerEntityFactory.Destroy;
begin
     inherited;
end;

class function TControllerEntityFactory.New: iControllerEntityFactory;
begin
     Result := Self.Create;
end;

function TControllerEntityFactory.Produto: iControllerEntity;
begin
     Result := TControllerEntityProduto.New;
end;

end.
