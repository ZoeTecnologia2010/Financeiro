unit Financas.View.Cliente;

interface

uses
     System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls, System.Rtti, FMX.Grid.Style, Data.Bind.Controls, Data.Bind.EngExt, FMX.Bind.DBEngExt, FMX.Bind.Grid, System.Bindings.Outputs, FMX.Bind.Editors, Data.Bind.Components, Data.Bind.Grid, Data.Bind.DBScope, Data.DB,
     FMX.Edit, FMX.Layouts, FMX.Bind.Navigator, FMX.Controls.Presentation, FMX.ScrollBox, FMX.Grid, Financas.View.Modelo, Financas.Controller.Entity.Interfaces;

type
     TViewCliente = class(TViewModelo)
          procedure FormCreate(Sender: TObject);
          procedure FormShow(Sender: TObject);
          procedure ButtonFindClick(Sender: TObject);
     private
          { Private declarations }
     public
          { Public declarations }
          FControllerEntities: iControllerEntities;
     end;

var
     ViewCliente: TViewCliente;

implementation

{$R *.fmx}

uses Financas.Controller.Analytic.Factory, Financas.Controller.Entities;

procedure TViewCliente.ButtonFindClick(Sender: TObject);
begin
     inherited;
     //
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
     inherited;
     //
     FControllerEntities := TControllerEntities.New;
end;

procedure TViewCliente.FormShow(Sender: TObject);
begin
     inherited;
     //
     TControllerAnalyticFactory.New.GetPage(Name, Caption);
end;

initialization

RegisterFmxClasses([TViewCliente]);

end.
