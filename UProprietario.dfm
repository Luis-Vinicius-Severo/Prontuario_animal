object FProprietario: TFProprietario
  Left = 0
  Top = 0
  Caption = 'FProprietario'
  ClientHeight = 461
  ClientWidth = 1024
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -15
  Font.Name = 'Tahoma'
  Font.Style = [fsBold]
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 18
  object PDados: TPanel
    Left = -24
    Top = 278
    Width = 1047
    Height = 157
    TabOrder = 0
    object LNome: TLabel
      Left = 48
      Top = 72
      Width = 43
      Height = 18
      Caption = 'Nome'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label1: TLabel
      Left = 686
      Top = 30
      Width = 59
      Height = 18
      Caption = 'Numero'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Endereço: TLabel
      Left = 37
      Top = 110
      Width = 69
      Height = 18
      Caption = 'Endere'#231'o'
    end
    object Cidade: TLabel
      Left = 426
      Top = 32
      Width = 51
      Height = 18
      Caption = 'Cidade'
    end
    object Estado: TLabel
      Left = 427
      Top = 72
      Width = 50
      Height = 18
      Caption = 'Estado'
    end
    object CEP: TLabel
      Left = 439
      Top = 112
      Width = 29
      Height = 18
      Caption = 'CEP'
    end
    object TLabel
      Left = 640
      Top = 56
      Width = 4
      Height = 18
    end
    object Label2: TLabel
      Left = 694
      Top = 72
      Width = 47
      Height = 18
      Caption = 'Bairro'
    end
    object Label3: TLabel
      Left = 48
      Top = 32
      Width = 51
      Height = 18
      Caption = 'C'#243'digo'
    end
    object EdtCodigo: TEdit
      Left = 120
      Top = 32
      Width = 121
      Height = 26
      Enabled = False
      TabOrder = 0
    end
    object EdtNome: TEdit
      Left = 120
      Top = 64
      Width = 121
      Height = 26
      TabOrder = 1
    end
    object EdtEndereco: TEdit
      Left = 120
      Top = 110
      Width = 121
      Height = 26
      TabOrder = 2
    end
    object edtCidade: TEdit
      Left = 488
      Top = 32
      Width = 121
      Height = 26
      TabOrder = 3
    end
    object EdtEstado: TEdit
      Left = 488
      Top = 64
      Width = 121
      Height = 26
      TabOrder = 4
    end
    object EdtCep: TEdit
      Left = 488
      Top = 110
      Width = 121
      Height = 26
      TabOrder = 5
    end
    object EdtNumero: TEdit
      Left = 761
      Top = 32
      Width = 121
      Height = 26
      TabOrder = 6
    end
    object EdtBairro: TEdit
      Left = 761
      Top = 64
      Width = 121
      Height = 26
      TabOrder = 7
    end
    object DBEdit1: TDBEdit
      Left = 926
      Top = 110
      Width = 115
      Height = 26
      DataField = 'PKPROPRIETARIO'
      DataSource = DM.DSSqlProprietario
      Enabled = False
      TabOrder = 8
      OnChange = DBEdit1Change
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 1024
    Height = 225
    Align = alTop
    DataSource = DM.DSSqlProprietario
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -15
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = [fsBold]
    Columns = <
      item
        Expanded = False
        FieldName = 'PKPROPRIETARIO'
        Title.Alignment = taCenter
        Title.Caption = 'Codigo Proprietario'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOMEPROPRI'
        Title.Alignment = taCenter
        Title.Caption = 'NOME'
        Width = 208
        Visible = True
      end
      item
        Alignment = taCenter
        Color = clCream
        Expanded = False
        FieldName = 'ENDERECO'
        Title.Alignment = taCenter
        Width = 142
        Visible = True
      end
      item
        Alignment = taCenter
        Color = clCream
        Expanded = False
        FieldName = 'NUMERO'
        Title.Alignment = taCenter
        Width = 102
        Visible = True
      end
      item
        Alignment = taCenter
        Color = clCream
        Expanded = False
        FieldName = 'BAIRRO'
        Title.Alignment = taCenter
        Width = 128
        Visible = True
      end
      item
        Alignment = taCenter
        Color = clCream
        Expanded = False
        FieldName = 'CIDADE'
        Title.Alignment = taCenter
        Width = 113
        Visible = True
      end
      item
        Alignment = taCenter
        Color = clCream
        Expanded = False
        FieldName = 'ESTADO'
        Title.Alignment = taCenter
        Width = 95
        Visible = True
      end
      item
        Alignment = taCenter
        Color = clCream
        Expanded = False
        FieldName = 'CEP'
        Title.Alignment = taCenter
        Width = 109
        Visible = True
      end>
  end
  object PBotoes: TPanel
    Left = 0
    Top = 224
    Width = 1023
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
      Left = 515
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
    Top = 420
    Width = 1024
    Height = 41
    Align = alBottom
    TabOrder = 3
    object CBPregra: TComboBox
      Left = 24
      Top = 8
      Width = 145
      Height = 26
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
      Height = 26
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
end
