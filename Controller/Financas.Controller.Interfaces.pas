unit Financas.Controller.Interfaces;

interface

uses
     System.Classes, FMX.Types;

type
     iControllerListboxItensFactory = interface
          ['{C2594544-AD66-4F60-8BEE-FF43F58210B0}']
     end;

     iControllerListboxFactory = interface
          ['{BD946BB0-3AA0-4F62-8323-3D9995592331}']
     end;

     iControllerApplicationInfoFactory = interface
          ['{CAAF492F-F49F-4E81-96A6-5BAEE1974DC9}']
     end;

     iControllerListboxItensDefault = interface
          ['{6D81B601-2E7B-4E92-BF5F-723EBAB09EB5}']
          function Name(Value: String): iControllerListboxItensDefault;
          function Text(Value: String): iControllerListboxItensDefault;
          function StyleLookup(Value: String): iControllerListboxItensDefault;
          function OnClick(Value: TNotifyEvent): iControllerListboxItensDefault;
          function Item: TFMXObject;
     end;

     iControllerListboxDefault = interface
          ['{CB4EA7BB-65B7-4637-B48F-4790AB28F887}']
          function Name(Value: String): iControllerListboxDefault;
          function Align(Value: TAlignlayout): iControllerListboxDefault;
          function ItemHeight(Value: Integer): iControllerListboxDefault;
          function AddItem(Value: TFMXobject): iControllerListboxDefault;
          function Lista: TFMXObject;
     end;

implementation

end.
