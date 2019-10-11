program Financas;

uses
  Vcl.Forms,
  untPrincipal in 'untPrincipal.pas' {frmPrincipal},
  financas.model.cliente in 'Entidades\financas.model.cliente.pas',
  financas.model.contrato in 'Entidades\financas.model.contrato.pas',
  financas.model.contratoparcela in 'Entidades\financas.model.contratoparcela.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Sistema FINANÇAS';
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
