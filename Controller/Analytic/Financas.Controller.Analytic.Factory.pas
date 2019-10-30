unit Financas.Controller.Analytic.Factory;

interface

uses Financas.Controller.Analytic.Interfaces, Financas.Model.Analytic;

type
     TControllerAnalyticFactory = class(TInterfacedObject, iControllerAnalyticFactory)
     private
          FAnalytic: TModelAnalytic;
     public
          constructor Create;
          destructor Destroy; override;
          class function New: iControllerAnalyticFactory;
          procedure GetScreen(aValue: String);
          procedure GetEvent(aValue: String);
     end;

implementation

{ TControllerIniFileFactory }

uses System.SysUtils;

constructor TControllerAnalyticFactory.Create;
begin
     FAnalytic := TModelAnalytic.Create;
end;

destructor TControllerAnalyticFactory.Destroy;
begin
     FreeAndNil(FAnalytic);
     //
     inherited;
end;

procedure TControllerAnalyticFactory.GetEvent(aValue: String);
begin
     FAnalytic.RegisterEvent(aValue);
end;

procedure TControllerAnalyticFactory.GetScreen(aValue: String);
begin
     FAnalytic.RegisterScreen(aValue);
end;

class function TControllerAnalyticFactory.New: iControllerAnalyticFactory;
begin
     Result := Self.Create;
end;

end.
