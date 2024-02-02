object FrmSGRPClient: TFrmSGRPClient
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'SGRPC - vers'#227'o 1.2 [Desconectado]'
  ClientHeight = 341
  ClientWidth = 532
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Menu = MainMenu
  Position = poDesktopCenter
  ShowHint = True
  OnCreate = FormCreate
  TextHeight = 15
  object StatusBar: TStatusBar
    Left = 0
    Top = 322
    Width = 532
    Height = 19
    Panels = <
      item
        Alignment = taCenter
        Text = 'Normal'
        Width = 100
      end
      item
        Width = 50
      end>
    ExplicitTop = 321
    ExplicitWidth = 528
  end
  object PanelInfo: TPanel
    Left = 332
    Top = 225
    Width = 200
    Height = 97
    Align = alRight
    BevelOuter = bvNone
    Caption = 'PanelInfo'
    TabOrder = 1
    ExplicitLeft = 328
    ExplicitHeight = 96
  end
  object MemoInfo: TPanel
    Left = 0
    Top = 0
    Width = 532
    Height = 225
    Align = alTop
    Caption = 'MemoInfo'
    Color = clBlack
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 2
    ExplicitWidth = 528
    object BtnEnviaMSG: TBitBtn
      Left = 8
      Top = 227
      Width = 170
      Height = 25
      Caption = 'Envia Mensagem'
      TabOrder = 0
    end
    object BtnExecutaProg: TBitBtn
      Left = 8
      Top = 254
      Width = 170
      Height = 25
      Caption = 'Executar Programa'
      TabOrder = 2
    end
    object BtnTocarSom: TBitBtn
      Left = 8
      Top = 280
      Width = 75
      Height = 25
      Caption = 'Tocar Som'
      TabOrder = 3
    end
    object BtnEnviaComando: TBitBtn
      Left = 8
      Top = 307
      Width = 170
      Height = 25
      Caption = 'Enviar Comando'
      TabOrder = 4
    end
    object ProgressBar: TProgressBar
      Left = 184
      Top = 227
      Width = 15
      Height = 105
      Orientation = pbVertical
      Smooth = True
      TabOrder = 5
    end
    object PageControl: TPageControl
      Left = 1
      Top = 1
      Width = 530
      Height = 223
      ActivePage = TabSheetDiretorios
      Align = alClient
      TabOrder = 1
      ExplicitWidth = 526
      object TabSheetBemVindo: TTabSheet
        Caption = 'Bem Vindo!'
        object Label1: TLabel
          Left = 46
          Top = 3
          Width = 32
          Height = 13
          Caption = 'Label1'
        end
        object Label2: TLabel
          Left = 84
          Top = 3
          Width = 32
          Height = 13
          Caption = 'Label1'
        end
        object Label3: TLabel
          Left = 84
          Top = 34
          Width = 32
          Height = 13
          Caption = 'Label1'
        end
        object Label4: TLabel
          Left = 166
          Top = 34
          Width = 32
          Height = 13
          Caption = 'Label1'
        end
        object Label5: TLabel
          Left = 200
          Top = 19
          Width = 32
          Height = 13
          Caption = 'Label1'
        end
        object Label6: TLabel
          Left = 248
          Top = 19
          Width = 32
          Height = 13
          Caption = 'Label1'
        end
        object Image1: TImage
          Left = 327
          Top = 19
          Width = 105
          Height = 105
        end
      end
      object TabSheetDiretorios: TTabSheet
        Caption = 'Diret'#243'rios'
        ImageIndex = 1
        object LabelDir: TLabel
          Left = 1
          Top = 5
          Width = 36
          Height = 13
          Caption = 'Drivers:'
        end
        object LblDiretorios: TLabel
          Left = 1
          Top = 44
          Width = 100
          Height = 13
          Caption = 'Arquivos e Diret'#243'rios:'
        end
        object EditDir: TComboBox
          Left = 1
          Top = 20
          Width = 160
          Height = 21
          Sorted = True
          TabOrder = 0
          Text = 'EditDir'
        end
        object LBArquivos: TListBox
          Left = 0
          Top = 45
          Width = 522
          Height = 150
          Align = alBottom
          ItemHeight = 13
          TabOrder = 1
          ExplicitLeft = 1
          ExplicitTop = 46
        end
      end
      object TabSheetHardware: TTabSheet
        Caption = 'Hardware'
        ImageIndex = 2
        object LBHardware: TListBox
          Left = 0
          Top = 0
          Width = 522
          Height = 195
          Align = alClient
          ItemHeight = 13
          TabOrder = 0
        end
      end
      object TabSheetAplicativos: TTabSheet
        Caption = 'Aplicativos'
        ImageIndex = 3
        object LBAplicativos: TListBox
          Left = 0
          Top = 0
          Width = 522
          Height = 97
          Align = alTop
          ItemHeight = 13
          TabOrder = 0
        end
        object BtnEncerrarAplicacao: TBitBtn
          Left = 16
          Top = 171
          Width = 75
          Height = 25
          Hint = 'Tentar encerrar aplicativo!'
          Caption = 'Matar Aplica'#231#227'o'
          Enabled = False
          TabOrder = 1
        end
        object BtnMinimizar: TBitBtn
          Left = 119
          Top = 171
          Width = 75
          Height = 25
          Hint = 'Tenta minimizar aplicativo!'
          Caption = 'Minimizar'
          Enabled = False
          TabOrder = 2
        end
        object BtnEsconder: TBitBtn
          Left = 344
          Top = 167
          Width = 75
          Height = 25
          Hint = 'Tenta Esconder aplicativo!'
          Caption = 'Esconder'
          Enabled = False
          TabOrder = 3
        end
        object BtnRestaurar: TBitBtn
          Left = 232
          Top = 168
          Width = 75
          Height = 25
          Hint = 'Tentar restaurar aplicativo!'
          Caption = 'Restaurar'
          Enabled = False
          TabOrder = 4
        end
      end
    end
  end
  object SaveDialog: TSaveDialog
    Left = 200
    Top = 32
  end
  object ClientSocket: TClientSocket
    Active = False
    ClientType = ctNonBlocking
    Port = 13352
    Left = 256
    Top = 32
  end
  object MainMenu: TMainMenu
    Left = 112
    Top = 248
    object Arquivo: TMenuItem
      Caption = 'Arquivo'
      object Conectar: TMenuItem
        Caption = 'Conectar'
      end
      object Desconectar: TMenuItem
        Caption = 'Desconectar'
      end
      object Favoritos: TMenuItem
        Caption = 'Favoritos'
        object Linha: TMenuItem
          Caption = 'Linha'
        end
        object ExcluirFavoritos: TMenuItem
          Caption = 'Excluir Favoritos'
        end
      end
      object AlterarPort: TMenuItem
        Caption = 'Alterar Port'
      end
      object Sair: TMenuItem
        Caption = 'Sair'
      end
    end
    object Travessuras_Gostosuras: TMenuItem
      Caption = 'Travessuras Gostosuras'
      object Informacoes: TMenuItem
        Caption = 'Informacoes'
        object NomedoUsurio: TMenuItem
          Caption = 'Nome do Usu'#225'rio'
        end
        object SistemadeArquivos: TMenuItem
          Caption = 'Sistema de Arquivos'
        end
        object Hardware: TMenuItem
          Caption = 'Hardware'
        end
        object AplicativosFuncionando: TMenuItem
          Caption = 'Aplicativos Funcionando'
        end
        object EstadodoServidor: TMenuItem
          Caption = 'Estado do Servidor'
        end
        object HoranoServidor: TMenuItem
          Caption = 'Hora no Servidor'
        end
        object CapturareadeTrabalho1: TMenuItem
          Caption = 'Captura '#193'rea de Trabalho'
        end
      end
      object Guerra: TMenuItem
        Caption = 'Guerra'
        object AntiBoot: TMenuItem
          Caption = 'Anti-Boot'
        end
        object Boot: TMenuItem
          Caption = 'Boot'
        end
        object BotaoIniciar: TMenuItem
          Caption = 'Bot'#227'oIniciar'
        end
        object DesligarMonitor: TMenuItem
          Caption = 'Desligar Monitor'
        end
        object PegaMouse: TMenuItem
          Caption = 'Pega Mouse'
        end
        object Wincom: TMenuItem
          Caption = 'Win.com'
        end
        object DesabilitaCtrlAltDel: TMenuItem
          Caption = 'Desabilita Ctrl+Alt+Del'
        end
        object AlteraPapeldeParede: TMenuItem
          Caption = 'Altera Papel de Parede'
        end
        object InerterBotesdoMouse1: TMenuItem
          Caption = 'Inerter Bot'#245'es do Mouse'
        end
      end
      object LimparHost: TMenuItem
        Caption = 'Limpar Host'
      end
      object DesligaServidor: TMenuItem
        Caption = 'Desliga Servidor'
      end
    end
    object Ajuda1: TMenuItem
      Caption = 'Ajuda'
      object Sobre: TMenuItem
        Caption = 'Sobre...'
      end
      object Comandos: TMenuItem
        Caption = 'Comandos'
      end
      object ComoFazer: TMenuItem
        Caption = 'Como Fazer...'
      end
    end
  end
end
