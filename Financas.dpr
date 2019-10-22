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
  Financas.Controller.ListBox.Itens.Produto in 'Controller\Financas.Controller.ListBox.Itens.Produto.pas',
  Financas.Controller.Listbox.Produtos in 'Controller\Financas.Controller.Listbox.Produtos.pas',
  Financas.Controller.Listbox.Clientes in 'Controller\Financas.Controller.Listbox.Clientes.pas',
  Financas.Controller.Forms.Default in 'Controller\Financas.Controller.Forms.Default.pas',
  Financas.View.Cliente in 'View\Financas.View.Cliente.pas' {ViewCliente},
  Financas.View.Produto in 'View\Financas.View.Produto.pas' {ViewProduto},
  Financas.Model.Connections.ConnectionFiredac in 'Model\Connections\Financas.Model.Connections.ConnectionFiredac.pas',
  Financas.Model.Connections.Factory.Connection in 'Model\Connections\Financas.Model.Connections.Factory.Connection.pas',
  Financas.Model.Connections.Factory.DataSet in 'Model\Connections\Financas.Model.Connections.Factory.DataSet.pas',
  Financas.Model.Connections.Interfaces in 'Model\Connections\Financas.Model.Connections.Interfaces.pas',
  Financas.Model.Connections.TableFiredac in 'Model\Connections\Financas.Model.Connections.TableFiredac.pas',
  Financas.Model.Entity.Clientes in 'Model\Entity\Financas.Model.Entity.Clientes.pas',
  Financas.Model.Entity.Factory in 'Model\Entity\Financas.Model.Entity.Factory.pas',
  Financas.Model.Entity.Interfaces in 'Model\Entity\Financas.Model.Entity.Interfaces.pas',
  Financas.Model.Entity.Produtos in 'Model\Entity\Financas.Model.Entity.Produtos.pas',
  Financas.Controller.Entity.Clientes in 'Controller\Entity\Financas.Controller.Entity.Clientes.pas',
  Financas.Controller.Entity.Factory in 'Controller\Entity\Financas.Controller.Entity.Factory.pas',
  Financas.Controller.Entity.Interfaces in 'Controller\Entity\Financas.Controller.Entity.Interfaces.pas',
  Financas.Controller.Entity.Produtos in 'Controller\Entity\Financas.Controller.Entity.Produtos.pas',
  Financas.Controller.Connections.Factory.Connection in 'Controller\Connections\Financas.Controller.Connections.Factory.Connection.pas',
  Financas.Controller.Connections.Factory.DataSet in 'Controller\Connections\Financas.Controller.Connections.Factory.DataSet.pas',
  Financas.Controller.Connections.Interfaces in 'Controller\Connections\Financas.Controller.Connections.Interfaces.pas';

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
