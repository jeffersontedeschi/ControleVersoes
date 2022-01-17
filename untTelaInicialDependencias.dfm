object frmInicioControleDependencias: TfrmInicioControleDependencias
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Controle de Vers'#245'es'
  ClientHeight = 571
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
    Height = 528
    Align = alClient
    BorderWidth = 3
    Caption = 'Panel1'
    ParentBackground = False
    TabOrder = 0
    object Label1: TLabel
      Left = 14
      Top = 26
      Width = 162
      Height = 13
      Caption = 'Filtrar por Grupo de Sistema:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 4
      Top = 510
      Width = 282
      Height = 13
      Caption = '* Utilize o bot'#227'o direito para vincular o Sistema '#224' um Grupo'
    end
    object dbgInicioConsulta: TDBGrid
      Left = 4
      Top = 59
      Width = 406
      Height = 445
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      DataSource = dsInicial
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      ParentFont = False
      PopupMenu = popUpGrupos
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDblClick = DBGrid1DblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'NOME'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VERSAO'
          Width = 64
          Visible = True
        end>
    end
    object dbGrupo: TDBLookupComboBox
      Left = 182
      Top = 21
      Width = 228
      Height = 21
      KeyField = 'SEQUENCIA'
      ListField = 'DESCRICAO'
      ListSource = dsPesquisarGrupo
      TabOrder = 1
      OnClick = dbGrupoClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 528
    Width = 414
    Height = 43
    Align = alBottom
    BorderWidth = 3
    ParentBackground = False
    TabOrder = 1
    object SpeedButton1: TSpeedButton
      Left = 152
      Top = 9
      Width = 110
      Height = 25
      Caption = 'Incluir Dependencia'
      OnClick = SpeedButton1Click
    end
    object SpeedButton2: TSpeedButton
      Left = 32
      Top = 9
      Width = 110
      Height = 25
      Caption = 'Incluir Sistema'
      OnClick = SpeedButton2Click
    end
    object SpeedButton3: TSpeedButton
      Left = 272
      Top = 9
      Width = 110
      Height = 25
      Caption = 'Incluir Grupo'
      Enabled = False
    end
  end
  object dsInicial: TDataSource
    DataSet = dmTelaInicial.qInicial
    Left = 344
    Top = 248
  end
  object popUpGrupos: TPopupMenu
    Left = 344
    Top = 200
    object AdicionarGrupo1: TMenuItem
      Caption = 'Adicionar Grupo'
      OnClick = AdicionarGrupo1Click
    end
  end
  object dsPesquisarGrupo: TDataSource
    DataSet = dmTelaInicial.qGrupos
    Left = 344
    Top = 144
  end
end
