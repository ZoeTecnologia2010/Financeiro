unit Financas.Model.Analytic;

interface

uses Financas.Model.Analytic.Interfaces;

type
     TModelAnalytic = class(TInterfacedObject, iModelAnalytic)
     private
          FAnalytic: String;
     published
          constructor Create;
          destructor Destroy; override;
          class function New: iModelAnalytic;
          procedure RegisterScreen(aValue: String);
          procedure RegisterEvent(aValue: String);
     end;

implementation

{ TModelIniFile }

uses System.SysUtils;

procedure TModelAnalytic.RegisterScreen(aValue: String);
var
     txtAnalytic: TextFile;
begin
     AssignFile(txtAnalytic, FAnalytic);
     //
     if FileExists(FAnalytic) then
          Append(txtAnalytic)
     else ReWrite(txtAnalytic);
     //
     WriteLn(txtAnalytic, FormatDateTime('dd/mm/YYYY hh:nn:ss', Now) + ' [Screen] ' + aValue);
     //
     CloseFile(txtAnalytic);
end;

procedure TModelAnalytic.RegisterEvent(aValue: String);
var
     txtAnalytic: TextFile;
begin
     AssignFile(txtAnalytic, FAnalytic);
     //
     if FileExists(FAnalytic) then
          Append(txtAnalytic)
     else ReWrite(txtAnalytic);
     //
     WriteLn(txtAnalytic, FormatDateTime('dd/mm/YYYY hh:nn:ss', Now) + ' [Event ] ' + aValue);
     //
     CloseFile(txtAnalytic);
end;

constructor TModelAnalytic.Create;
begin
     FAnalytic := ChangeFileExt(ParamStr(0), '.dat');
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
