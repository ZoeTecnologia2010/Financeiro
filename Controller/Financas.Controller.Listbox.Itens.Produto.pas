unit Financas.Controller.Listbox.Itens.Produto;

interface

uses Financas.Controller.Interfaces, FMX.Listbox, System.Classes, FMX.Types;

type
     TControllerListboxItensProduto = class(TInterfacedObject, iControllerListboxItensForm)
     public
          constructor Create;
          destructor Destroy; override;
          class function New: iControllerListboxItensForm;
          function Show: TFMXObject;
     end;

implementation

uses Financas.Controller.Listbox.Itens.Factory;

{ TControllerListboxItensProduto }

constructor TControllerListboxItensProduto.Create;
begin

end;

destructor TControllerListboxItensProduto.Destroy;
begin
     inherited;
end;

class function TControllerListboxItensProduto.New: iControllerListboxItensForm;
begin
     Result := Self.Create;
end;

function TControllerListboxItensProduto.Show: TFMXObject;
begin
     Result := TControllerListboxItensFactory.New
                    .Default
                    .Name('btnProduto')
                    .Text('Produtos')
                    .Item;
end;

end.
