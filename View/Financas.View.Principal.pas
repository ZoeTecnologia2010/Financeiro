unit Financas.View.Principal;

interface

uses
     System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts, FMX.Controls.Presentation, FMX.StdCtrls;

type
     TViewPrincipal = class(TForm)
          LayoutMain: TLayout;
          ButtonDatabase: TButton;
          procedure FormCreate(Sender: TObject);
          procedure FormClose(Sender: TObject; var Action: TCloseAction);
          procedure FormShow(Sender: TObject);
          procedure ButtonDatabaseClick(Sender: TObject);
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

uses Financas.Controller.ApplicationInfo.Factory, Financas.Controller.Listbox.Factory, Financas.View.Conexao;

procedure TViewPrincipal.ReadVersionInfo;

begin
     FSystemName := TControllerApplicationInfoFactory.New.ProductName;
     FCompanyName := TControllerApplicationInfoFactory.New.CompanyName;
     FVersion := 'Versão ' + TControllerApplicationInfoFactory.New.FileVersion;
end;

procedure TViewPrincipal.ButtonDatabaseClick(Sender: TObject);
begin
     ViewConexao := TViewConexao.Create(Self);
     //
     ViewConexao.ShowModal;
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

procedure TViewPrincipal.FormShow(Sender: TObject);
begin
     TControllerListboxFactory.New.Principal(LayoutMain).Exibir;
end;

end.
