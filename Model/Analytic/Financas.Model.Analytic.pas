unit Financas.Model.Analytic;

interface

uses Financas.Model.Analytic.Interfaces, System.SysUtils, System.Classes, FMX.Forms;

type
     TModelAnalytic = class(TInterfacedObject, iModelAnalytic)
     private
          FSite: String;
          FFileAnalytic: String;
          procedure RegisterDAT(aValue: String);
          procedure RegisterAnalytic(EnvStr: TStringList);
     published
          constructor Create;
          destructor Destroy; override;
          class function New: iModelAnalytic;
          procedure RegisterScreen(aVersion, aTrackingID, aClientID, aAppName, aScreenName, aUserID, aUserAgent, aAppVersion, aScreenResolution, aSource, aCampaignName: String);
          procedure RegisterEvent(aVersion, aTrackingID, aClientID, aCategory, aAction, aLabel, aValue: String);
          procedure RegisterException(aVersion, aTrackingID, aClientID, aAppName, aScreenName, aUserID, aException, aValue: String);
     end;

implementation

{ TModelAnalytic }
{ https://developers.google.com/analytics/devguides/collection/protocol/v1/devguide?hl=pt-br }

uses IdIOHandler, IdIOHandlerSocket, IdIOHandlerStack, IdSSL, IdSSLOpenSSL, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP;

procedure TModelAnalytic.RegisterDAT(aValue: String);
var
     txtAnalytic: TextFile;
begin
     AssignFile(txtAnalytic, FFileAnalytic);
     //
     if FileExists(FFileAnalytic) then
          Append(txtAnalytic)
     else ReWrite(txtAnalytic);
     //
     WriteLn(txtAnalytic, aValue);
     //
     CloseFile(txtAnalytic);
end;

procedure TModelAnalytic.RegisterAnalytic(EnvStr: TStringList);
var
     IdHTTP: TIdHTTP;
     IdSSLIOHandlerSocketOpenSSL: TIdSSLIOHandlerSocketOpenSSL;
     sReturn, sResponse: String;
begin
     sReturn := '';
     sResponse := '';
     //
     IdSSLIOHandlerSocketOpenSSL := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
     IdHTTP := TIdHTTP.Create(nil);
     //
     try
          IdHTTP.IOHandler := IdSSLIOHandlerSocketOpenSSL;
          IdHTTP.HTTPOptions := [hoForceEncodeParams];
          IdHTTP.AllowCookies := True;
          //
          if (EnvStr.Text <> '') then
          begin
               try
                    sReturn := IdHTTP.Post(FSite, EnvStr);
                    //
                    Application.ProcessMessages;
                    //
                    sResponse := IdHTTP.ResponseText;
               except
                    on E: Exception do
                         sReturn := E.Message;
               end;
          end;
     finally
          IdHTTP.Free;
          IdSSLIOHandlerSocketOpenSSL.Free;
     end;
end;

procedure TModelAnalytic.RegisterScreen(aVersion, aTrackingID, aClientID, aAppName, aScreenName, aUserID, aUserAgent, aAppVersion, aScreenResolution, aSource, aCampaignName: String);
var
     sResponse: String;
     EnvStr: TStringList;
begin
     EnvStr := TStringList.Create;
     //
     try
          EnvStr.Clear;
          //
          EnvStr.Values['t'] := 'screenview';
          //
          EnvStr.Values['v'] := aVersion;
          EnvStr.Values['tid'] := aTrackingID;
          EnvStr.Values['cid'] := aClientID;
          EnvStr.Values['an'] := aAppName;
          EnvStr.Values['cd'] := aScreenName;
          EnvStr.Values['uid'] := aUserID;
          //
          EnvStr.Values['ua'] := aUserAgent;
          EnvStr.Values['av'] := aAppVersion;
          EnvStr.Values['sr'] := aScreenResolution;
          EnvStr.Values['ds'] := aSource;
          EnvStr.Values['cn'] := aCampaignName;
          //
          //RegisterDAT(EnvStr.Text);
          RegisterAnalytic(EnvStr);
     finally
          EnvStr.Free;
     end;
end;

procedure TModelAnalytic.RegisterEvent(aVersion, aTrackingID, aClientID, aCategory, aAction, aLabel, aValue: String);
var
     sResponse: String;
     EnvStr: TStringList;
begin
     EnvStr := TStringList.Create;
     //
     try
          EnvStr.Clear;
          //
          EnvStr.Values['t'] := 'event';
          //
          EnvStr.Values['v'] := aVersion;
          EnvStr.Values['tid'] := aTrackingID;
          EnvStr.Values['cid'] := aClientID;
          //
          EnvStr.Values['ec'] := aCategory;
          EnvStr.Values['ea'] := aAction;
          EnvStr.Values['el'] := aLabel;
          EnvStr.Values['ev'] := aValue;
          //
          //RegisterDAT(EnvStr.Text);
          RegisterAnalytic(EnvStr);
     finally
          EnvStr.Free;
     end;
end;

procedure TModelAnalytic.RegisterException(aVersion, aTrackingID, aClientID, aAppName, aScreenName, aUserID, aException, aValue: String);
var
     sResponse: String;
     EnvStr: TStringList;
begin
     EnvStr := TStringList.Create;
     //
     try
          EnvStr.Clear;
          //
          EnvStr.Values['t'] := 'exception';
          //
          EnvStr.Values['v'] := aVersion;
          EnvStr.Values['tid'] := aTrackingID;
          EnvStr.Values['cid'] := aClientID;
          EnvStr.Values['an'] := aAppName;
          EnvStr.Values['cd'] := aScreenName;
          EnvStr.Values['uid'] := aUserID;
          //
          EnvStr.Values['exd'] := aException;
          EnvStr.Values['exf'] := aValue;
          //
          //RegisterDAT(EnvStr.Text);
          RegisterAnalytic(EnvStr);
     finally
          EnvStr.Free;
     end;
end;

constructor TModelAnalytic.Create;
begin
     FSite := 'https://www.google-analytics.com/collect';
     //
     FFileAnalytic := ChangeFileExt(ParamStr(0), '.dat');
end;

destructor TModelAnalytic.Destroy;
begin
     inherited;
end;

class function TModelAnalytic.New: iModelAnalytic;
begin
     Result := Self.Create;
end;

end.
