object frmAddDependencia: TfrmAddDependencia
  Left = 0
  Top = 0
  Caption = 'frmAddDependencia'
  ClientHeight = 506
  ClientWidth = 494
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object SpeedButton1: TSpeedButton
    Left = 377
    Top = 352
    Width = 104
    Height = 38
    Caption = 'Gravar'
    OnClick = SpeedButton1Click
  end
  object dbgridAdicionarDependencias: TDBGrid
    Left = 8
    Top = 49
    Width = 473
    Height = 297
    DataSource = dsAdicionar
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
        FieldName = 'ID_SISTEMA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ID_DEPENDENCIA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME'
        ReadOnly = False
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VERSAO_SISTEMA'
        Visible = True
      end>
  end
  object qOrigem: TFDQuery
    Active = True
    FieldOptions.UpdatePersistent = True
    CachedUpdates = True
    Connection = dmControleDependencias.DB
    Transaction = trAdicionar
    SQL.Strings = (
      'select DEPENDENCIAS.*, sistemas.nome'
      'from DEPENDENCIAS'
      ''
      'inner join SISTEMAS on DEPENDENCIAS.ID_SISTEMA = SISTEMAS.ID   '
      ''
      'where 1 = 1')
    Left = 224
    Top = 432
    object qOrigemNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      ReadOnly = True
      Size = 15
    end
    object qOrigemID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      Required = True
    end
    object qOrigemVERSAO_SISTEMA: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'VERSAO_SISTEMA'
      Origin = 'VERSAO_SISTEMA'
      ProviderFlags = []
    end
    object qOrigemID_DEPENDENCIA: TIntegerField
      FieldName = 'ID_DEPENDENCIA'
      Origin = 'ID_DEPENDENCIA'
    end
    object qOrigemID_SISTEMA: TIntegerField
      FieldName = 'ID_SISTEMA'
      Origin = 'ID_SISTEMA'
    end
  end
  object upAdicionar: TFDUpdateSQL
    Connection = dmControleDependencias.DB
    InsertSQL.Strings = (
      'INSERT INTO DEPENDENCIAS'
      '(ID, ID_DEPENDENCIA, ID_SISTEMA, VERSAO_SISTEMA)'
      
        'VALUES (:NEW_ID, :NEW_ID_DEPENDENCIA, :NEW_ID_SISTEMA, :NEW_VERS' +
        'AO_SISTEMA)'
      'RETURNING ID, ID_DEPENDENCIA, ID_SISTEMA, VERSAO_SISTEMA')
    ModifySQL.Strings = (
      'UPDATE DEPENDENCIAS'
      
        'SET ID = :NEW_ID, ID_DEPENDENCIA = :NEW_ID_DEPENDENCIA, ID_SISTE' +
        'MA = :NEW_ID_SISTEMA, '
      '  VERSAO_SISTEMA = :NEW_VERSAO_SISTEMA'
      'WHERE ID = :OLD_ID'
      'RETURNING ID, ID_DEPENDENCIA, ID_SISTEMA, VERSAO_SISTEMA')
    DeleteSQL.Strings = (
      'DELETE FROM DEPENDENCIAS'
      'WHERE ID = :OLD_ID')
    FetchRowSQL.Strings = (
      'SELECT ID, ID_DEPENDENCIA, ID_SISTEMA, VERSAO_SISTEMA'
      'FROM DEPENDENCIAS'
      'WHERE ID = :OLD_ID')
    Left = 288
    Top = 432
  end
  object dsAdicionar: TDataSource
    DataSet = qOrigem
    Left = 416
    Top = 432
  end
  object trAdicionar: TFDTransaction
    Connection = dmControleDependencias.DB
    Left = 352
    Top = 432
  end
  object qWork: TFDQuery
    Connection = dmControleDependencias.DB
    Transaction = trAdicionar
    UpdateObject = upAdicionar
    Left = 56
    Top = 432
  end
end
