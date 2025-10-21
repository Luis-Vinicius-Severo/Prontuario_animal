object DM: TDM
  OldCreateOrder = False
  Height = 434
  Width = 729
  object FDConnection: TFDConnection
    Params.Strings = (
      'User_Name=SYSDBA'
      'Password=masterkey'
      'CharacterSet=WIN1252'
      'Protocol=TCPIP'
      'Server=127.0.0.1'
      'Database=C:\Luis\Projeto_Animal\Banco\BANCO.FDB'
      'DriverID=FB')
    TxOptions.AutoStop = False
    Connected = True
    LoginPrompt = False
    Left = 44
    Top = 23
  end
  object FDTransaction: TFDTransaction
    Connection = FDConnection
    Left = 128
    Top = 24
  end
  object SqlProprietario: TFDQuery
    Connection = FDConnection
    Transaction = FDTransaction
    SQL.Strings = (
      'select * from tbproprietario')
    Left = 40
    Top = 96
    object SqlProprietarioPKPROPRIETARIO: TLargeintField
      FieldName = 'PKPROPRIETARIO'
      Origin = 'PKPROPRIETARIO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object SqlProprietarioNOMEPROPRI: TStringField
      FieldName = 'NOMEPROPRI'
      Origin = 'NOMEPROPRI'
      Size = 80
    end
    object SqlProprietarioENDERECO: TStringField
      FieldName = 'ENDERECO'
      Origin = 'ENDERECO'
      Size = 80
    end
    object SqlProprietarioNUMERO: TBCDField
      FieldName = 'NUMERO'
      Origin = 'NUMERO'
      Precision = 18
      Size = 2
    end
    object SqlProprietarioBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Origin = 'BAIRRO'
      Size = 80
    end
    object SqlProprietarioCIDADE: TStringField
      FieldName = 'CIDADE'
      Origin = 'CIDADE'
      Size = 50
    end
    object SqlProprietarioESTADO: TStringField
      FieldName = 'ESTADO'
      Origin = 'ESTADO'
      Size = 50
    end
    object SqlProprietarioCEP: TStringField
      FieldName = 'CEP'
      Origin = 'CEP'
      Size = 50
    end
  end
  object DSSqlProprietario: TDataSource
    DataSet = SqlProprietario
    Left = 128
    Top = 96
  end
  object FBTransactionaltera: TFDTransaction
    Connection = FDConnection
    Left = 552
    Top = 40
  end
  object SQLModifica: TFDQuery
    Active = True
    Connection = FDConnection
    Transaction = FBTransactionaltera
    SQL.Strings = (
      'select * from tbproprietario')
    Left = 648
    Top = 40
  end
  object SqlAnimais: TFDQuery
    Connection = FDConnection
    Transaction = FDTransaction
    SQL.Strings = (
      'select * from tbanimal')
    Left = 40
    Top = 160
    object SqlAnimaisPKANIMAL: TLargeintField
      FieldName = 'PKANIMAL'
      Origin = 'PKANIMAL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object SqlAnimaisNOMEANIMAL: TStringField
      FieldName = 'NOMEANIMAL'
      Origin = 'NOMEANIMAL'
      Size = 80
    end
    object SqlAnimaisDATANASCIMENTO: TDateField
      FieldName = 'DATANASCIMENTO'
      Origin = 'DATANASCIMENTO'
    end
    object SqlAnimaisFKRACA: TLargeintField
      FieldName = 'FKRACA'
      Origin = 'FKRACA'
    end
    object SqlAnimaisPESO: TSingleField
      FieldName = 'PESO'
      Origin = 'PESO'
    end
    object SqlAnimaisFKPROPRIETARIO: TLargeintField
      FieldName = 'FKPROPRIETARIO'
      Origin = 'FKPROPRIETARIO'
    end
  end
  object DSSQLAnimais: TDataSource
    DataSet = SqlAnimais
    Left = 128
    Top = 160
  end
  object SqlRaca: TFDQuery
    Connection = FDConnection
    Transaction = FDTransaction
    SQL.Strings = (
      'select * from tbraca')
    Left = 40
    Top = 232
    object SqlRacaPKRACA: TLargeintField
      FieldName = 'PKRACA'
      Origin = 'PKRACA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object SqlRacaDESCRICAORACA: TStringField
      FieldName = 'DESCRICAORACA'
      Origin = 'DESCRICAORACA'
      Size = 150
    end
    object SqlRacaNOMERACA: TStringField
      FieldName = 'NOMERACA'
      Origin = 'NOMERACA'
      Size = 80
    end
  end
  object DSSqlRaca: TDataSource
    DataSet = SqlRaca
    Left = 128
    Top = 232
  end
  object SqlProntuario: TFDQuery
    Connection = FDConnection
    Transaction = FDTransaction
    SQL.Strings = (
      'select pr.*, p.nomepropri, a.nomeanimal'
      'from TBPRONTURARIO  pr'
      
        'inner join tbproprietario p on p.pkproprietario = pr.fkproprieta' +
        'rio'
      'inner join tbanimal a on a.pkanimal = pr.fkanimal')
    Left = 40
    Top = 304
    object SqlProntuarioPKPRONTUARIO: TLargeintField
      FieldName = 'PKPRONTUARIO'
      Origin = 'PKPRONTUARIO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object SqlProntuarioFKPROPRIETARIO: TLargeintField
      FieldName = 'FKPROPRIETARIO'
      Origin = 'FKPROPRIETARIO'
    end
    object SqlProntuarioFKANIMAL: TLargeintField
      FieldName = 'FKANIMAL'
      Origin = 'FKANIMAL'
    end
    object SqlProntuarioDATAENTRADA: TDateField
      FieldName = 'DATAENTRADA'
      Origin = 'DATAENTRADA'
    end
    object SqlProntuarioDATASAIDA: TDateField
      FieldName = 'DATASAIDA'
      Origin = 'DATASAIDA'
    end
    object SqlProntuarioVALORTOTAL: TBCDField
      FieldName = 'VALORTOTAL'
      Origin = 'VALORTOTAL'
      Precision = 18
      Size = 2
    end
    object SqlProntuarioNOMEPROPRI: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOMEPROPRI'
      Origin = 'NOMEPROPRI'
      ProviderFlags = []
      ReadOnly = True
      Size = 80
    end
    object SqlProntuarioNOMEANIMAL: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOMEANIMAL'
      Origin = 'NOMEANIMAL'
      ProviderFlags = []
      ReadOnly = True
      Size = 80
    end
  end
  object DSSqlProntuario: TDataSource
    DataSet = SqlProntuario
    Left = 128
    Top = 304
  end
  object SqlDespesas: TFDQuery
    Connection = FDConnection
    Transaction = FDTransaction
    SQL.Strings = (
      'select * from TBITEMDESPESA')
    Left = 40
    Top = 368
    object SqlDespesasPKITEMDESP: TLargeintField
      FieldName = 'PKITEMDESP'
      Origin = 'PKITEMDESP'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object SqlDespesasFKPRONTUARIO: TLargeintField
      FieldName = 'FKPRONTUARIO'
      Origin = 'FKPRONTUARIO'
    end
    object SqlDespesasDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 80
    end
    object SqlDespesasQUANTIDADE: TIntegerField
      FieldName = 'QUANTIDADE'
      Origin = 'QUANTIDADE'
    end
    object SqlDespesasVALORUNIT: TBCDField
      FieldName = 'VALORUNIT'
      Origin = 'VALORUNIT'
      Precision = 18
      Size = 2
    end
    object SqlDespesasVALORTOTAL: TBCDField
      FieldName = 'VALORTOTAL'
      Origin = 'VALORTOTAL'
      Precision = 18
      Size = 2
    end
  end
  object DSSqlDespesas: TDataSource
    DataSet = SqlDespesas
    Left = 128
    Top = 368
  end
end
