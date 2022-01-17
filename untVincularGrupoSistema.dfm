object frmVincularGrupoSistema: TfrmVincularGrupoSistema
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Vincular Grupo de Sistema'
  ClientHeight = 308
  ClientWidth = 220
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 40
    Width = 220
    Height = 228
    Align = alClient
    BorderWidth = 3
    ParentBackground = False
    TabOrder = 0
    object grdGrupos: TDBGrid
      Left = 4
      Top = 4
      Width = 212
      Height = 220
      Align = alClient
      DataSource = dsGrid
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDblClick = grdGruposDblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'DESCRICAO'
          Width = 150
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ATIVO'
          Width = 40
          Visible = True
        end>
    end
  end
  object pnlTop: TPanel
    Left = 0
    Top = 0
    Width = 220
    Height = 40
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object lblNomeSistema: TLabel
      Left = 0
      Top = 0
      Width = 220
      Height = 40
      Align = alClient
      Alignment = taCenter
      Caption = 'Sistema Selecionado'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Layout = tlCenter
      ExplicitWidth = 117
      ExplicitHeight = 13
    end
  end
  object pnlBottom: TPanel
    Left = 0
    Top = 268
    Width = 220
    Height = 40
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    object Salvar: TButton
      Left = 76
      Top = 7
      Width = 69
      Height = 25
      Caption = 'Salvar'
      TabOrder = 0
      OnClick = SalvarClick
    end
  end
  object dsComboBox: TDataSource
    DataSet = qComboBox
    Left = 136
    Top = 112
  end
  object qComboBox: TFDQuery
    Connection = dmControleDependencias.DB
    SQL.Strings = (
      'select * from sistemas'
      ''
      'order by 1 asc')
    Left = 72
    Top = 112
    object qComboBoxSEQUENCIA: TIntegerField
      FieldName = 'SEQUENCIA'
      Origin = 'SEQUENCIA'
      Required = True
    end
    object qComboBoxNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Required = True
      Size = 40
    end
  end
  object dsGrid: TDataSource
    DataSet = qMontaGrid
    Left = 24
    Top = 112
  end
  object qMontaGrid: TFDQuery
    CachedUpdates = True
    Connection = dmControleDependencias.DB
    SQL.Strings = (
      'select SG.SEQUENCIA, SG.DESCRICAO, coalesce((select V.ATIVO'
      '                                           from SISTEMA_VINC V'
      
        '                                           where V.SEQSISTEMA = ' +
        ':S and'
      
        '                                           SG.SEQUENCIA = V.SEQG' +
        'RUPO), '#39'N'#39') as Ativo'
      ''
      'from SISTEMAS_GRUPO SG')
    Left = 24
    Top = 160
    ParamData = <
      item
        Name = 'S'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qMontaGridDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      ReadOnly = True
    end
    object qMontaGridATIVO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ATIVO'
      Origin = 'ATIVO'
      ProviderFlags = []
      FixedChar = True
      Size = 1
    end
    object qMontaGridSEQUENCIA: TIntegerField
      FieldName = 'SEQUENCIA'
      Origin = 'SEQUENCIA'
      Required = True
    end
  end
  object qWork: TFDQuery
    Connection = dmControleDependencias.DB
    Left = 72
    Top = 160
  end
end
