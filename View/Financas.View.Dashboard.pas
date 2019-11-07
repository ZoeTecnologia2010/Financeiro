unit Financas.View.Dashboard;

interface

uses
     System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, Data.DB, Datasnap.DBClient,
     FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls, View.WebCharts, FMX.WebBrowser;

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

var
     SQLCommandSerie1: String;

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
begin
     inherited;
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
var
     LDataSet: TDataSet;
begin
     Timer.Interval := 30000;
     //
     LDataSet := TControllerConnectionFactory.New.SQL(SQLCommandSerie1);
     //
     DataSourceSerie1.DataSet := LDataSet;
     //
     GeneratorSerie(cdsLocal, DataSourceSerie1.DataSet, 'LABEL', 'VALUE', '');
     //
     if cdsLocal.Active and (cdsLocal.RecordCount > 0) then
     begin
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

  SQLCommandSerie1 := 'SELECT DESCRICAO AS LABEL, ID AS VALUE FROM Produto';

//  SQLCommandSerie1 := 'SELECT ' +
//'{fn CONVERT({fn YEAR(VENCIMENTO)}, INT)} AS ANO, ' +
//'{fn CONVERT({fn MONTH(VENCIMENTO)}, INT)} AS MES, ' +
//'{fn CONVERT({fn MONTH(VENCIMENTO)}, VARCHAR)} AS LABEL, ' +
//'{fn CONCAT({fn CONVERT({fn MONTHNAME(VENCIMENTO)}, CHAR)}, {fn CONCAT(' + QuotedStr(' / ') + ', {fn CONVERT({fn YEAR(VENCIMENTO)}, CHAR)})})} AS LABEL, ' +
//'SUM({fn IFNULL(COBRADO, 0)}) AS VALUE, ' +
//'SUM({fn IFNULL(RECEBIDO, 0)}) AS VALUE ' +
//'FROM ContratoParcela ' +
//'GROUP BY ANO, MES, VENCIMENTO ' +
//'ORDER BY ANO, MES, VENCIMENTO '

end.
