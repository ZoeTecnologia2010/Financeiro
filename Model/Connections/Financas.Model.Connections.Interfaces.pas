unit Financas.Model.Connections.Interfaces;

interface

uses
  System.Classes;

type
  iModelConnectionParams = interface;

  iModelConnection = interface
    ['{E8538D27-DFF2-4485-A303-616176681A93}']
    function Conectar : iModelConnection;
    function EndConnection: TComponent;
    function Params: iModelConnectionParams;
  end;

  iModelConnectionParams = interface
    ['{69BA62BF-43C2-495B-8E0B-C5B6D509FFCB}']
    function Database(Value: String): iModelConnectionParams;
    function UserName(Value: String): iModelConnectionParams;
    function Password(Value: String): iModelConnectionParams;
    function DriverID(Value: String): iModelConnectionParams;
    function Server(Value: String): iModelConnectionParams;
    function Porta(Value: Integer): iModelConnectionParams;
    function EndParams: iModelConnection;
  end;

  iModelDataSet = interface
    ['{5CFF1908-225F-4A05-A633-914A35BF2858}']
    function Open(aTable: String): iModelDataSet;
    function EndDataSet: TComponent;
  end;

  iModelFactoryConnection = interface
    ['{30C0A523-319F-46E8-97F5-F4C7B32BDF95}']
    function ConnectionFiredac : iModelConnection;
  end;

  iModelFactoryDataSet = interface
    ['{EA1766BB-437B-4133-95D5-73AF1EA851D7}']
    function DataSetFiredac(Connection : iModelConnection) : iModelDataSet;
  end;

implementation

end.
