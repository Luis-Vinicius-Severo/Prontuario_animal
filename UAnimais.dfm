object FAnimais: TFAnimais
  Left = 0
  Top = 0
  Caption = 'FAnimais'
  ClientHeight = 389
  ClientWidth = 1024
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
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 1024
    Height = 169
    Align = alTop
    Color = clCream
    DataSource = DM.DSSQLAnimais
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = [fsBold]
    Columns = <
      item
        Expanded = False
        FieldName = 'PKANIMAL'
        Title.Alignment = taCenter
        Title.Caption = 'C'#243'digo Animal'
        Width = 111
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOMEANIMAL'
        Title.Alignment = taCenter
        Title.Caption = 'NOME'
        Width = 158
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DATANASCIMENTO'
        Title.Alignment = taCenter
        Width = 152
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FKRACA'
        Title.Alignment = taCenter
        Title.Caption = 'RA'#199'A'
        Width = 81
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PESO'
        Title.Alignment = taCenter
        Width = 74
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FKPROPRIETARIO'
        Title.Alignment = taCenter
        Title.Caption = 'PROPRIETARIO'
        Width = 165
        Visible = True
      end>
  end
  object Pdados: TPanel
    Left = 0
    Top = 222
    Width = 1032
    Height = 125
    Caption = 'Ra'#231'a'
    TabOrder = 1
    object LCodAnimal: TLabel
      Left = 16
      Top = 32
      Width = 90
      Height = 16
      Caption = 'C'#243'digo Animal'
    end
    object LNome: TLabel
      Left = 40
      Top = 72
      Width = 35
      Height = 16
      Caption = 'Nome'
    end
    object LDataNasc: TLabel
      Left = 376
      Top = 32
      Width = 105
      Height = 16
      Caption = 'DataNascimento'
    end
    object LRaca: TLabel
      Left = 767
      Top = 62
      Width = 32
      Height = 16
      Caption = 'Raca'
    end
    object LPeso: TLabel
      Left = 426
      Top = 62
      Width = 31
      Height = 16
      Caption = 'Peso'
    end
    object Label1: TLabel
      Left = 735
      Top = 32
      Width = 78
      Height = 16
      Caption = 'Proprietario'
    end
    object EdtCodAnimal: TEdit
      Left = 128
      Top = 24
      Width = 121
      Height = 24
      Enabled = False
      TabOrder = 0
      Text = 'EdtCodAnimal'
    end
    object EdtNome: TEdit
      Left = 128
      Top = 64
      Width = 121
      Height = 24
      TabOrder = 1
      Text = 'EdtNome'
    end
    object EdtPeso: TEdit
      Left = 496
      Top = 54
      Width = 121
      Height = 24
      TabOrder = 2
      Text = 'EdtPeso'
    end
    object EdtDataNasc: TMaskEdit
      Left = 497
      Top = 24
      Width = 120
      Height = 24
      EditMask = '99/99/9999;1;_'
      MaxLength = 10
      TabOrder = 3
      Text = '  /  /    '
    end
    object DBEdit1: TDBEdit
      Left = 282
      Top = 94
      Width = 115
      Height = 24
      DataField = 'PKANIMAL'
      DataSource = DM.DSSQLAnimais
      TabOrder = 4
      Visible = False
      OnChange = DBEdit1Change
    end
    object DBProprietario: TDBLookupComboBox
      Left = 836
      Top = 30
      Width = 145
      Height = 24
      DataField = 'FKPROPRIETARIO'
      DataSource = DM.DSSQLAnimais
      KeyField = 'PKPROPRIETARIO'
      ListField = 'NOMEPROPRI'
      ListSource = DM.DSSqlProprietario
      TabOrder = 5
    end
    object DBRaca: TDBLookupComboBox
      Left = 836
      Top = 60
      Width = 145
      Height = 24
      DataField = 'FKRACA'
      DataSource = DM.DSSQLAnimais
      KeyField = 'PKRACA'
      ListField = 'NOMERACA'
      ListSource = DM.DSSqlRaca
      TabOrder = 6
    end
  end
  object PBotoes: TPanel
    Left = 0
    Top = 168
    Width = 1024
    Height = 57
    TabOrder = 2
    object BtSair: TBitBtn
      Left = 767
      Top = 7
      Width = 91
      Height = 41
      Caption = 'Sair'
      TabOrder = 0
      OnClick = BtSairClick
    end
    object BtCancelar: TBitBtn
      Left = 640
      Top = 7
      Width = 105
      Height = 41
      Caption = 'Cancelar'
      TabOrder = 1
      OnClick = BtCancelarClick
    end
    object BtSalvar: TBitBtn
      Left = 512
      Top = 7
      Width = 105
      Height = 41
      Caption = 'Salvar'
      TabOrder = 2
      OnClick = BtSalvarClick
    end
    object BtRemover: TBitBtn
      Left = 384
      Top = 7
      Width = 105
      Height = 41
      Caption = 'Remover'
      TabOrder = 3
      OnClick = BtRemoverClick
    end
    object BtEditar: TBitBtn
      Left = 256
      Top = 7
      Width = 105
      Height = 41
      Caption = 'Editar'
      TabOrder = 4
      OnClick = BtEditarClick
    end
    object BtNovo: TBitBtn
      Left = 128
      Top = 7
      Width = 105
      Height = 41
      Caption = 'Novo'
      TabOrder = 5
      OnClick = BtNovoClick
    end
  end
  object PConsulta: TPanel
    Left = 0
    Top = 348
    Width = 1024
    Height = 41
    Align = alBottom
    TabOrder = 3
    object CBPregra: TComboBox
      Left = 16
      Top = 8
      Width = 145
      Height = 24
      Style = csDropDownList
      ItemIndex = 0
      TabOrder = 0
      Text = 'Todos'
      Items.Strings = (
        'Todos'
        'C'#243'digo igual '#225
        'Nome iniciado por'
        '')
    end
    object EdtPesq: TEdit
      Left = 232
      Top = 8
      Width = 225
      Height = 24
      TabOrder = 1
    end
    object BtPesquisa: TBitBtn
      Left = 856
      Top = 5
      Width = 97
      Height = 25
      Caption = 'Pesquisar'
      TabOrder = 2
      OnClick = BtPesquisaClick
    end
  end
end
