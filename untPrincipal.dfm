object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'frmPrincipal'
  ClientHeight = 454
  ClientWidth = 663
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object btnConexao: TButton
    Left = 24
    Top = 24
    Width = 75
    Height = 25
    Caption = 'Conectar'
    TabOrder = 0
    OnClick = btnConexaoClick
  end
  object PageControl1: TPageControl
    Left = 24
    Top = 55
    Width = 609
    Height = 378
    ActivePage = TabSheet1
    TabOrder = 1
    object TabSheet1: TTabSheet
      Caption = 'Cliente'
      object DBGridCLIENTE: TDBGrid
        Left = 0
        Top = 0
        Width = 601
        Height = 325
        Align = alClient
        DataSource = DataSourceCLIENTE
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'ID'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOME'
            Width = 363
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DOCUMENTO'
            Visible = True
          end>
      end
      object DBNavigator1: TDBNavigator
        Left = 0
        Top = 325
        Width = 601
        Height = 25
        DataSource = DataSourceCLIENTE
        Align = alBottom
        TabOrder = 1
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Contrato'
      ImageIndex = 1
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 294
      object DBGridCONTRATO: TDBGrid
        Left = 0
        Top = 0
        Width = 601
        Height = 129
        Align = alTop
        DataSource = DataSourceCONTRATO
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'ID'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'IDCLIENTE'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DATA'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'OBSERVACAO'
            Width = 196
            Visible = True
          end>
      end
      object DBGridCONTRATOPARCELA: TDBGrid
        Left = 0
        Top = 154
        Width = 601
        Height = 171
        Align = alClient
        DataSource = DataSourceCONTRATOPARCELA
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'IDCONTRATO'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PARCELA'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VENCIMENTO'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'COBRADO'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'RECEBIDO'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PAGAMENTO'
            Visible = True
          end>
      end
      object DBNavigatorCONTRATOPARCELA: TDBNavigator
        Left = 0
        Top = 325
        Width = 601
        Height = 25
        DataSource = DataSourceCONTRATOPARCELA
        Align = alBottom
        TabOrder = 2
        ExplicitTop = 269
      end
      object DBNavigatorCONTRATO: TDBNavigator
        Left = 0
        Top = 129
        Width = 601
        Height = 25
        DataSource = DataSourceCONTRATO
        Align = alTop
        TabOrder = 3
        ExplicitTop = 73
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Comandos'
      ImageIndex = 2
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object MemoCommand: TMemo
        Left = 0
        Top = 0
        Width = 601
        Height = 350
        Align = alClient
        Lines.Strings = (
          '')
        TabOrder = 0
      end
    end
  end
  object FDConnection: TFDConnection
    Params.Strings = (
      'Database=Financas.db3'
      'DriverID=SQLite')
    LoginPrompt = False
    Left = 560
    Top = 80
  end
  object DataSourceCLIENTE: TDataSource
    DataSet = FDCliente
    OnDataChange = DataSourceCLIENTEDataChange
    Left = 516
    Top = 127
  end
  object DataSourceCONTRATO: TDataSource
    DataSet = FDContrato
    OnDataChange = DataSourceCONTRATODataChange
    Left = 516
    Top = 175
  end
  object DataSourceCONTRATOPARCELA: TDataSource
    DataSet = FDContratoParcela
    Left = 516
    Top = 223
  end
  object FDGUIxWaitCursor: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 540
    Top = 7
  end
  object FDPhysSQLiteDriverLink: TFDPhysSQLiteDriverLink
    Left = 572
    Top = 7
  end
  object FDCliente: TFDMemTable
    AfterPost = FDClienteAfterPost
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 556
    Top = 126
  end
  object FDContrato: TFDMemTable
    AfterPost = FDContratoAfterPost
    AggregatesActive = True
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 556
    Top = 178
  end
  object FDContratoParcela: TFDMemTable
    AfterPost = FDContratoParcelaAfterPost
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 554
    Top = 224
  end
end
