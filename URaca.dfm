object FRaca: TFRaca
  Left = 0
  Top = 0
  Caption = 'FRaca'
  ClientHeight = 374
  ClientWidth = 965
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
    Width = 965
    Height = 193
    Align = alTop
    DataSource = DM.DSSqlRaca
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = [fsBold]
    Columns = <
      item
        Expanded = False
        FieldName = 'PKRACA'
        Title.Alignment = taCenter
        Title.Caption = 'Cod Raca'
        Width = 113
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOMERACA'
        Title.Alignment = taCenter
        Title.Caption = 'NOME RACA'
        Width = 165
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRICAORACA'
        Title.Alignment = taCenter
        Title.Caption = 'Descri'#231#227'o'
        Width = 666
        Visible = True
      end>
  end
  object PConsulta: TPanel
    Left = 0
    Top = 333
    Width = 965
    Height = 41
    Align = alBottom
    TabOrder = 1
    object CBPregra: TComboBox
      Left = 17
      Top = 6
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
    Top = 193
    Width = 965
    Height = 57
    Align = alTop
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
  object Pdados: TPanel
    Left = 0
    Top = 250
    Width = 965
    Height = 83
    Align = alClient
    TabOrder = 3
    object DescricaoAnimal: TLabel
      Left = 56
      Top = 48
      Width = 106
      Height = 16
      Caption = 'DescricaoAnimal'
    end
    object LCodRaca: TLabel
      Left = 55
      Top = 20
      Width = 79
      Height = 16
      Caption = 'Codigo Raca'
    end
    object LNome: TLabel
      Left = 344
      Top = 23
      Width = 35
      Height = 16
      Caption = 'Nome'
    end
    object EdtDescri: TEdit
      Left = 168
      Top = 45
      Width = 569
      Height = 24
      TabOrder = 0
    end
    object EdtCodRaca: TEdit
      Left = 168
      Top = 15
      Width = 121
      Height = 24
      Enabled = False
      TabOrder = 1
    end
    object EdtNome: TEdit
      Left = 392
      Top = 15
      Width = 145
      Height = 24
      TabOrder = 2
    end
    object DBEdit1: TDBEdit
      Left = 850
      Top = 51
      Width = 115
      Height = 24
      DataField = 'PKRACA'
      DataSource = DM.DSSqlRaca
      TabOrder = 3
      Visible = False
      OnChange = DBEdit1Change
    end
  end
end
