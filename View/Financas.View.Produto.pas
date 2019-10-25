unit Financas.View.Produto;

interface

uses
     System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics,
     FMX.Dialogs, FMX.StdCtrls, FMX.Controls.Presentation, System.Rtti, FMX.Grid.Style, Data.Bind.Controls, Data.Bind.Components,
     Data.Bind.DBScope, FMX.Layouts, FMX.Bind.Navigator, FMX.ScrollBox, FMX.Grid, Data.DB, Data.Bind.EngExt,
     FMX.Bind.DBEngExt, FMX.Bind.Grid, System.Bindings.Outputs, FMX.Bind.Editors, Data.Bind.Grid, Datasnap.DBClient;

type
     TViewProduto = class(TForm)
          ToolBar: TToolBar;
          LabelTitle: TLabel;
          DataSource: TDataSource;
          StringGrid: TStringGrid;
          BindNavigator: TBindNavigator;
          BindSourceDB: TBindSourceDB;
          BindingsList: TBindingsList;
          LinkGridToDataSourceBindSourceDB: TLinkGridToDataSource;
          cdsRegistro: TClientDataSet;
     private
          { Private declarations }
     public
          { Public declarations }
     end;

var
     ViewProduto: TViewProduto;

implementation

uses Financas.Controller.Entity.Factory;

{$R *.fmx}

initialization

RegisterFmxClasses([TViewProduto]);

end.
