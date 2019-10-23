unit Financas.Controller.Entity.Interfaces;

interface

uses Data.DB, Datasnap.DBClient, ormbr.factory.interfaces, ormbr.container.dataset.interfaces,
     Financas.Model.Entity.Produto, Financas.Model.Entity.Cliente, Financas.Model.Entity.Contrato, Financas.Model.Entity.ContratoParcela;

type

  iControllerEntityFactory = interface
    ['{9F063B38-9A72-44F6-8ABC-FF11867BAB47}']
    function Cliente(cdsLocal: TClientDataSet): IContainerDataSet<TCliente>;
    function Produto(cdsLocal: TClientDataSet): IContainerDataSet<TProduto>;
  end;

implementation

end.
