object dmCadastroSistema: TdmCadastroSistema
  OldCreateOrder = False
  Height = 281
  Width = 289
  object qCadastrarSistema: TFDQuery
    CachedUpdates = True
    Connection = dmControleDependencias.DB
    UpdateObject = upCadastrarSistema
    SQL.Strings = (
      'select * from sistemas')
    Left = 40
    Top = 16
  end
  object qVerificaSistema: TFDQuery
    CachedUpdates = True
    Connection = dmControleDependencias.DB
    SQL.Strings = (
      'select * from sistemas'
      ''
      'order by 1 desc')
    Left = 148
    Top = 15
    object qVerificaSistemaNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Required = True
      Size = 40
    end
  end
  object upCadastrarSistema: TFDUpdateSQL
    InsertSQL.Strings = (
      'INSERT INTO SISTEMAS'
      '(NOME)'
      'VALUES (:NEW_NOME)'
      'RETURNING SEQUENCIA, NOME')
    ModifySQL.Strings = (
      'UPDATE SISTEMAS'
      'SET NOME = :NEW_NOME'
      'WHERE SEQUENCIA = :OLD_SEQUENCIA'
      'RETURNING SEQUENCIA, NOME')
    DeleteSQL.Strings = (
      'DELETE FROM SISTEMAS'
      'WHERE SEQUENCIA = :OLD_SEQUENCIA')
    FetchRowSQL.Strings = (
      'SELECT SEQUENCIA, NOME'
      'FROM SISTEMAS'
      'WHERE SEQUENCIA = :OLD_SEQUENCIA')
    Left = 40
    Top = 64
  end
  object dsVerificaSistema: TDataSource
    DataSet = qVerificaSistema
    Left = 147
    Top = 64
  end
  object dsCadastrarSistema: TDataSource
    DataSet = qCadastrarSistema
    Left = 40
    Top = 112
  end
  object dsWork: TDataSource
    DataSet = qWork
    Left = 239
    Top = 64
  end
  object FDQuery1: TFDQuery
    Active = True
    Connection = dmControleDependencias.DB
    SQL.Strings = (
      'select SISTEMAS.SEQUENCIA, SISTEMAS.NOME,'
      '       (select first 1 D.VERSAO_SISTEMA'
      '        from DEPENDENCIAS D'
      ''
      '        where D.ID_SISTEMA = SISTEMAS.SEQUENCIA'
      ''
      '        order by D.id_dependencia desc) as VERSAO'
      'from SISTEMAS'
      ''
      'order by sistemas.sequencia')
    Left = 32
    Top = 216
    object FDQuery1SEQUENCIA: TIntegerField
      FieldName = 'SEQUENCIA'
      Origin = 'SEQUENCIA'
      Required = True
    end
    object FDQuery1NOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Required = True
      Size = 15
    end
    object FDQuery1VERSAO: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'VERSAO'
      Origin = 'VERSAO_SISTEMA'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object qGen1: TFDQuery
    Active = True
    Connection = dmControleDependencias.DB
    SQL.Strings = (
      'SELECT GEN_ID(gen_dependencias_id, 1) FROM RDB$DATABASE')
    Left = 104
    Top = 216
    object qGen1GEN_ID: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'GEN_ID'
      Origin = '"GEN_ID"'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object qWork: TFDQuery
    Connection = dmControleDependencias.DB
    SQL.Strings = (
      'select SISTEMAS.SEQUENCIA, SISTEMAS.NOME,'
      '       (select first 1 D.VERSAO_SISTEMA'
      '        from DEPENDENCIAS D'
      ''
      '        where D.ID_SISTEMA = SISTEMAS.SEQUENCIA'
      ''
      '        order by D.id_dependencia desc) as VERSAO'
      'from SISTEMAS'
      ''
      'order by sistemas.sequencia desc')
    Left = 238
    Top = 13
    object qWorkSEQUENCIA: TIntegerField
      FieldName = 'SEQUENCIA'
      Origin = 'SEQUENCIA'
      Required = True
    end
    object qWorkNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Required = True
      Size = 15
    end
    object qWorkVERSAO: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'VERSAO'
      Origin = 'VERSAO_SISTEMA'
      ProviderFlags = []
      ReadOnly = True
    end
  end
end
