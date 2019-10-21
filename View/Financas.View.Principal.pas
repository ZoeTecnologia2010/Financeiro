unit Financas.View.Principal;

interface

uses
     System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts;

type
     TViewPrincipal = class(TForm)
          Layout1: TLayout;
          procedure FormCreate(Sender: TObject);
     private
          { Private declarations }
          FCompanyName: String;
          FSystemName: String;
          FVersion: String;
          procedure ReadVersionInfo;
     public
          { Public declarations }
     end;

var
     ViewPrincipal: TViewPrincipal;

implementation

{$R *.fmx}

uses Financas.Controller.ApplicationInfo;

procedure TViewPrincipal.ReadVersionInfo;
begin
     FCompanyName := LegalCopyright;
     FSystemName := ProductName;
     FVersion := 'Versão ' + FileVersion;
end;

procedure TViewPrincipal.FormCreate(Sender: TObject);
begin
     ReadVersionInfo;
     //
     Caption := FSystemName + ' - ' + FVersion;
end;

end.
