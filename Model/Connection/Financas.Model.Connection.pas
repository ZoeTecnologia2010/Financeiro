unit Financas.Model.Connection;

interface

uses Financas.Model.Connection.Interfaces,
     FireDAC.Stan.Intf, FireDAC.Stan.Option,
     FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
     FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
     FireDAC.Stan.ExprFuncs, FireDAC.Phys.SQLiteDef, FireDAC.Phys.SQLite,
     FireDAC.Comp.UI, FireDAC.Comp.Client, Data.DB;

type
     TModelConnection = class(TInterfacedObject, iModelConnection)
     private
          FConnection: TFDConnection;
     public
          constructor Create;
          destructor Destroy; override;
          class function New: iModelConnection;
          function Connection: TCustomConnection;
     end;

implementation

uses Financas.Controller.IniFile.Factory, System.SysUtils;

{ TModelConnection }

function TModelConnection.Connection: TCustomConnection;
begin
     Result := FConnection;
end;

constructor TModelConnection.Create;
begin
     FConnection := TFDConnection.Create(nil);
     FConnection.Params.DriverID := TControllerIniFileFactory.New.DriverID;
     FConnection.Params.Database := TControllerIniFileFactory.New.Database;
end;

destructor TModelConnection.Destroy;
begin
     FreeAndNil(FConnection);
     //
     inherited;
end;

class function TModelConnection.New: iModelConnection;
begin
     Result := Self.Create;
end;

end.
