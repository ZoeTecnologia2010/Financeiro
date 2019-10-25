unit Financas.Model.Connection.Query;

interface

uses Financas.Model.Connection.Interfaces, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

Type
     TModelConnectionQuery = class(TInterfacedObject, iModelQuery)
     private
          FQuery: TFDMemTable;
     public
          constructor Create;
          destructor Destroy; override;
          class function New: iModelQuery;
          function Query: TDataSet;
     end;

implementation

uses System.SysUtils;

{ TModelConnectionQuery }

constructor TModelConnectionQuery.Create;
begin
     FQuery := TFDMemTable.Create(nil);
end;

destructor TModelConnectionQuery.Destroy;
begin
     FreeAndNil(FQuery);
     //
     inherited;
end;

class function TModelConnectionQuery.New: iModelQuery;
begin
     Result := Self.Create;
end;

function TModelConnectionQuery.Query: TDataSet;
begin
     Result := FQuery;
end;

end.
