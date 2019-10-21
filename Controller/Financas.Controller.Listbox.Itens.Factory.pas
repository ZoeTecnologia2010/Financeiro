unit Financas.Controller.Listbox.Itens.Factory;

interface

uses Financas.Controller.Interfaces;

type
     TControllerListboxItensFactory = class(TInterfacedObject, iControllerListboxItensFactory)
          constructor Create;
          destructor Destroy; override;
          class function New: iControllerListboxItensFactory;
     end;

implementation

{ TControllerListboxItensFactory }

constructor TControllerListboxItensFactory.Create;
begin

end;

destructor TControllerListboxItensFactory.Destroy;
begin
     inherited;
end;

class function TControllerListboxItensFactory.New: iControllerListboxItensFactory;
begin
     Result := Self.Create;
end;

end.
