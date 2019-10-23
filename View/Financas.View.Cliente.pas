unit Financas.View.Cliente;

interface

uses
     System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls, FMX.Controls.Presentation, FMX.ScrollBox, FMX.Memo, FMX.Edit;

type
     TViewCliente = class(TForm)
          ToolBar: TToolBar;
          LabelTitle: TLabel;
     private
          { Private declarations }
     public
          { Public declarations }
     end;

var
     ViewCliente: TViewCliente;

implementation

{$R *.fmx}

initialization

     RegisterFmxClasses([TViewCliente]);

end.
