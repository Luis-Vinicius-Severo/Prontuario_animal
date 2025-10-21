object FDespesas: TFDespesas
  Left = 0
  Top = 0
  Caption = 'FDespesas'
  ClientHeight = 415
  ClientWidth = 1124
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
    Width = 1124
    Height = 138
    Align = alTop
    DataSource = DM.DSSqlDespesas
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = [fsBold]
    Columns = <
      item
        Expanded = False
        FieldName = 'PKITEMDESP'
        Title.Alignment = taCenter
        Title.Caption = 'C'#211'DIGO DESPESAS'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FKPRONTUARIO'
        Title.Alignment = taCenter
        Title.Caption = 'C'#211'DIGO PRONTU'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRICAO'
        Title.Alignment = taCenter
        Width = 478
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QUANTIDADE'
        Title.Alignment = taCenter
        Width = 97
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALORUNIT'
        Title.Alignment = taCenter
        Title.Caption = 'VALOR UNIT'
        Width = 129
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALORTOTAL'
        Title.Alignment = taCenter
        Title.Caption = 'VALOR TOTAL'
        Width = 114
        Visible = True
      end>
  end
  object PDadosProntu: TPanel
    Left = 0
    Top = 138
    Width = 1124
    Height = 65
    Align = alTop
    TabOrder = 1
    object LCodAnimal: TLabel
      Left = 16
      Top = 24
      Width = 90
      Height = 16
      Caption = 'C'#243'digo Animal'
    end
    object LProprietario: TLabel
      Left = 419
      Top = 24
      Width = 125
      Height = 16
      Caption = 'C'#243'digo Proprietario'
    end
    object LBNomeAnimal: TLabel
      Left = 255
      Top = 24
      Width = 93
      Height = 16
      Caption = 'LBNomeAnimal'
    end
    object LBNomePropri: TLabel
      Left = 693
      Top = 24
      Width = 89
      Height = 16
      Caption = 'LBNomePropri'
    end
    object LProntuario: TLabel
      Left = 904
      Top = 11
      Width = 69
      Height = 16
      Caption = 'Prontuario'
    end
    object LDespesas: TLabel
      Left = 904
      Top = 39
      Width = 62
      Height = 16
      Caption = 'Despesas'
    end
    object EdtProprietario: TEdit
      Left = 566
      Top = 21
      Width = 121
      Height = 24
      Enabled = False
      TabOrder = 0
      OnExit = EdtProprietarioExit
    end
    object EdtAnimal: TEdit
      Left = 128
      Top = 21
      Width = 121
      Height = 24
      Enabled = False
      TabOrder = 1
      OnExit = EdtAnimalExit
    end
    object EdtProntuario: TEdit
      Left = 979
      Top = 6
      Width = 121
      Height = 24
      Enabled = False
      TabOrder = 2
      OnExit = EdtProprietarioExit
    end
    object EdtCodDespesas: TEdit
      Left = 979
      Top = 36
      Width = 121
      Height = 24
      Enabled = False
      TabOrder = 3
      OnExit = EdtCodDespesasExit
    end
  end
  object PBotoes: TPanel
    Left = 0
    Top = 358
    Width = 1124
    Height = 57
    Align = alBottom
    TabOrder = 2
    object BtSalvar: TBitBtn
      Left = 535
      Top = 7
      Width = 105
      Height = 41
      Caption = 'Salvar'
      TabOrder = 0
      OnClick = BtSalvarClick
    end
    object BtEditar: TBitBtn
      Left = 780
      Top = 7
      Width = 105
      Height = 41
      Caption = 'Editar'
      TabOrder = 1
      OnClick = BtEditarClick
    end
    object BtPesquisar: TBitBtn
      Left = 32
      Top = 16
      Width = 105
      Height = 33
      Caption = 'Atualizar'
      TabOrder = 2
      OnClick = BtPesquisarClick
    end
    object BtRemover: TBitBtn
      Left = 659
      Top = 7
      Width = 105
      Height = 41
      Caption = 'Remover'
      TabOrder = 3
      OnClick = BtRemoverClick
    end
    object BtCancelar: TBitBtn
      Left = 901
      Top = 7
      Width = 105
      Height = 41
      Caption = 'Cancelar'
      TabOrder = 4
      OnClick = BtCancelarClick
    end
    object BtSair: TBitBtn
      Left = 1023
      Top = 7
      Width = 91
      Height = 41
      Caption = 'Sair'
      TabOrder = 5
      OnClick = BtSairClick
    end
  end
  object PDados: TPanel
    Left = 0
    Top = 203
    Width = 1124
    Height = 155
    Align = alClient
    TabOrder = 3
    object LDescricao: TLabel
      Left = 32
      Top = 64
      Width = 63
      Height = 16
      Caption = 'Descricao'
    end
    object LQuantidade: TLabel
      Left = 712
      Top = 16
      Width = 74
      Height = 16
      Caption = 'Quantidade'
    end
    object LValorUnit: TLabel
      Left = 712
      Top = 56
      Width = 88
      Height = 16
      Caption = 'Valor Unitario'
    end
    object Label1: TLabel
      Left = 712
      Top = 96
      Width = 70
      Height = 16
      Caption = 'Valor Total'
    end
    object EdtQuantidade: TEdit
      Left = 812
      Top = 12
      Width = 121
      Height = 24
      TabOrder = 0
      OnExit = EdtQuantidadeExit
    end
    object EdtValorUnit: TEdit
      Left = 812
      Top = 55
      Width = 121
      Height = 24
      TabOrder = 1
      OnExit = EdtValorUnitExit
    end
    object EdtDescricao: TEdit
      Left = 112
      Top = 64
      Width = 513
      Height = 24
      TabOrder = 2
    end
    object EdtValorTotal: TEdit
      Left = 812
      Top = 93
      Width = 121
      Height = 24
      Enabled = False
      TabOrder = 3
    end
    object DBEdit1: TDBEdit
      Left = 1009
      Top = 132
      Width = 115
      Height = 24
      DataField = 'FKPRONTUARIO'
      DataSource = DM.DSSqlDespesas
      Enabled = False
      TabOrder = 4
      Visible = False
      OnChange = DBEdit1Change
    end
  end
end
