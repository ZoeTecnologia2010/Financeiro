unit Financas.Controller.Analytic.Factory;

interface

uses Financas.Controller.Analytic.Interfaces, Financas.Model.Analytic;

type
     TControllerAnalyticFactory = class(TInterfacedObject, iControllerAnalyticFactory)
     private
          FVersion: String;
          FTrackingID: String;
          FClientID: String;
          FAppName: String;
          FUserID: String;
          FUserAgent: String;
          FAppVersion: String;
          FScreenResolution: String;
          FSource: String;
          FReference: String;
          FAnalytic: TModelAnalytic;
     public
          constructor Create;
          destructor Destroy; override;
          class function New: iControllerAnalyticFactory;
          procedure GetPage(aScreenName, aDescription: String);
          procedure GetEvent(aCategory, aAction, aLabel: String);
     end;

implementation

{ TControllerIniFileFactory }

uses System.SysUtils, FMX.Forms;

constructor TControllerAnalyticFactory.Create;
begin
     FVersion := '1';
     FTrackingID := 'UA-128990494-3';
     FClientID := '555';
     FSource := 'App';
     //
     FAppName := 'AppFinancas';
     FReference := 'http://www.zoetecnologia.com.br';
     //
     FUserID := 'developer';
     FUserAgent := 'Windows 10';
     FAppVersion := '1.0.0.1';
     FScreenResolution := '800x600';
     //
     FAnalytic := TModelAnalytic.Create;
end;

destructor TControllerAnalyticFactory.Destroy;
begin
     FreeAndNil(FAnalytic);
     //
     inherited;
end;

procedure TControllerAnalyticFactory.GetEvent(aCategory, aAction, aLabel: String);
begin
     FAnalytic.RegisterEvent(FVersion, FTrackingID, FClientID, aCategory, aAction, aLabel, '1');
end;

procedure TControllerAnalyticFactory.GetPage(aScreenName, aDescription: String);
begin
     FAnalytic.RegisterPage(FVersion, FTrackingID, FClientID, FAppName, aScreenName, aDescription, FUserID, FUserAgent, FAppVersion, FScreenResolution, FSource, FReference);
end;

class function TControllerAnalyticFactory.New: iControllerAnalyticFactory;
begin
     Result := Self.Create;
end;

end.
