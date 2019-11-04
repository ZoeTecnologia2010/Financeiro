unit Financas.View.Dashboard;

interface

uses
     System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls, Data.DB, Datasnap.DBClient, View.WebCharts, FMX.WebBrowser;

type
     TViewDashboard = class(TFrame)
          WebBrowserLocal: TWebBrowser;
          WebChartsLocal: TWebCharts;
          cdsLocal: TClientDataSet;
          Timer: TTimer;
          DataSourceSerie1: TDataSource;
          procedure GeneratorSerie(var Destination: TClientDataSet; Source: TDataSet; FieldLabel, FieldValue, FieldRGB: String);
          procedure TimerTimer(Sender: TObject);
          constructor Create(AOwner: TComponent); override;
     private
          { Private declarations }
     public
          { Public declarations }
     end;

implementation

{$R *.fmx}

uses Charts.Types, TypInfo, Financas.Controller.Connection.Factory;

function GenerateRandomColor: String;
var
     Red, Green, Blue: Integer;
begin
     Red := Random(256);
     Green := Random(256);
     Blue := Random(256);
     //
     Result := IntToStr(Red) + ', ' + IntToStr(Green) + ', ' + IntToStr(Blue);
end;

constructor TViewDashboard.Create(AOwner: TComponent);
var
     LDataSet: TDataSet;
begin
     inherited;
     //
     LDataSet := TControllerConnectionFactory.New.SQL('SELECT * FROM Produto');
     //
     DataSourceSerie1.DataSet := LDataSet;
     //
     GeneratorSerie(cdsLocal, DataSourceSerie1.DataSet, 'DESCRICAO', 'ID', '');
     //
     Timer.Enabled := True;
end;

procedure TViewDashboard.GeneratorSerie(var Destination: TClientDataSet; Source: TDataSet; FieldLabel, FieldValue, FieldRGB: String);
begin
     try
          Destination.Close;
          Destination.FieldDefs.Clear;
          Destination.FieldDefs.add('Label', ftString, 50);
          Destination.FieldDefs.add('Value', ftFloat);
          Destination.FieldDefs.add('RGB', ftString, 50);
          Destination.CreateDataSet;
          //
          Destination.Open;
          //
          if Source.Active and (Source.RecordCount > 0) then
          begin
               Source.First;
               //
               while not Source.Eof do
               begin
                    Destination.Insert;
                    Destination.FieldByName('Label').Value := Source.FieldByName(FieldLabel).Value;
                    Destination.FieldByName('Value').Value := Source.FieldByName(FieldValue).Value;
                    if (FieldRGB <> '') then
                         Destination.FieldByName('RGB').Value := Source.FieldByName(FieldRGB).Value
                    else
                         Destination.FieldByName('RGB').Value := GenerateRandomColor;
                    Destination.Post;
                    //
                    Source.Next;
               end;
          end;
     finally
          Destination.First;
     end;
end;

procedure TViewDashboard.TimerTimer(Sender: TObject);
begin
     if cdsLocal.Active and (cdsLocal.RecordCount > 0) then
     begin
          Timer.Interval := 30000;
          //
          WebChartsLocal
               .NewProject
                    .Charts._ChartType(doughnut)
                         .Attributes
                              .ColSpan(12)
                              .Options
                                   .Title
                                        .text('Dashboard Financeiro')
                                   .&End
                                   .Legend
                                        .position('bottom')
                                   .&End
                              .&End
                              .Name('G01')
                              .DataSet
                                   .DataSet(cdsLocal)
                                        .textLabel('Valores Recebidos')
                                   .&End
                              .&End
                         .&End
                    .&End
               .WebBrowser(WebBrowserLocal)
               .Generated;
     end;
end;

initialization

  RegisterClass(TViewDashboard);

end.
