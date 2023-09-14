object dmDados: TdmDados
  Height = 399
  Width = 608
  object conDB: TFDConnection
    ConnectionName = 'BDCandidato'
    Params.Strings = (
      'DriverID=SQLite'
      'Database=D:\Delphi\TesteEmbalsoft\BDCANDIDATO.SQLite3')
    LoginPrompt = False
    Transaction = tranDB
    Left = 48
    Top = 56
  end
  object tranDB: TFDTransaction
    Connection = conDB
    Left = 104
    Top = 56
  end
  object qryCliente: TFDQuery
    AfterScroll = qryClienteAfterScroll
    Connection = conDB
    Transaction = tranDB
    SQL.Strings = (
      'select * '
      'from tbcliente'
      '')
    Left = 48
    Top = 144
  end
  object qryContato: TFDQuery
    Connection = conDB
    Transaction = tranDB
    SQL.Strings = (
      'select * '
      'from tbcontatos')
    Left = 144
    Top = 144
  end
  object dtsCliente: TDataSource
    DataSet = qryCliente
    Left = 48
    Top = 208
  end
  object dtsContato: TDataSource
    DataSet = qryContato
    Left = 144
    Top = 208
  end
  object qryAux: TFDQuery
    Connection = conDB
    Transaction = tranDB
    SQL.Strings = (
      'select * '
      'from tbcliente'
      '')
    Left = 48
    Top = 272
  end
end
