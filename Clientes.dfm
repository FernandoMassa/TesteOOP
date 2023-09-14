object frmClientes: TfrmClientes
  Left = 0
  Top = 0
  Caption = 'frmClientes'
  ClientHeight = 599
  ClientWidth = 815
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  TextHeight = 15
  object pcCliente: TPageControl
    Left = 0
    Top = 0
    Width = 815
    Height = 599
    ActivePage = tsCad
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 811
    ExplicitHeight = 598
    object tsCons: TTabSheet
      Caption = 'Busca Cliente'
      object griClientes: TDBGrid
        Left = 0
        Top = 188
        Width = 807
        Height = 172
        TabStop = False
        Align = alClient
        DataSource = dmDados.dtsCliente
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'IDCLIENTE'
            Title.Caption = 'Id'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CLIENTE'
            Title.Caption = 'Cliente'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'RAZAOSOCIAL'
            Title.Caption = 'Raz'#227'o Social'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CNPJ'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CPF'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DTNASCIMENTO'
            Title.Caption = 'Data Nascimento'
            Width = 118
            Visible = True
          end>
      end
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 807
        Height = 188
        Align = alTop
        TabOrder = 1
        object Label1: TLabel
          Left = 16
          Top = 77
          Width = 89
          Height = 15
          Caption = 'Data nascimento'
        end
        object rgOpcoes: TRadioGroup
          Left = 16
          Top = 3
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
          TabOrder = 0
        end
        object edtCampoBusca: TEdit
          Left = 16
          Top = 48
          Width = 361
          Height = 23
          TabOrder = 1
        end
        object dtpDatanasc: TDatePicker
          Left = 16
          Top = 100
          Date = 45166.000000000000000000
          DateFormat = 'dd/mm/yyyy'
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = []
          StyleName = 'Windows'
          TabOrder = 3
        end
        object chkDtNasc: TCheckBox
          Left = 111
          Top = 77
          Width = 97
          Height = 17
          TabOrder = 2
          OnClick = chkDtNascClick
        end
        object btnBuscar: TButton
          Left = 16
          Top = 152
          Width = 192
          Height = 25
          Caption = 'Buscar cliente / Atualiza Grade'
          TabOrder = 4
          StyleName = 'Windows'
          OnClick = btnBuscarClick
        end
        object btnCopiaDados: TButton
          Left = 304
          Top = 152
          Width = 185
          Height = 25
          Caption = 'Copiar dados para aba cadastro'
          TabOrder = 5
          StyleName = 'Windows'
          OnClick = btnCopiaDadosClick
        end
      end
      object Panel3: TPanel
        Left = 0
        Top = 360
        Width = 807
        Height = 209
        Align = alBottom
        Caption = 'Panel3'
        TabOrder = 2
        object DBGrid1: TDBGrid
          Left = 1
          Top = 31
          Width = 805
          Height = 177
          TabStop = False
          Align = alBottom
          DataSource = dmDados.dtsContato
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
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
              Title.Caption = 'Id Contato'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOME'
              Title.Caption = 'Nome'
              Visible = True
            end>
        end
        object Panel4: TPanel
          Left = 1
          Top = 1
          Width = 805
          Height = 30
          Align = alClient
          Caption = 'Contatos'
          TabOrder = 1
        end
      end
    end
    object tsCad: TTabSheet
      Caption = 'Cadastro / altera'#231#227'o de Cliente'
      ImageIndex = 1
      object Label2: TLabel
        Left = 3
        Top = 63
        Width = 37
        Height = 15
        Caption = 'Cliente'
      end
      object Label3: TLabel
        Left = 203
        Top = 63
        Width = 65
        Height = 15
        Caption = 'Raz'#227'o Social'
      end
      object Label4: TLabel
        Left = 3
        Top = 111
        Width = 27
        Height = 15
        Caption = 'CNPJ'
      end
      object Label5: TLabel
        Left = 203
        Top = 111
        Width = 21
        Height = 15
        Caption = 'CPF'
      end
      object Label6: TLabel
        Left = 3
        Top = 173
        Width = 89
        Height = 15
        Caption = 'Data nascimento'
      end
      object Label7: TLabel
        Left = 735
        Top = 63
        Width = 53
        Height = 15
        Caption = 'Id. Cliente'
      end
      object edtCliente: TEdit
        Left = 3
        Top = 80
        Width = 177
        Height = 23
        MaxLength = 20
        ReadOnly = True
        TabOrder = 0
        StyleName = 'Windows'
      end
      object edtRazaoSocial: TEdit
        Left = 203
        Top = 80
        Width = 177
        Height = 23
        ReadOnly = True
        TabOrder = 1
        StyleName = 'Windows'
      end
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 807
        Height = 57
        Align = alTop
        TabOrder = 5
        ExplicitWidth = 803
        object btnNovo: TButton
          Left = 103
          Top = 2
          Width = 66
          Height = 55
          Caption = 'Novo Cliente'
          TabOrder = 0
          WordWrap = True
          StyleName = 'Windows'
          OnClick = btnNovoClick
        end
        object btnApagar: TButton
          Left = 735
          Top = 1
          Width = 66
          Height = 55
          Caption = 'Apagar Cliente'
          TabOrder = 2
          WordWrap = True
          StyleName = 'Windows'
          OnClick = btnApagarClick
        end
        object btnAlterar: TButton
          Left = 175
          Top = 2
          Width = 66
          Height = 55
          Caption = 'Altera Cliente'
          TabOrder = 1
          WordWrap = True
          StyleName = 'Windows'
          OnClick = btnAlterarClick
        end
        object btnSalvar: TButton
          Left = 3
          Top = 2
          Width = 81
          Height = 55
          Caption = 'Salvar'
          TabOrder = 3
          WordWrap = True
          StyleName = 'Windows'
          OnClick = btnSalvarClick
        end
      end
      object edtDTNasc: TDatePicker
        Left = 3
        Top = 196
        Date = 45166.000000000000000000
        DateFormat = 'dd/mm/yyyy'
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        TabOrder = 4
      end
      object edtID: TEdit
        Left = 735
        Top = 80
        Width = 66
        Height = 23
        TabStop = False
        Color = clSilver
        MaxLength = 20
        ReadOnly = True
        TabOrder = 6
        StyleName = 'Windows'
      end
      object edtCNPJ: TEdit
        Left = 3
        Top = 126
        Width = 177
        Height = 23
        MaxLength = 14
        ReadOnly = True
        TabOrder = 2
        StyleName = 'Windows'
      end
      object edtCPF: TEdit
        Left = 203
        Top = 126
        Width = 177
        Height = 23
        MaxLength = 11
        ReadOnly = True
        TabOrder = 3
        StyleName = 'Windows'
      end
      object pnlContato: TPanel
        Left = 0
        Top = 272
        Width = 807
        Height = 297
        Align = alBottom
        Caption = 'Panel3'
        TabOrder = 7
        ExplicitTop = 271
        ExplicitWidth = 803
        object DBGrid2: TDBGrid
          Left = 1
          Top = 40
          Width = 805
          Height = 256
          TabStop = False
          Align = alBottom
          DataSource = dmDados.dtsContato
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
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
              Title.Caption = 'Id Contato'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOME'
              Title.Caption = 'Nome'
              Visible = True
            end>
        end
        object Panel6: TPanel
          Left = 1
          Top = 1
          Width = 805
          Height = 39
          Align = alClient
          Caption = 'Contatos'
          TabOrder = 1
          ExplicitWidth = 801
          object cadContato: TButton
            Left = 5
            Top = 8
            Width = 174
            Height = 25
            Caption = 'Cadastrar Contato'
            TabOrder = 0
            TabStop = False
            StyleName = 'Windows'
            OnClick = cadContatoClick
          end
        end
      end
    end
  end
end
