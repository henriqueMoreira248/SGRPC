object FrmBitmap: TFrmBitmap
  Left = 0
  Top = 0
  Caption = 'SGRPClient - Visualizar arquivo'
  ClientHeight = 337
  ClientWidth = 532
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Menu = MainMenu
  TextHeight = 15
  object Image1: TImage
    Left = 264
    Top = 112
    Width = 105
    Height = 105
    Center = True
  end
  object MainMenu: TMainMenu
    Left = 8
    Top = 16
    object Arquivo1: TMenuItem
      Caption = 'Arquivo'
      object Salvar: TMenuItem
        Caption = 'Salvar'
      end
      object Carregar: TMenuItem
        Caption = 'Carregar'
      end
      object Fechar: TMenuItem
        Caption = 'Fechar'
      end
    end
    object Exibir: TMenuItem
      Caption = 'Exibir'
      object Ajustar: TMenuItem
        Caption = 'Ajustar'
      end
    end
  end
  object SaveDialog: TSaveDialog
    Left = 88
    Top = 16
  end
  object OpenDialog: TOpenDialog
    Left = 48
    Top = 16
  end
end
