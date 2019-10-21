program Financas;

uses
  System.StartUpCopy,
  FMX.Forms,
  Financas.View.Principal in 'View\Financas.View.Principal.pas' {ViewPrincipal},
  Financas.Controller.Interfaces in 'Controller\Financas.Controller.Interfaces.pas',
  Financas.Model.Interfaces in 'Model\Financas.Model.Interfaces.pas',
  Financas.Controller.Listbox.Itens.Factory in 'Controller\Financas.Controller.Listbox.Itens.Factory.pas',
  Financas.Controller.Listbox.Factory in 'Controller\Financas.Controller.Listbox.Factory.pas',
  Financas.Controller.Listbox.Itens.Default in 'Controller\Financas.Controller.Listbox.Itens.Default.pas',
  Financas.Controller.Listbox.Default in 'Controller\Financas.Controller.Listbox.Default.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TViewPrincipal, ViewPrincipal);
  Application.Run;
end.
