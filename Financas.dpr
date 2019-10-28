program Financas;

uses
  System.StartUpCopy,
  FMX.Forms,
  Financas.View.Splash in 'View\Financas.View.Splash.pas' {ViewSplash},
  Financas.View.Principal in 'View\Financas.View.Principal.pas' {ViewPrincipal},
  Financas.View.Cliente in 'View\Financas.View.Cliente.pas' {ViewCliente},
  Financas.View.Produto in 'View\Financas.View.Produto.pas' {ViewProduto},
  Financas.Controller.Entity in 'Controller\Entity\Financas.Controller.Entity.pas',
  Financas.Controller.ApplicationInfo.Factory in 'Controller\Application\Financas.Controller.ApplicationInfo.Factory.pas',
  Financas.Model.ApplicationInfo in 'Model\Application\Financas.Model.ApplicationInfo.pas',
  Financas.View.Conexao in 'View\Financas.View.Conexao.pas' {ViewConexao},
  Financas.Model.Entity.Cliente in 'Model\Entity\Financas.Model.Entity.Cliente.pas',
  Financas.Model.Entity.Contrato in 'Model\Entity\Financas.Model.Entity.Contrato.pas',
  Financas.Model.Entity.ContratoParcela in 'Model\Entity\Financas.Model.Entity.ContratoParcela.pas',
  Financas.Model.Entity.Produto in 'Model\Entity\Financas.Model.Entity.Produto.pas',
  Financas.Model.Connection.Factory in 'Model\Connection\Financas.Model.Connection.Factory.pas',
  Financas.Model.Connection.Interfaces in 'Model\Connection\Financas.Model.Connection.Interfaces.pas',
  Financas.Model.ApplicationInfo.Interfaces in 'Model\Application\Financas.Model.ApplicationInfo.Interfaces.pas',
  Financas.Model.IniFile.Interfaces in 'Model\IniFile\Financas.Model.IniFile.Interfaces.pas',
  Financas.Model.IniFile in 'Model\IniFile\Financas.Model.IniFile.pas',
  Financas.Controller.ApplicationInfo.Interfaces in 'Controller\Application\Financas.Controller.ApplicationInfo.Interfaces.pas',
  Financas.Controller.IniFile.Factory in 'Controller\IniFile\Financas.Controller.IniFile.Factory.pas',
  Financas.Controller.IniFile.Interfaces in 'Controller\IniFile\Financas.Controller.IniFile.Interfaces.pas',
  Financas.Controller.Form.Default in 'Controller\Form\Financas.Controller.Form.Default.pas',
  Financas.Controller.Form.Interfaces in 'Controller\Form\Financas.Controller.Form.Interfaces.pas',
  Financas.Controller.Listbox.Clientes in 'Controller\Menu\Financas.Controller.Listbox.Clientes.pas',
  Financas.Controller.Listbox.Default in 'Controller\Menu\Financas.Controller.Listbox.Default.pas',
  Financas.Controller.Listbox.Factory in 'Controller\Menu\Financas.Controller.Listbox.Factory.pas',
  Financas.Controller.Listbox.Interfaces in 'Controller\Menu\Financas.Controller.Listbox.Interfaces.pas',
  Financas.Controller.Listbox.Principal in 'Controller\Menu\Financas.Controller.Listbox.Principal.pas',
  Financas.Controller.Listbox.Produtos in 'Controller\Menu\Financas.Controller.Listbox.Produtos.pas',
  Financas.Controller.Listbox.Itens.Cliente in 'Controller\Menu\Item\Financas.Controller.Listbox.Itens.Cliente.pas',
  Financas.Controller.Listbox.Itens.Default in 'Controller\Menu\Item\Financas.Controller.Listbox.Itens.Default.pas',
  Financas.Controller.Listbox.Itens.Factory in 'Controller\Menu\Item\Financas.Controller.Listbox.Itens.Factory.pas',
  Financas.Controller.Listbox.Itens.Produto in 'Controller\Menu\Item\Financas.Controller.Listbox.Itens.Produto.pas',
  Financas.Model.DAO.Interfaces in 'Model\DAO\Financas.Model.DAO.Interfaces.pas',
  Financas.Model.DAO in 'Model\DAO\Financas.Model.DAO.pas',
  Financas.Model.Connection.Query in 'Model\Connection\Financas.Model.Connection.Query.pas',
  Financas.Model.Connection in 'Model\Connection\Financas.Model.Connection.pas',
  Financas.Controller.Entity.Interfaces in 'Controller\Entity\Financas.Controller.Entity.Interfaces.pas',
  Financas.Controller.Entities in 'Controller\Entity\Financas.Controller.Entities.pas',
  Financas.Model.LogFile.Interfaces in 'Model\LogFile\Financas.Model.LogFile.Interfaces.pas',
  Financas.Model.LogFile in 'Model\LogFile\Financas.Model.LogFile.pas',
  Financas.Controller.Exception in 'Controller\Exception\Financas.Controller.Exception.pas';

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
