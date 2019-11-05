unit Financas.View.Modelo;

interface

uses
     System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, System.Rtti, System.Bindings.Outputs, FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls, FMX.Controls.Presentation, FMX.ScrollBox, FMX.Memo, FMX.Edit, FMX.Grid.Style, FMX.Layouts, FMX.Bind.Navigator, FMX.Grid, FMX.Bind.DBEngExt, FMX.Bind.Grid, FMX.Bind.Editors,
     Data.DB, Data.Bind.Controls, Data.Bind.Components, Data.Bind.DBScope, Data.Bind.EngExt, Data.Bind.Grid, Datasnap.DBClient, Financas.Controller.Entity.Interfaces;

type
     TViewModelo = class(TForm)
          StringGrid: TStringGrid;
          BindNavigator: TBindNavigator;
          Panel1: TPanel;
          ButtonFind: TButton;
          EditFind: TEdit;
          LabelFind: TLabel;
          DataSource: TDataSource;
          BindSourceDB: TBindSourceDB;
          BindingsList: TBindingsList;
          LinkGridToDataSourceBindSourceDB: TLinkGridToDataSource;
     private
          { Private declarations }
     public
          { Public declarations }
     end;

var
     ViewModelo: TViewModelo;

implementation

{$R *.fmx}

end.
