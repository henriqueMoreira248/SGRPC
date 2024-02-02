object FrmSGRPCServer: TFrmSGRPCServer
  Left = 0
  Top = 0
  Caption = 'SGRPC'#39's - Servidor para Windows'
  ClientHeight = 442
  ClientWidth = 429
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  TextHeight = 15
  object Info: TMemo
    Left = 244
    Top = 0
    Width = 185
    Height = 442
    Align = alRight
    Lines.Strings = (
      'Info')
    ScrollBars = ssBoth
    TabOrder = 0
    ExplicitLeft = 240
    ExplicitHeight = 441
  end
  object DirectoryListBox: TDirectoryListBox
    Left = 8
    Top = 48
    Width = 145
    Height = 97
    FileList = FileListBox
    TabOrder = 1
  end
  object DriveComboBox: TDriveComboBox
    Left = 8
    Top = 8
    Width = 145
    Height = 21
    DirList = DirectoryListBox
    TabOrder = 2
  end
  object FileListBox: TFileListBox
    Left = 8
    Top = 184
    Width = 145
    Height = 97
    FileType = [ftReadOnly, ftHidden, ftSystem, ftVolumeID, ftDirectory, ftArchive, ftNormal]
    ItemHeight = 15
    TabOrder = 3
  end
  object MouseTimer: TTimer
    Enabled = False
    Interval = 1
    Left = 96
    Top = 328
  end
  object ServerSocket: TServerSocket
    Active = False
    Port = 13352
    ServerType = stNonBlocking
    OnAccept = ServerSocketAccept
    OnClientDisconnect = ServerSocketClientDisconnect
    OnClientRead = ServerSocketClientRead
    Left = 40
    Top = 328
  end
end
