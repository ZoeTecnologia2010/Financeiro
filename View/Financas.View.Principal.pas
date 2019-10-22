unit Financas.View.Principal;

interface

uses
     System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts;

type
     TViewPrincipal = class(TForm)
          Layout1: TLayout;
          procedure FormCreate(Sender: TObject);
          procedure FormClose(Sender: TObject; var Action: TCloseAction);
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

uses Financas.Controller.ApplicationInfo.Factory;

procedure TViewPrincipal.ReadVersionInfo;
var
     ControllerApplicationInfoFactory: TControllerApplicationInfoFactory;
begin
     ControllerApplicationInfoFactory := TControllerApplicationInfoFactory.Create;
     //
     FCompanyName := ControllerApplicationInfoFactory.ApplicationInfo.CompanyName;
     FSystemName := ControllerApplicationInfoFactory.ApplicationInfo.ProductName;
     FVersion := 'Versão ' + ControllerApplicationInfoFactory.ApplicationInfo.FileVersion;
end;

procedure TViewPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     if MessageDlg('Deseja encerrar o sistema?', TMsgDlgType.mtConfirmation, [TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo], 0, TMsgDlgBtn.mbYes) = mrYes then
          Action := TCloseAction.caFree
     else
          Action := TCloseAction.caNone;
end;

procedure TViewPrincipal.FormCreate(Sender: TObject);
begin
     ReadVersionInfo;
     //
     Caption := FSystemName + ' - ' + FVersion;
end;

end.
