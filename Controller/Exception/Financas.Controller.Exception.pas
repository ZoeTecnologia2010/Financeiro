unit Financas.Controller.Exception;

interface

uses System.SysUtils;

type
     TControllerException = class
          private
               //
          public
               constructor Create;
               procedure LogException(Sender: TObject; E: Exception);
     end;

implementation

uses FMX.Forms, System.Classes, Financas.Model.LogFile;

{ TControllerExcaption }

constructor TControllerException.Create;
begin
     Application.OnException := LogException;
end;

procedure TControllerException.LogException(Sender: TObject; E: Exception);
begin
     TModelLogFile.New.SaveLog('====================================================================================================');
     //
     if TComponent(Sender) is TForm then
     begin
          TModelLogFile.New.SaveLog('Form: ' + TForm(Sender).Name);
          TModelLogFile.New.SaveLog('Class: ' + E.ClassName);
          TModelLogFile.New.SaveLog('Erro: ' + E.Message);
     end
     else
     begin
          TModelLogFile.New.SaveLog('Component: ' + TComponent(Sender).Name);  // Problemas...
          TModelLogFile.New.SaveLog('Class: ' + E.ClassName);
          TModelLogFile.New.SaveLog('Erro: ' + E.Message);
     end;
     //
     Application.ShowException(E);
end;

var
     LocalException: TControllerException;

initialization

     LocalException := TControllerException.Create;

finalization

     LocalException.Free

end.
