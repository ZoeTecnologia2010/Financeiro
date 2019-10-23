unit Financas.View.Cliente;

interface

uses
     System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls, FMX.Controls.Presentation, FMX.ScrollBox, FMX.Memo, FMX.Edit, System.Rtti, FMX.Grid.Style, Data.Bind.Controls, Data.Bind.Components, Data.Bind.DBScope, FMX.Layouts, FMX.Bind.Navigator, FMX.Grid, Data.DB,
     Data.Bind.EngExt, FMX.Bind.DBEngExt, FMX.Bind.Grid, System.Bindings.Outputs, FMX.Bind.Editors, Data.Bind.Grid, Datasnap.DBClient,
     ormbr.container.clientdataset, ormbr.container.dataset.interfaces, Financas.Model.Entity.cliente;

type
     TViewCliente = class(TForm)
          ToolBar: TToolBar;
          LabelTitle: TLabel;
          DataSource: TDataSource;
          StringGrid: TStringGrid;
          BindNavigator: TBindNavigator;
          BindSourceDB: TBindSourceDB;
          BindingsList: TBindingsList;
          LinkGridToDataSourceBindSourceDB: TLinkGridToDataSource;
          cdsRegistro: TClientDataSet;
          procedure FormCreate(Sender: TObject);
     private
          { Private declarations }
          oCliente: IContainerDataSet<TCliente>;
     public
          { Public declarations }
     end;

var
     ViewCliente: TViewCliente;

implementation

uses Financas.Controller.Entity.Factory, Financas.Controller.Connections.Factory;

{$R *.fmx}

procedure TViewCliente.FormCreate(Sender: TObject);
begin
     oCliente := TContainerClientDataSet<TCliente>.Create(TControllerConnectionsFactory.New.Connection, cdsRegistro, 10);
     //
     oCliente.Open;
     //
     StringGrid.Columns[0].Visible := False;
end;

initialization

RegisterFmxClasses([TViewCliente]);

end.
