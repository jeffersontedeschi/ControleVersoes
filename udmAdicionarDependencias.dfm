object dmAdicionarDependencias: TdmAdicionarDependencias
  OldCreateOrder = False
  Height = 180
  Width = 146
  object trAdicionarDependencia: TFDTransaction
    Connection = dmControleDependencias.DB
    Left = 56
    Top = 16
  end
  object qGen: TFDQuery
    Connection = dmControleDependencias.DB
    SQL.Strings = (
      'SELECT GEN_ID(gen_dependencias_id, 1) FROM RDB$DATABASE')
    Left = 56
    Top = 64
    object qGenGEN_ID: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'GEN_ID'
      Origin = '"GEN_ID"'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object qBusca: TFDQuery
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
      'order by sistemas.sequencia'
      ''
      '')
    Left = 56
    Top = 120
    object qBuscaSEQUENCIA: TIntegerField
      FieldName = 'SEQUENCIA'
      Origin = 'SEQUENCIA'
      Required = True
    end
    object qBuscaNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Required = True
      Size = 40
    end
    object qBuscaVERSAO: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'VERSAO'
      Origin = 'VERSAO_SISTEMA'
      ProviderFlags = []
      ReadOnly = True
    end
  end
end
