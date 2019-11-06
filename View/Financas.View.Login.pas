unit Financas.View.Login;

interface

uses
     System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls, FMX.Edit, FMX.Controls.Presentation, FMX.Objects, FMX.Layouts, FMX.Ani, FMX.Effects, FMX.Filter.Effects;

type
     TViewLogin = class(TForm)
          LayoutMain: TLayout;
          LayoutFundo: TLayout;
          ImageBackground: TImage;
          BlurEffect: TBlurEffect;
          GloomEffect: TGloomEffect;
          RectangleBackground: TRectangle;
          ImageCompany: TImage;
          LayoutLogin: TLayout;
          RectangleLogin: TRectangle;
          LayoutButton: TLayout;
          ButtonLogin: TRectangle;
          LabelButtonLogin: TLabel;
          ShadowButtonLogin: TShadowEffect;
          ShadowButton: TShadowEffect;
          ButtonCancel: TRectangle;
          LabelButtonCancel: TLabel;
          ShadowButtonCancel: TShadowEffect;
    EditPassword: TEdit;
    EditUsername: TEdit;
    LabelCompany: TLabel;
          procedure ButtonCancelClick(Sender: TObject);
          procedure FormCreate(Sender: TObject);
          function Login(UserName, Password: String): Boolean;
          procedure ButtonLoginClick(Sender: TObject);
     private
          { Private declarations }
          Uid: TGuid;
          Result: HResult;
     public
          { Public declarations }
          FLogin: Boolean;
          FClientID: String;
          FUserName: String;
     end;

var
     ViewLogin: TViewLogin;

implementation

{$R *.fmx}

procedure TViewLogin.ButtonCancelClick(Sender: TObject);
begin
     Close;
end;

procedure TViewLogin.ButtonLoginClick(Sender: TObject);
begin
     FLogin := Login(EditUsername.Text, EditPassword.Text);
     //
     if FLogin then
          Close;
end;

procedure TViewLogin.FormCreate(Sender: TObject);
begin
     FLogin := False;
     //
     Result := CreateGuid(Uid);
     //
     if Result = S_OK then
          FClientID := GuidToString(Uid)
     else
          FClientID := '555';
end;

function TViewLogin.Login(UserName, Password: String): Boolean;
begin
     Result := False;
     //
     if (UserName <> '') and (Password <> '') and (UpperCase(UserName) = UpperCase(Password)) then
     begin
          Result := True;
          //
          FUserName := UserName;
     end
     else
          raise exception.Create('Usuário e Senha inválidos!');
end;

end.
