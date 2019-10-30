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
          FCampaignName: String;
          FAnalytic: TModelAnalytic;
     public
          constructor Create;
          destructor Destroy; override;
          class function New: iControllerAnalyticFactory;
          procedure GetScreen(aScreenName: String);
          procedure GetEvent(aCategory, aAction, aLabel: String);
          procedure GetException(aScreenName, aException: String);
     end;

implementation

{ TControllerIniFileFactory }

uses System.SysUtils, FMX.Forms;

constructor TControllerAnalyticFactory.Create;
begin
     FVersion := '1';
     FTrackingID := 'UA-128990494-3';
     FClientID := '128990494';
     FSource := 'App';
     //
     FAppName := 'EXEMPLOS';
     FCampaignName := 'AppFinancas';
     //
     FUserID := 'Desenvolvedor';
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

procedure TControllerAnalyticFactory.GetException(aScreenName, aException: String);
begin
     FAnalytic.RegisterException(FVersion, FTrackingID, FClientID, FAppName, aScreenName, FUserID, aException, '1');
end;

procedure TControllerAnalyticFactory.GetScreen(aScreenName: String);
begin
     FAnalytic.RegisterScreen(FVersion, FTrackingID, FClientID, FAppName, aScreenName, FUserID, FUserAgent, FAppVersion, FScreenResolution, FSource, FCampaignName);
end;

class function TControllerAnalyticFactory.New: iControllerAnalyticFactory;
begin
     Result := Self.Create;
end;

end.
