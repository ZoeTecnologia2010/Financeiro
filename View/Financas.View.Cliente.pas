unit Financas.View.Cliente;

interface

uses
     System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls, FMX.Controls.Presentation, FMX.ScrollBox, FMX.Memo, FMX.Edit, System.Rtti, FMX.Grid.Style, Data.Bind.Controls, Data.Bind.Components, Data.Bind.DBScope, FMX.Layouts, FMX.Bind.Navigator, FMX.Grid, Data.DB,
     Data.Bind.EngExt, FMX.Bind.DBEngExt, FMX.Bind.Grid, System.Bindings.Outputs, FMX.Bind.Editors, Data.Bind.Grid, Datasnap.DBClient, Financas.Controller.Entity.Interfaces;

type
     TViewCliente = class(TForm)
          DataSource: TDataSource;
          StringGrid: TStringGrid;
          BindNavigator: TBindNavigator;
          BindSourceDB: TBindSourceDB;
          BindingsList: TBindingsList;
          LinkGridToDataSourceBindSourceDB: TLinkGridToDataSource;
          Panel1: TPanel;
          ButtonContrato: TButton;
          ButtonFind: TButton;
          EditFind: TEdit;
          LabelFind: TLabel;
          procedure FormCreate(Sender: TObject);
          procedure ButtonFindClick(Sender: TObject);
          procedure FormShow(Sender: TObject);
     private
          { Private declarations }
          FControllerEntities: iControllerEntities;
     public
          { Public declarations }
     end;

var
     ViewCliente: TViewCliente;

implementation

uses Financas.Controller.Analytic.Factory, Financas.Controller.Entities;

{$R *.fmx}

procedure TViewCliente.ButtonFindClick(Sender: TObject);
begin
     if EditFind.Text = '' then
     begin
          FControllerEntities.Entities.Cliente.DataSet(DataSource).Open;
     end
     else
     begin
          FControllerEntities.Entities.Cliente.DataSet(DataSource).OpenWhere('NOME LIKE ' + QuotedStr('%' + EditFind.Text + '%'), 'NOME');
     end;
     //
     if Assigned(DataSource.DataSet) then
          StringGrid.Columns[0].Visible := False;
end;

procedure TViewCliente.FormCreate(Sender: TObject);
begin
     FControllerEntities := TControllerEntities.New;
end;

procedure TViewCliente.FormShow(Sender: TObject);
begin
     TControllerAnalyticFactory.New.GetScreen(Name);
end;

initialization

RegisterFmxClasses([TViewCliente]);

end.
