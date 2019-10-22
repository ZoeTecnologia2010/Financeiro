program Financas;

uses
  System.StartUpCopy,
  FMX.Forms,
  Financas.View.Splash in 'View\Financas.View.Splash.pas' {ViewSplash},
  Financas.View.Principal in 'View\Financas.View.Principal.pas' {ViewPrincipal},
  Financas.Controller.Interfaces in 'Controller\Financas.Controller.Interfaces.pas',
  Financas.Model.Interfaces in 'Model\Financas.Model.Interfaces.pas',
  Financas.Controller.Listbox.Itens.Factory in 'Controller\Financas.Controller.Listbox.Itens.Factory.pas',
  Financas.Controller.Listbox.Factory in 'Controller\Financas.Controller.Listbox.Factory.pas',
  Financas.Controller.Listbox.Itens.Default in 'Controller\Financas.Controller.Listbox.Itens.Default.pas',
  Financas.Controller.Listbox.Default in 'Controller\Financas.Controller.Listbox.Default.pas',
  Financas.Controller.ApplicationInfo.Factory in 'Controller\Financas.Controller.ApplicationInfo.Factory.pas',
  Financas.Model.ApplicationInfo in 'Model\Financas.Model.ApplicationInfo.pas',
  Financas.Controller.Listbox.Itens.Cliente in 'Controller\Financas.Controller.Listbox.Itens.Cliente.pas',
  Financas.Controller.Listbox.Principal in 'Controller\Financas.Controller.Listbox.Principal.pas',
  Financas.Controller.Listbox.Itens.Produto in 'Controller\Financas.Controller.Listbox.Itens.Produto.pas',
  Financas.Controller.Listbox.Produtos in 'Controller\Financas.Controller.Listbox.Produtos.pas',
  Financas.Controller.Listbox.Clientes in 'Controller\Financas.Controller.Listbox.Clientes.pas',
  Financas.Controller.Forms.Default in 'Controller\Financas.Controller.Forms.Default.pas';

{$R *.res}

begin
     Application.Initialize;
     //
     ViewSplash := TViewSplash.Create(nil);
     ViewSplash.Show;
     //
     Application.ProcessMessages;
     //
     Application.CreateForm(TViewPrincipal, ViewPrincipal);
  Application.Run;
end.
