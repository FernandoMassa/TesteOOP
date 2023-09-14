object frmContatos: TfrmContatos
  Left = 0
  Top = 0
  Caption = 'Contatos dos clientes'
  ClientHeight = 497
  ClientWidth = 511
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  TextHeight = 15
  object pcContatos: TPageControl
    Left = 0
    Top = 0
    Width = 511
    Height = 497
    ActivePage = tsCadastro
    Align = alClient
    TabOrder = 0
    OnChange = pcContatosChange
    ExplicitWidth = 507
    ExplicitHeight = 496
    object tsBusca: TTabSheet
      Caption = 'Busca'
      object DBGrid1: TDBGrid
        Left = 0
        Top = 185
        Width = 503
        Height = 282
        Align = alClient
        DataSource = dtsContatos
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'IDCONTATOS'
            Title.Caption = 'id'
            Width = 77
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOME'
            Title.Caption = 'Nome'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CLIENTE'
            Title.Caption = 'Cliente'
            Width = 104
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'RAZAOSOCIAL'
            Title.Caption = 'Raz'#227'o Social'
            Width = 130
            Visible = True
          end>
      end
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 503
        Height = 185
        Align = alTop
        TabOrder = 1
        ExplicitWidth = 499
        object Label4: TLabel
          Left = 3
          Top = 84
          Width = 171
          Height = 15
          Caption = 'Nome contato (pode ser parcial)'
        end
        object edtNomeContLoc: TEdit
          Left = 3
          Top = 100
          Width = 177
          Height = 23
          MaxLength = 20
          ReadOnly = True
          TabOrder = 0
        end
        object lcbCliente: TDBLookupComboBox
          Left = 3
          Top = 52
          Width = 361
          Height = 23
          DataField = 'ID'
          DataSource = dtsCli
          KeyField = 'IDCLIENTE'
          ListField = 'CLIENTE;RAZAOSOCIAL;CNPJ;CPF'
          ListSource = dtsClientes
          TabOrder = 1
        end
        object rgOpcoes: TRadioGroup
          Left = 3
          Top = 7
          Width = 361
          Height = 39
          Caption = 'Buscar cliente por'
          Columns = 4
          ItemIndex = 0
          Items.Strings = (
            'Nome'
            'CNPJ'
            'CPF'
            'Raz'#227'o Social')
          TabOrder = 2
          OnClick = rgOpcoesClick
        end
        object btnBusca: TButton
          Left = 3
          Top = 154
          Width = 118
          Height = 25
          Caption = 'Buscar Contato'
          TabOrder = 3
          OnClick = btnBuscaClick
        end
      end
    end
    object tsCadastro: TTabSheet
      Caption = 'Cadastro / Altera'#231#227'o'
      ImageIndex = 1
      object Label7: TLabel
        Left = 432
        Top = 91
        Width = 59
        Height = 15
        Caption = 'Id. Contato'
      end
      object Nome: TLabel
        Left = 3
        Top = 139
        Width = 33
        Height = 15
        Caption = 'Nome'
      end
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 503
        Height = 57
        Align = alTop
        TabOrder = 0
        object btnNovo: TButton
          Left = 103
          Top = 2
          Width = 66
          Height = 55
          Caption = 'Novo Contato'
          TabOrder = 0
          WordWrap = True
          OnClick = btnNovoClick
        end
        object btnApagar: TButton
          Left = 407
          Top = 2
          Width = 66
          Height = 55
          Caption = 'Apagar Contato'
          TabOrder = 2
          WordWrap = True
          OnClick = btnApagarClick
        end
        object btnAlterar: TButton
          Left = 175
          Top = 2
          Width = 66
          Height = 55
          Caption = 'Altera Contato'
          TabOrder = 1
          WordWrap = True
          OnClick = btnAlterarClick
        end
        object btnSalvar: TButton
          Left = 3
          Top = 2
          Width = 81
          Height = 55
          Caption = 'Salvar'
          Enabled = False
          TabOrder = 3
          WordWrap = True
          OnClick = btnSalvarClick
        end
      end
      object lcbCliente2: TDBLookupComboBox
        Left = 0
        Top = 108
        Width = 361
        Height = 23
        DataField = 'ID'
        DataSource = dtsCli
        KeyField = 'IDCLIENTE'
        ListField = 'CLIENTE;RAZAOSOCIAL;CNPJ;CPF'
        ListSource = dtsClientes
        TabOrder = 1
      end
      object rgOpcoes2: TRadioGroup
        Left = 0
        Top = 63
        Width = 361
        Height = 39
        Caption = 'Buscar cliente por'
        Columns = 4
        ItemIndex = 0
        Items.Strings = (
          'Nome'
          'CNPJ'
          'CPF'
          'Raz'#227'o Social')
        TabOrder = 2
        OnClick = rgOpcoesClick
      end
      object DBEdit1: TDBEdit
        Left = 0
        Top = 160
        Width = 193
        Height = 23
        DataField = 'NOME'
        DataSource = dtsContatos
        TabOrder = 3
      end
      object DBEdit2: TDBEdit
        Left = 432
        Top = 108
        Width = 68
        Height = 23
        Color = clSilver
        DataField = 'IDCONTATOS'
        DataSource = dtsContatos
        ReadOnly = True
        TabOrder = 4
        StyleName = 'Windows'
      end
    end
  end
  object qryClientes: TFDQuery
    Connection = dmDados.conDB
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select'
      '*'
      'from tbcliente')
    Left = 380
    Top = 442
    object qryClientesIDCLIENTE: TFDAutoIncField
      FieldName = 'IDCLIENTE'
      Origin = 'IDCLIENTE'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object qryClientesCLIENTE: TStringField
      FieldName = 'CLIENTE'
      Origin = 'CLIENTE'
    end
    object qryClientesRAZAOSOCIAL: TStringField
      FieldName = 'RAZAOSOCIAL'
      Origin = 'RAZAOSOCIAL'
    end
    object qryClientesCNPJ: TStringField
      FieldName = 'CNPJ'
      Origin = 'CNPJ'
      Size = 14
    end
    object qryClientesCPF: TStringField
      FieldName = 'CPF'
      Origin = 'CPF'
      Size = 11
    end
    object qryClientesDTNASCIMENTO: TDateTimeField
      FieldName = 'DTNASCIMENTO'
      Origin = 'DTNASCIMENTO'
    end
  end
  object qryContatos: TFDQuery
    Connection = dmDados.conDB
    Transaction = dmDados.tranDB
    UpdateOptions.AssignedValues = [uvLockPoint, uvAutoCommitUpdates]
    UpdateOptions.LockPoint = lpImmediate
    UpdateOptions.AutoCommitUpdates = True
    UpdateOptions.UpdateTableName = 'TBCONTATOS'
    UpdateOptions.KeyFields = 'IDCONTATOS'
    UpdateOptions.AutoIncFields = 'IDCONTATOS'
    SQL.Strings = (
      'Select '
      '    c.idContatos,'
      '    c.idcliente,'
      '    c.nome,'
      '    cl.cliente,'
      '    cl.RAZAOSOCIAL'
      'from TBCONTATOS c'
      'inner join tbcliente cl on (cl.idcliente = c.idcliente)'
      'where 0=0'
      '')
    Left = 372
    Top = 330
  end
  object dtsClientes: TDataSource
    DataSet = qryClientes
    Left = 452
    Top = 442
  end
  object tblCli: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvCheckReadOnly, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.CheckReadOnly = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 396
    Top = 394
    object tblCliID: TIntegerField
      FieldName = 'ID'
    end
  end
  object dtsCli: TDataSource
    DataSet = tblCli
    Left = 436
    Top = 394
  end
  object dtsContatos: TDataSource
    DataSet = qryContatos
    Left = 452
    Top = 330
  end
end
