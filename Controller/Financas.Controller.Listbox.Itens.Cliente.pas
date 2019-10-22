unit Financas.Controller.Listbox.Itens.Cliente;

interface

uses Financas.Controller.Interfaces, FMX.Listbox, System.Classes, FMX.Types;

type
     TControllerListboxItemCliente = class(TInterfacedObject, iControllerListboxItensForm)
     public
          constructor Create;
          destructor Destroy; override;
          class function New: iControllerListboxItensForm;
          function Show: TFMXObject;
     end;

implementation

uses Financas.Controller.Listbox.Itens.Factory;

{ TControllerListboxItensCliente }

constructor TControllerListboxItemCliente.Create;
begin

end;

destructor TControllerListboxItemCliente.Destroy;
begin
     inherited;
end;

class function TControllerListboxItemCliente.New: iControllerListboxItensForm;
begin
     Result := Self.Create;
end;

function TControllerListboxItemCliente.Show: TFMXObject;
begin
     Result := TControllerListboxItensFactory.New
                    .Default
                    .Name('btnCliente')
                    .Text('Clientes')
                    .Item;
end;

end.
