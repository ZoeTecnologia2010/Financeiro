unit Financas.Controller.ApplicationInfo.Factory;

interface

uses Financas.Controller.Interfaces, Financas.Model.ApplicationInfo;

type

     TControllerApplicationInfoFactory = class(TInterfacedObject, iControllerApplicationInfoFactory)
          ApplicationInfo: TModelApplicationInfo;
          constructor Create;
          destructor Destroy; override;
          class function New: iControllerListboxFactory;
     end;

implementation

{ TControllerApplicationInfoFactory }

constructor TControllerApplicationInfoFactory.Create;
begin
     ApplicationInfo := TModelApplicationInfo.Create;
end;

destructor TControllerApplicationInfoFactory.Destroy;
begin
     inherited;
end;

class function TControllerApplicationInfoFactory.New: iControllerListboxFactory;
begin
     Self.Create;
end;

end.
