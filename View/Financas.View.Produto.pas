unit Financas.View.Produto;

interface

uses
     System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls, FMX.Controls.Presentation;

type
     TViewProduto = class(TForm)
    ToolBar: TToolBar;
          LabelTitle: TLabel;
     private
          { Private declarations }
     public
          { Public declarations }
     end;

var
     ViewProduto: TViewProduto;

implementation

{$R *.fmx}

initialization

     RegisterFmxClasses([TViewProduto]);

end.
