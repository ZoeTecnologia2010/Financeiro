unit Financas.Controller.Entity.Factory;

interface

uses Datasnap.DBClient, Data.DB, Financas.Controller.Entity.Interfaces,
       /// orm factory
       ormbr.factory.interfaces,
       ormbr.dml.generator.sqlite,
       /// orm injection dependency
       ormbr.container.clientdataset,
       ormbr.container.dataset.interfaces,
       ormbr.factory.sqlite3,
       /// orm model
       Financas.Model.Entity.Produto,
       Financas.Model.Entity.Cliente,
       Financas.Model.Entity.Contrato,
       Financas.Model.Entity.ContratoParcela,
       /// SQLite
       SQLiteTable3;

Type
     TControllerEntityFactory = class(TInterfacedObject, iControllerEntityFactory)
     private
         oCliente: IContainerDataSet<TCliente>;
         oProduto: IContainerDataSet<TProduto>;
     public
         constructor Create;
         destructor Destroy; override;
         class function New: iControllerEntityFactory;
         function Cliente(cdsLocal: TClientDataSet): IContainerDataSet<TCliente>;
         function Produto(cdsLocal: TClientDataSet): IContainerDataSet<TProduto>;
     end;

implementation

uses Financas.Controller.Connections.Factory, FMX.Dialogs;

{ TControllerEntityFactory }

function TControllerEntityFactory.Cliente(cdsLocal: TClientDataSet): IContainerDataSet<TCliente>;
begin
     oCliente := TContainerClientDataSet<TCliente>.Create(TControllerConnectionsFactory.New.Connection, cdsLocal, 3);
     //
     Result := oCliente;
end;

constructor TControllerEntityFactory.Create;
begin
     //
end;

destructor TControllerEntityFactory.Destroy;
begin
     inherited;
end;

class function TControllerEntityFactory.New: iControllerEntityFactory;
begin
     Result := Self.Create;
end;

function TControllerEntityFactory.Produto(cdsLocal: TClientDataSet): IContainerDataSet<TProduto>;
begin
     oProduto:= TContainerClientDataSet<TProduto>.Create(TControllerConnectionsFactory.New.Connection, cdsLocal, 3);
     //
     Result := oProduto;
end;

end.
