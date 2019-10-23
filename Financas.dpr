program Financas;

uses
  System.StartUpCopy,
  FMX.Forms,
  Financas.View.Splash in 'View\Financas.View.Splash.pas' {ViewSplash},
  Financas.View.Principal in 'View\Financas.View.Principal.pas' {ViewPrincipal},
  Financas.View.Cliente in 'View\Financas.View.Cliente.pas' {ViewCliente},
  Financas.View.Produto in 'View\Financas.View.Produto.pas' {ViewProduto},
  Financas.Controller.Interfaces in 'Controller\Financas.Controller.Interfaces.pas',
  Financas.Model.Interfaces in 'Model\Financas.Model.Interfaces.pas',
  Financas.Controller.Entity.Factory in 'Controller\Entity\Financas.Controller.Entity.Factory.pas',
  Financas.Controller.Entity.Interfaces in 'Controller\Entity\Financas.Controller.Entity.Interfaces.pas',
  Financas.Controller.Connections.Factory in 'Controller\Connections\Financas.Controller.Connections.Factory.pas',
  Financas.Controller.Connections.Interfaces in 'Controller\Connections\Financas.Controller.Connections.Interfaces.pas',
  Financas.Controller.ApplicationInfo.Factory in 'Controller\Application\Financas.Controller.ApplicationInfo.Factory.pas',
  Financas.Controller.Forms.Default in 'Controller\Form\Financas.Controller.Forms.Default.pas',
  Financas.Controller.Listbox.Clientes in 'Controller\Menus\Financas.Controller.Listbox.Clientes.pas',
  Financas.Controller.Listbox.Default in 'Controller\Menus\Financas.Controller.Listbox.Default.pas',
  Financas.Controller.Listbox.Factory in 'Controller\Menus\Financas.Controller.Listbox.Factory.pas',
  Financas.Controller.Listbox.Itens.Cliente in 'Controller\Menus\Financas.Controller.Listbox.Itens.Cliente.pas',
  Financas.Controller.Listbox.Itens.Default in 'Controller\Menus\Financas.Controller.Listbox.Itens.Default.pas',
  Financas.Controller.Listbox.Itens.Factory in 'Controller\Menus\Financas.Controller.Listbox.Itens.Factory.pas',
  Financas.Controller.Listbox.Itens.Produto in 'Controller\Menus\Financas.Controller.Listbox.Itens.Produto.pas',
  Financas.Controller.Listbox.Principal in 'Controller\Menus\Financas.Controller.Listbox.Principal.pas',
  Financas.Controller.Listbox.Produtos in 'Controller\Menus\Financas.Controller.Listbox.Produtos.pas',
  Financas.Model.IniFile in 'Model\Ini\Financas.Model.IniFile.pas',
  Financas.Model.ApplicationInfo in 'Model\Application\Financas.Model.ApplicationInfo.pas',
  Financas.Controller.IniFiles.Factory in 'Controller\Ini\Financas.Controller.IniFiles.Factory.pas',
  Financas.View.Conexao in 'View\Financas.View.Conexao.pas' {ViewConexao},
  Financas.Model.Entity.Cliente in 'Model\Entity\Financas.Model.Entity.Cliente.pas',
  Financas.Model.Entity.Contrato in 'Model\Entity\Financas.Model.Entity.Contrato.pas',
  Financas.Model.Entity.ContratoParcela in 'Model\Entity\Financas.Model.Entity.ContratoParcela.pas',
  Financas.Model.Entity.Produto in 'Model\Entity\Financas.Model.Entity.Produto.pas';

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
