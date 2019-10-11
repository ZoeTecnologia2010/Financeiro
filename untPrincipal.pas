unit untPrincipal;

interface

uses
     /// orm interface de conexão
     ormbr.factory.interfaces, ormbr.factory.firedac, ormbr.dml.generator.sqlite,
     /// orm injection dependency
     ormbr.container.dataset.interfaces, ormbr.container.fdmemtable, ormbr.modeldb.compare, ormbr.ddl.generator.sqlite, ormbr.metadata.sqlite, ormbr.ddl.commands, ormbr.database.compare,  ormbr.database.interfaces,
     /// modelos usados
     financas.model.cliente, financas.model.contrato, financas.model.contratoparcela,

     Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, firedac.Stan.Intf, firedac.Stan.Option, firedac.Stan.Error, firedac.UI.Intf, firedac.Phys.Intf, firedac.Stan.Def, firedac.Stan.Pool, firedac.Stan.Async, firedac.Phys, firedac.Phys.sqlite, firedac.Phys.SQLiteDef, firedac.Stan.ExprFuncs,
     firedac.VCLUI.Wait, Data.DB, firedac.Comp.Client, Vcl.StdCtrls, firedac.Stan.Param, firedac.DatS, firedac.DApt.Intf, firedac.DApt, firedac.Comp.dataset, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls, firedac.Comp.UI;

type
     TfrmPrincipal = class(TForm)
          FDConnection: TFDConnection;
          btnConexao: TButton;
          PageControl1: TPageControl;
          TabSheet1: TTabSheet;
          TabSheet2: TTabSheet;
          DataSourceCLIENTE: TDataSource;
          DataSourceCONTRATO: TDataSource;
          DataSourceCONTRATOPARCELA: TDataSource;
          DBGridCLIENTE: TDBGrid;
          DBNavigator1: TDBNavigator;
          DBGridCONTRATO: TDBGrid;
          DBGridCONTRATOPARCELA: TDBGrid;
          DBNavigatorCONTRATOPARCELA: TDBNavigator;
          DBNavigatorCONTRATO: TDBNavigator;
          FDGUIxWaitCursor: TFDGUIxWaitCursor;
          FDPhysSQLiteDriverLink: TFDPhysSQLiteDriverLink;
          FDCliente: TFDMemTable;
          FDContrato: TFDMemTable;
          FDContratoParcela: TFDMemTable;
          TabSheet3: TTabSheet;
          MemoCommand: TMemo;
          procedure btnConexaoClick(Sender: TObject);
          procedure DataSourceCLIENTEDataChange(Sender: TObject; Field: TField);
          procedure DataSourceCONTRATODataChange(Sender: TObject; Field: TField);
          procedure FDClienteAfterPost(dataset: TDataSet);
          procedure FDContratoAfterPost(dataset: TDataSet);
          procedure FDContratoParcelaAfterPost(dataset: TDataSet);
          procedure FormCreate(Sender: TObject);
     private
          { Private declarations }
          oConn: IDBConnection;
          oContainerCliente: IContainerDataSet<TCliente>;
          oContainerContrato: IContainerDataSet<TContrato>;
          oContainerContratoParcela: IContainerDataSet<TContratoParcela>;
     public
          { Public declarations }
     end;

var
     frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses StrUtils, ormbr.form.monitor, ormbr.database.mapping;

procedure TfrmPrincipal.btnConexaoClick(Sender: TObject);
begin
     if btnConexao.Caption = 'Conectar' then
     begin
          FDConnection.Close;
          FDConnection.Open;
          //
          oContainerCliente.Open;
          //
          btnConexao.Caption := 'Desconectar';
     end
     else
     begin
          oContainerCliente.Close;
          oContainerContrato.Close;
          oContainerContratoParcela.Close;
          //
          FDConnection.Close;
          //
          btnConexao.Caption := 'Conectar';
     end;
end;

procedure TfrmPrincipal.DataSourceCLIENTEDataChange(Sender: TObject; Field: TField);
begin
     if oConn.IsConnected and not DataSourceCLIENTE.dataset.FieldByName('ID').IsNull then
          oContainerContrato.OpenWhere('IDCLIENTE = ' + QuotedSTR(DataSourceCLIENTE.dataset.FieldByName('ID').AsString));

end;

procedure TfrmPrincipal.DataSourceCONTRATODataChange(Sender: TObject; Field: TField);
begin
     if oConn.IsConnected and not DataSourceCONTRATO.dataset.FieldByName('ID').IsNull then
          oContainerContratoParcela.OpenWhere('IDCONTRATO = ' + QuotedSTR(DataSourceCONTRATO.dataset.FieldByName('ID').AsString));
end;

procedure TfrmPrincipal.FDClienteAfterPost(dataset: TDataSet);
begin
     oContainerCliente.ApplyUpdates(0);
end;

procedure TfrmPrincipal.FDContratoAfterPost(dataset: TDataSet);
begin
     oContainerContrato.ApplyUpdates(0);
end;

procedure TfrmPrincipal.FDContratoParcelaAfterPost(dataset: TDataSet);
begin
     oContainerContratoParcela.ApplyUpdates(0);
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
var
     Metadata: TModelDBCompare;
     cDDL: TDDLCommand;
begin
     oConn := TFactoryFireDAC.Create(FDConnection, dnSQLite);
     oConn.SetCommandMonitor(TCommandMonitor.GetInstance);
     //
     Metadata := TModelDBCompare.Create(oConn);
     Metadata.CommandsAutoExecute := False;
     //Metadata.BuildDatabase;
     //
     for cDDL in Metadata.GetCommandList do
          MemoCommand.Lines.Add(cDDL.Command);
     //
     oContainerCliente := TContainerFDMemTable<TCliente>.Create(oConn, FDCliente, 3);
     oContainerContrato := TContainerFDMemTable<TContrato>.Create(oConn, FDContrato, oContainerCliente.This);
     oContainerContratoParcela := TContainerFDMemTable<TContratoParcela>.Create(oConn, FDContratoParcela, oContainerContrato.This);
end;

end.
