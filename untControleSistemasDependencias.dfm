object frmAdicionarDependencias: TfrmAdicionarDependencias
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Adicionar Dependencia'
  ClientHeight = 542
  ClientWidth = 414
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 414
    Height = 504
    Align = alClient
    BorderWidth = 3
    Caption = 'Panel1'
    TabOrder = 0
    object DBGrid1: TDBGrid
      Left = 4
      Top = 4
      Width = 406
      Height = 496
      Align = alClient
      DataSource = dsBusca
      Enabled = False
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnKeyPress = DBGrid1KeyPress
      Columns = <
        item
          Expanded = False
          FieldName = 'SEQUENCIA'
          ReadOnly = True
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'NOME'
          ReadOnly = True
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VERSAO'
          Visible = True
        end>
    end
  end
  object TPanel
    Left = 0
    Top = 504
    Width = 414
    Height = 38
    Align = alBottom
    BorderWidth = 3
    TabOrder = 1
    object btnAddDependencia: TSpeedButton
      Left = 91
      Top = 7
      Width = 110
      Height = 25
      Caption = 'Gravar Dependencia'
      OnClick = btnAddDependenciaClick
    end
    object btnCancelar: TSpeedButton
      Left = 212
      Top = 7
      Width = 110
      Height = 25
      Caption = 'Cancelar'
      OnClick = btnCancelarClick
    end
  end
  object dsBusca: TDataSource
    DataSet = FDMemTable1
    Left = 320
    Top = 24
  end
  object FDMemTable1: TFDMemTable
    AutoCalcFields = False
    FieldDefs = <>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    FormatOptions.AssignedValues = [fvMaxBcdPrecision, fvMaxBcdScale]
    FormatOptions.MaxBcdPrecision = 2147483647
    FormatOptions.MaxBcdScale = 1073741823
    ResourceOptions.AssignedValues = [rvPersistent, rvSilentMode]
    ResourceOptions.Persistent = True
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvUpdateChngFields, uvUpdateMode, uvLockMode, uvLockPoint, uvLockWait, uvRefreshMode, uvFetchGeneratorsPoint, uvCheckRequired, uvCheckReadOnly, uvCheckUpdatable, uvAutoCommitUpdates]
    UpdateOptions.LockWait = True
    UpdateOptions.FetchGeneratorsPoint = gpNone
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 322
    Top = 72
    object FDMemTable1SEQUENCIA: TIntegerField
      FieldName = 'SEQUENCIA'
      Origin = 'SEQUENCIA'
      Required = True
    end
    object FDMemTable1NOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Required = True
      Size = 15
    end
    object FDMemTable1VERSAO: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'VERSAO'
      Origin = 'VERSAO_SISTEMA'
      ProviderFlags = []
      ReadOnly = True
    end
    object FDMemTable1tempVersao: TStringField
      FieldKind = fkLookup
      FieldName = 'tempVersao'
      LookupDataSet = dmTelaInicial.qInicial
      LookupKeyFields = 'SEQUENCIA'
      LookupResultField = 'VERSAO'
      KeyFields = 'SEQUENCIA'
      Lookup = True
    end
  end
end
