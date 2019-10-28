unit Financas.Model.Connection.Query;

interface

uses Financas.Model.Connection.Interfaces, Data.DB, Datasnap.DBClient;

Type
     TModelConnectionQuery = class(TInterfacedObject, iModelQuery)
     private
          FQuery: TClientDataSet;
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
     FQuery := TClientDataSet.Create(nil);
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
