unit Financas.Controller.Listbox.Itens.Cliente;

interface

uses Financas.Controller.Interfaces, FMX.Listbox, System.Classes, FMX.Types;

type
     TControllerListboxItensCliente = class(TInterfacedObject, iControllerListboxItensForm)
     public
          constructor Create;
          destructor Destroy; override;
          class function New: iControllerListboxItensForm;
          function Show: TFMXObject;
          procedure OnClick(Sender: TObject);
     end;

implementation

uses Financas.Controller.Listbox.Itens.Factory,
  Financas.Controller.Forms.Default;

{ TControllerListboxItensCliente }

constructor TControllerListboxItensCliente.Create;
begin

end;

destructor TControllerListboxItensCliente.Destroy;
begin
     inherited;
end;

class function TControllerListboxItensCliente.New: iControllerListboxItensForm;
begin
     Result := Self.Create;
end;

procedure TControllerListboxItensCliente.OnClick(Sender: TObject);
begin
     TControllerFormsDefault.CreateForm('TViewCliente');
end;

function TControllerListboxItensCliente.Show: TFMXObject;
begin
     Result := TControllerListboxItensFactory.New
                    .Default
                    .Name('btnCliente')
                    .Text('Clientes')
                    .OnClick(OnClick)
                    .Item;
end;

end.
