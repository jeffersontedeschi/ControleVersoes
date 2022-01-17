object dmTelaInicial: TdmTelaInicial
  OldCreateOrder = False
  Height = 85
  Width = 403
  object qInicial: TFDQuery
    CachedUpdates = True
    Connection = dmControleDependencias.DB
    Transaction = trInicial
    SQL.Strings = (
      'select SISTEMAS.SEQUENCIA, SISTEMAS.NOME,'
      '       (select first 1 D.VERSAO_SISTEMA'
      '        from DEPENDENCIAS D'
      ''
      '        where D.ID_SISTEMA = SISTEMAS.SEQUENCIA'
      ''
      '        order by D.id_dependencia desc) as VERSAO'
      ''
      'from SISTEMAS'
      ''
      
        'inner join sistema_vinc on sistemas.sequencia = sistema_vinc.seq' +
        'sistema'
      ''
      'order by sistemas.sequencia'
      '')
    Left = 20
    Top = 9
    object qInicialSEQUENCIA: TIntegerField
      FieldName = 'SEQUENCIA'
      Origin = 'SEQUENCIA'
      Required = True
    end
    object qInicialNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Required = True
      Size = 40
    end
    object qInicialVERSAO: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'VERSAO'
      Origin = 'VERSAO_SISTEMA'
      ProviderFlags = []
      ReadOnly = True
    end
    object qInicialVERSAOTEMP: TStringField
      FieldKind = fkCalculated
      FieldName = 'VERSAOTEMP'
      Calculated = True
    end
  end
  object trInicial: TFDTransaction
    Connection = dmControleDependencias.DB
    Left = 72
    Top = 8
  end
  object qGrupos: TFDQuery
    Connection = dmControleDependencias.DB
    SQL.Strings = (
      
        'SELECT FIRST 1 0 SEQUENCIA, '#39'TODOS'#39' AS DESCRICAO FROM SISTEMAS_G' +
        'RUPO'
      ''
      'UNION'
      ''
      'SELECT * FROM SISTEMAS_GRUPO')
    Left = 133
    Top = 9
    object qGruposSEQUENCIA: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'SEQUENCIA'
      Origin = 'SEQUENCIA'
      ProviderFlags = []
      ReadOnly = True
    end
    object qGruposDESCRICAO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
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
      
        '        order by D.id_dependencia desc) as VERSAO, SISTEMA_VINC.' +
        'SEQGRUPO as GRUPO'
      ''
      'from SISTEMAS'
      ''
      
        'inner join sistema_vinc on sistemas.sequencia = sistema_vinc.seq' +
        'sistema'
      ''
      'where sistemas.sequencia = :SISTEMA'
      ''
      'order by sistemas.sequencia')
    Left = 192
    Top = 9
    ParamData = <
      item
        Name = 'SISTEMA'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qWorkSEQUENCIA: TIntegerField
      FieldName = 'SEQUENCIA'
      Origin = 'SEQUENCIA'
      Required = True
    end
    object qWorkNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Required = True
      Size = 40
    end
    object qWorkVERSAO: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'VERSAO'
      Origin = 'VERSAO_SISTEMA'
      ProviderFlags = []
      ReadOnly = True
    end
    object qWorkGRUPO: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'GRUPO'
      Origin = 'SEQGRUPO'
      ProviderFlags = []
      ReadOnly = True
    end
  end
end
