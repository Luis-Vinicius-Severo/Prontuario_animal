object FPrincipal: TFPrincipal
  Left = 0
  Top = 0
  Caption = 'FPrincipal'
  ClientHeight = 372
  ClientWidth = 732
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object MainMenu1: TMainMenu
    Left = 352
    Top = 152
    object cadastro1: TMenuItem
      Caption = 'cadastro'
      object pro1: TMenuItem
        Caption = 'Proprietario'
        OnClick = pro1Click
      end
      object Animais1: TMenuItem
        Caption = 'Animais'
        OnClick = Animais1Click
      end
      object raca1: TMenuItem
        Caption = 'Ra'#231'a'
        OnClick = raca1Click
      end
      object Prontuario1: TMenuItem
        Caption = 'Prontuario'
        OnClick = Prontuario1Click
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object Sair1: TMenuItem
        Caption = 'Sair'
        OnClick = Sair1Click
      end
    end
  end
end
