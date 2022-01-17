object dmConsultaDependencias: TdmConsultaDependencias
  OldCreateOrder = False
  Height = 146
  Width = 292
  object qSistema: TFDQuery
    Connection = dmControleDependencias.DB
    SQL.Strings = (
      'select * from sistemas'
      ''
      'order by 1 asc'
      '')
    Left = 24
    Top = 64
    object qSistemaSEQUENCIA: TIntegerField
      FieldName = 'SEQUENCIA'
      Origin = 'SEQUENCIA'
      Required = True
    end
    object qSistemaNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Required = True
      Size = 40
    end
  end
  object dsSistema: TDataSource
    DataSet = qSistema
    Left = 24
    Top = 16
  end
  object dsVersao: TDataSource
    DataSet = qVersao
    Left = 80
    Top = 17
  end
  object qVersao: TFDQuery
    Connection = dmControleDependencias.DB
    SQL.Strings = (
      'select * from dependencias')
    Left = 80
    Top = 64
    object qVersaoVERSAO_SISTEMA: TWideStringField
      FieldName = 'VERSAO_SISTEMA'
      LookupCache = True
      Origin = 'VERSAO_SISTEMA'
    end
  end
  object dsConsulta: TDataSource
    DataSet = qConsulta
    Left = 136
    Top = 16
  end
  object qConsulta: TFDQuery
    Indexes = <
      item
      end>
    Connection = dmControleDependencias.DB
    SQL.Strings = (
      'select S.SEQUENCIA, S.NOME as SISTEMA,'
      '       (select first 1 D2.VERSAO_SISTEMA'
      '        from DEPENDENCIAS D2'
      '        where D2.ID_SISTEMA = S.SEQUENCIA and'
      '              D2.ID_DEPENDENCIA in (select D.ID_DEPENDENCIA'
      '                                    from DEPENDENCIAS D'
      
        '                                    where D.ID_SISTEMA = :SISTEM' +
        'A_BUSCAR and'
      
        '                                          D.VERSAO_SISTEMA = :VE' +
        'RSAO_BUSCAR)'
      ''
      '        order by D2.VERSAO_SISTEMA asc) as MINIMA,'
      '       (select first 1 D2.VERSAO_SISTEMA'
      '        from DEPENDENCIAS D2'
      '        where D2.ID_SISTEMA = S.SEQUENCIA and'
      '              D2.ID_DEPENDENCIA in (select D.ID_DEPENDENCIA'
      '                                    from DEPENDENCIAS D'
      
        '                                    where D.ID_SISTEMA = :SISTEM' +
        'A_BUSCAR and'
      
        '                                          D.VERSAO_SISTEMA = :VE' +
        'RSAO_BUSCAR)'
      ''
      
        '        order by D2.VERSAO_SISTEMA desc) as MAXIMA, SISTEMAS_GRU' +
        'PO.DESCRICAO as GRUPO'
      ''
      'from SISTEMAS S'
      ''
      'inner join SISTEMA_VINC on S.SEQUENCIA = SISTEMA_VINC.SEQSISTEMA'
      
        'inner join SISTEMAS_GRUPO on SISTEMA_VINC.SEQGRUPO = SISTEMAS_GR' +
        'UPO.SEQUENCIA'
      ''
      
        'where S.SEQUENCIA <> :SISTEMA_BUSCAR and Sistemas_Grupo.Descrica' +
        'o = :GRUPO'
      ''
      'order by SEQUENCIA asc  ')
    Left = 136
    Top = 64
    ParamData = <
      item
        Name = 'SISTEMA_BUSCAR'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'VERSAO_BUSCAR'
        DataType = ftWideString
        ParamType = ptInput
        Size = 20
      end
      item
        Name = 'GRUPO'
        DataType = ftString
        ParamType = ptInput
        Size = 20
      end>
    object qConsultaSISTEMA: TStringField
      FieldName = 'SISTEMA'
      Origin = 'NOME'
      Required = True
      Size = 40
    end
    object qConsultaMINIMA: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'MINIMA'
      Origin = 'VERSAO_SISTEMA'
      ProviderFlags = []
      ReadOnly = True
    end
    object qConsultaMAXIMA: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'MAXIMA'
      Origin = 'VERSAO_SISTEMA'
      ProviderFlags = []
      ReadOnly = True
    end
    object qConsultaGRUPO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'GRUPO'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object dsGrupo: TDataSource
    DataSet = qGrupo
    Left = 192
    Top = 16
  end
  object qGrupo: TFDQuery
    Connection = dmControleDependencias.DB
    SQL.Strings = (
      'select * from sistemas_grupo')
    Left = 192
    Top = 65
    object qGrupoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Required = True
    end
    object qGrupoSEQUENCIA: TIntegerField
      FieldName = 'SEQUENCIA'
      Origin = 'SEQUENCIA'
      Required = True
    end
  end
  object qGr: TFDQuery
    Connection = dmControleDependencias.DB
    SQL.Strings = (
      'select SISTEMAS_GRUPO.DESCRICAO as NOME'
      'from SISTEMAS_GRUPO'
      ''
      
        'inner join SISTEMA_VINC on SISTEMAS_GRUPO.SEQUENCIA = SISTEMA_VI' +
        'NC.SEQGRUPO'
      
        'inner join SISTEMAS on SISTEMA_VINC.SEQSISTEMA = SISTEMAS.SEQUEN' +
        'CIA'
      ''
      'where SISTEMAS.SEQUENCIA = :SISTEMA   ')
    Left = 240
    Top = 66
    ParamData = <
      item
        Name = 'SISTEMA'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qGrNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Required = True
      Size = 40
    end
  end
end
