object FPronturario: TFPronturario
  Left = 0
  Top = 0
  Caption = 'FPronturario'
  ClientHeight = 381
  ClientWidth = 1025
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = [fsBold]
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 16
  object DBFormPront: TDBGrid
    Left = 0
    Top = 0
    Width = 1025
    Height = 153
    Align = alTop
    DataSource = DM.DSSqlProntuario
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = [fsBold]
    Columns = <
      item
        Expanded = False
        FieldName = 'PKPRONTUARIO'
        Title.Alignment = taCenter
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOMEPROPRI'
        Title.Alignment = taCenter
        Width = 219
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOMEANIMAL'
        Title.Alignment = taCenter
        Width = 134
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DATAENTRADA'
        Title.Alignment = taCenter
        Width = 123
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DATASAIDA'
        Title.Alignment = taCenter
        Width = 180
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALORTOTAL'
        Title.Alignment = taCenter
        Width = 146
        Visible = True
      end>
  end
  object PConsulta: TPanel
    Left = 0
    Top = 340
    Width = 1025
    Height = 41
    Align = alBottom
    TabOrder = 1
    object CBPregra: TComboBox
      Left = 16
      Top = 8
      Width = 201
      Height = 24
      Style = csDropDownList
      ItemIndex = 0
      TabOrder = 0
      Text = 'Todos'
      Items.Strings = (
        'Todos'
        'C'#243'digo proprietario igual '#225
        'Data Entrada')
    end
    object EdtPesq: TEdit
      Left = 232
      Top = 8
      Width = 225
      Height = 24
      TabOrder = 1
    end
    object BtPesquisar: TBitBtn
      Left = 848
      Top = 8
      Width = 97
      Height = 25
      Caption = 'Pesquisar'
      TabOrder = 2
      OnClick = BtPesquisarClick
    end
  end
  object PBotoes: TPanel
    Left = 0
    Top = 153
    Width = 1025
    Height = 57
    Align = alTop
    TabOrder = 2
    object BtSair: TBitBtn
      Left = 927
      Top = 10
      Width = 91
      Height = 41
      Caption = 'Sair'
      TabOrder = 0
      OnClick = BtSairClick
    end
    object BtCancelar: TBitBtn
      Left = 816
      Top = 11
      Width = 105
      Height = 41
      Caption = 'Cancelar'
      TabOrder = 1
      OnClick = BtCancelarClick
    end
    object BtSalvar: TBitBtn
      Left = 705
      Top = 10
      Width = 105
      Height = 41
      Caption = 'Salvar'
      TabOrder = 2
      OnClick = BtSalvarClick
    end
    object BtRemover: TBitBtn
      Left = 594
      Top = 11
      Width = 105
      Height = 41
      Caption = 'Remover'
      TabOrder = 3
      OnClick = BtRemoverClick
    end
    object BitEditDesp: TBitBtn
      Left = 16
      Top = 10
      Width = 126
      Height = 41
      Caption = 'Despensa'
      TabOrder = 4
      OnClick = BitEditDespClick
    end
    object BtNovo: TBitBtn
      Left = 372
      Top = 10
      Width = 105
      Height = 41
      Caption = 'Novo'
      TabOrder = 5
      OnClick = BtNovoClick
    end
    object BtEditar: TBitBtn
      Left = 483
      Top = 11
      Width = 105
      Height = 41
      Caption = 'Editar'
      TabOrder = 6
      OnClick = BtEditarClick
    end
  end
  object PDados: TPanel
    Left = 0
    Top = 210
    Width = 1025
    Height = 130
    Align = alClient
    TabOrder = 3
    object LProprietario: TLabel
      Left = 452
      Top = 32
      Width = 78
      Height = 16
      Caption = 'Proprietario'
    end
    object LAnimal: TLabel
      Left = 452
      Top = 72
      Width = 43
      Height = 16
      Caption = 'Animal'
    end
    object LDataEntr: TLabel
      Left = 818
      Top = 32
      Width = 51
      Height = 16
      Caption = 'Entrada'
    end
    object LSaida: TLabel
      Left = 818
      Top = 72
      Width = 35
      Height = 16
      Caption = 'Sa'#237'da'
    end
    object LProntuario: TLabel
      Left = 16
      Top = 24
      Width = 116
      Height = 16
      Caption = 'C'#243'digo Prontuario'
    end
    object DBAnimal: TDBLookupComboBox
      Left = 564
      Top = 71
      Width = 145
      Height = 24
      DataField = 'FKANIMAL'
      DataSource = DM.DSSqlProntuario
      KeyField = 'PKANIMAL'
      ListField = 'NOMEANIMAL'
      ListSource = DM.DSSQLAnimais
      TabOrder = 0
    end
    object EdtDataEntr: TMaskEdit
      Left = 884
      Top = 29
      Width = 120
      Height = 24
      EditMask = '99/99/9999;1;_'
      MaxLength = 10
      TabOrder = 1
      Text = '  /  /    '
    end
    object EdtDataSaida: TMaskEdit
      Left = 884
      Top = 71
      Width = 118
      Height = 24
      EditMask = '99/99/9999;1;_'
      MaxLength = 10
      TabOrder = 2
      Text = '  /  /    '
    end
    object EdtCodProntu: TEdit
      Left = 138
      Top = 21
      Width = 121
      Height = 24
      Enabled = False
      TabOrder = 3
    end
    object DBEdit1: TDBEdit
      Left = 910
      Top = 104
      Width = 115
      Height = 24
      DataField = 'PKPRONTUARIO'
      DataSource = DM.DSSqlProntuario
      Enabled = False
      TabOrder = 4
      Visible = False
      OnChange = DBEdit1Change
    end
    object DBProprietario: TDBLookupComboBox
      Left = 564
      Top = 32
      Width = 145
      Height = 24
      DataField = 'FKPROPRIETARIO'
      DataSource = DM.DSSqlProntuario
      KeyField = 'PKPROPRIETARIO'
      ListField = 'NOMEPROPRI'
      ListSource = DM.DSSqlProprietario
      TabOrder = 5
    end
  end
end
