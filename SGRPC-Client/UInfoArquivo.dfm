object FrmInfoArquivo: TFrmInfoArquivo
  Left = 0
  Top = 0
  Caption = 'Propriedades do arquivo'
  ClientHeight = 442
  ClientWidth = 628
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object PageControl1: TPageControl
    Left = 32
    Top = 32
    Width = 545
    Height = 368
    ActivePage = Geral
    TabOrder = 0
    object Geral: TTabSheet
      Caption = 'Geral'
      object Label9: TLabel
        Left = 34
        Top = 99
        Width = 36
        Height = 15
        Caption = 'Nome:'
      end
      object Label8: TLabel
        Left = 34
        Top = 141
        Width = 31
        Height = 15
        Caption = 'Local:'
      end
      object Label7: TLabel
        Left = 446
        Top = 171
        Width = 56
        Height = 15
        Caption = 'BtnApagar'
      end
      object Label6: TLabel
        Left = 344
        Top = 276
        Width = 63
        Height = 15
        Caption = 'BtnExecutar'
      end
      object Image1: TImage
        Left = 357
        Top = 30
        Width = 105
        Height = 105
      end
      object Label1: TLabel
        Left = 34
        Top = 162
        Width = 52
        Height = 15
        Caption = 'Tamanho:'
      end
      object Label10: TLabel
        Left = 16
        Top = 212
        Width = 52
        Height = 15
        Caption = 'Atributos:'
      end
      object Label11: TLabel
        Left = 446
        Top = 275
        Width = 72
        Height = 15
        Caption = 'BtnDonwload'
      end
      object LblTamanho: TLabel
        Left = 111
        Top = 162
        Width = 30
        Height = 15
        Caption = '30000'
      end
      object Label2: TLabel
        Left = 34
        Top = 120
        Width = 26
        Height = 15
        Caption = 'Tipo:'
      end
      object LblLocal: TLabel
        Left = 95
        Top = 141
        Width = 16
        Height = 15
        Caption = 'C:\'
      end
      object LblTipo: TLabel
        Left = 95
        Top = 120
        Width = 19
        Height = 15
        Caption = '.pal'
      end
      object LblNome: TLabel
        Left = 95
        Top = 99
        Width = 73
        Height = 15
        Caption = 'C:\activity.pal'
      end
      object BtnRenomear: TBitBtn
        Left = 320
        Top = 192
        Width = 107
        Height = 25
        Caption = 'Renomear/Mover'
        TabOrder = 0
      end
      object BtnApagar: TBitBtn
        Left = 446
        Top = 192
        Width = 75
        Height = 25
        Caption = 'Apagar'
        TabOrder = 1
      end
      object BtnExecutar: TBitBtn
        Left = 320
        Top = 245
        Width = 107
        Height = 25
        Caption = 'Executar'
        TabOrder = 2
      end
      object BtnDownload: TBitBtn
        Left = 446
        Top = 245
        Width = 75
        Height = 25
        Caption = 'Download'
        TabOrder = 3
      end
      object BtnOK: TBitBtn
        Left = 446
        Top = 310
        Width = 75
        Height = 25
        Caption = 'OK'
        TabOrder = 4
      end
      object CBSomenteLeitura: TCheckBox
        Left = 71
        Top = 233
        Width = 106
        Height = 17
        Caption = 'Somente Leitura'
        TabOrder = 5
      end
      object CBOculto: TCheckBox
        Left = 200
        Top = 234
        Width = 97
        Height = 17
        Caption = 'Oculto'
        TabOrder = 6
      end
      object CBArquivo: TCheckBox
        Left = 72
        Top = 265
        Width = 97
        Height = 17
        Caption = 'Arquivo'
        TabOrder = 7
      end
      object CBSistema: TCheckBox
        Left = 200
        Top = 265
        Width = 97
        Height = 17
        Caption = 'Sistema'
        TabOrder = 8
      end
    end
  end
end
