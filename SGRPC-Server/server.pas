unit server;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.FileCtrl,
  System.Win.ScktComp, Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
    MouseTimer: TTimer;
    ServerSocket: TServerSocket;
    Info: TMemo;
    DirectoryListBox: TDirectoryListBox;
    DriveComboBox: TDriveComboBox;
    FileListBox: TFileListBox;
    procedure FormCreate(Sender: TObject);
    procedure ServerSocketAccept(Sender: TObject; Socket: TCustomWinSocket);
    procedure ServerSocketClientDisconnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure ServerSocketClientRead(Sender: TObject; Socket: TCustomWinSocket);
  private
    { Private declarations }
  public
    { Public declarations }

    procedure AppException(Sender: TObject; E: Exception);

    end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TFrmSGRPCServer.AppException(Sender: TObject; E: Exception);
begin
     Info.Lines.Add('Erro no sistema da classe ' + E.ClassName);
     Info.Lines.Add('Mensagem: ' + E.Message)
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  ServerSocket.Active:=True;
end;

procedure TForm1.ServerSocketAccept(Sender: TObject; Socket: TCustomWinSocket);
begin
  Info.Lines.Add(Socket.RemoteAddress+'conectado!');
  Socket.SendText('Text!Text!Voc� est� conectado. Seja bem vino e divirta-se!')
end;

procedure TForm1.ServerSocketClientDisconnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  Info.Lines.Add(Socket.RemoteAddress+'desconectado!')
end;



procedure TForm1.ServerSocketClientRead(Sender: TObject;
  Socket: TCustomWinSocket);
var
  Msg:String;
begin
  Msg:=Socket.ReceiveText;
  Info.Lines.Add(Socket.RemoteAddress+' - ' + Msg)
end;

end.
