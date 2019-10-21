unit Financas.Controller.Listbox.Factory;

interface

uses Financas.Controller.Interfaces;

type
     TControllerListboxFactory = class(TInterfacedObject, iControllerListboxFactory)
          constructor Create;
          destructor Destroy; override;
          class function New: iControllerListboxFactory;
     end;

implementation

{ TControllerListboxFactory }

constructor TControllerListboxFactory.Create;
begin

end;

destructor TControllerListboxFactory.Destroy;
begin

     inherited;
end;

class function TControllerListboxFactory.New: iControllerListboxFactory;
begin
     Result := Self.Create;
end;

end.
