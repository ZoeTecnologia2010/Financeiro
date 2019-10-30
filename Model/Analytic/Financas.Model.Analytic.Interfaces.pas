unit Financas.Model.Analytic.Interfaces;

interface

type
     iModelAnalytic= interface
          ['{5B42329C-5BF4-4BB0-B3BA-424576392402}']
          procedure RegisterScreen(aVersion, aTrackingID, aClientID, aAppName, aScreenName, aUserID, aUserAgent, aAppVersion, aScreenResolution, aSource, aCampaignName: String);
          procedure RegisterEvent(aVersion, aTrackingID, aClientID, aCategory, aAction, aLabel, aValue: String);
          procedure RegisterException(aVersion, aTrackingID, aClientID, aAppName, aScreenName, aUserID, aException, aValue: String);
     end;

implementation

end.
