unit Financas.View.Produto;

interface

uses
     System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls, Financas.View.Modelo, System.Rtti, FMX.Grid.Style, Data.Bind.Controls, Data.Bind.EngExt, FMX.Bind.DBEngExt, FMX.Bind.Grid, System.Bindings.Outputs, FMX.Bind.Editors, Data.Bind.Components, Data.Bind.Grid,
     Data.Bind.DBScope, Data.DB, FMX.Edit, FMX.Layouts, FMX.Bind.Navigator, FMX.Controls.Presentation, FMX.ScrollBox, FMX.Grid, Financas.Controller.Entity.Interfaces;

type
     TViewProduto = class(TViewModelo)
          ButtonEditor: TSpeedButton;
          procedure ButtonEditorClick(Sender: TObject);
          procedure FormCreate(Sender: TObject);
          procedure FormShow(Sender: TObject);
          procedure ButtonFindClick(Sender: TObject);
     private
          { Private declarations }
          FControllerEntities: iControllerEntities;
     public
          { Public declarations }
     end;

var
     ViewProduto: TViewProduto;

implementation

{$R *.fmx}

uses Financas.Controller.Analytic.Factory, Financas.Controller.Entities;

procedure TViewProduto.ButtonFindClick(Sender: TObject);
begin
     inherited;
     //
     if EditFind.Text = '' then
     begin
          FControllerEntities.Entities.Cliente.DataSet(DataSource).Open;
     end
     else
     begin
          FControllerEntities.Entities.Cliente.DataSet(DataSource).OpenWhere('DESCRICAO LIKE ' + QuotedStr('%' + EditFind.Text + '%'), 'DESCRICAO');
     end;
     //
     if Assigned(DataSource.DataSet) then
          StringGrid.Columns[0].Visible := False;
end;

procedure TViewProduto.FormCreate(Sender: TObject);
begin
     inherited;
     //
     FControllerEntities := TControllerEntities.New;
     //
     FControllerEntities.Entities.Produto.DataSet(DataSource).Open;
     //
     StringGrid.Columns[0].Visible := False;
end;

procedure TViewProduto.FormShow(Sender: TObject);
begin
     inherited;
     //
     TControllerAnalyticFactory.New.GetPage(Name, Caption);
end;

procedure TViewProduto.ButtonEditorClick(Sender: TObject);
begin
     with FControllerEntities.Entities.Produto._newthis do
     begin
          DESCRICAO := 'Nova informação';
     end;
     //
     FControllerEntities.Entities.Produto.Save;
end;

initialization

RegisterFmxClasses([TViewProduto]);

end.
