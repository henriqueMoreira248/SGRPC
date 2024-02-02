unit USGRPClient;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ComCtrls,
  System.Win.ScktComp, Vcl.StdCtrls, Vcl.Buttons, Vcl.Tabs, Vcl.Menus,
  System.Win.Registry;

type
  TCliStatus = (csNormal, csDownload, csProcess);
  TFrmSGRPClient = class(TForm)
    SaveDialog: TSaveDialog;
    ClientSocket: TClientSocket;
    StatusBar: TStatusBar;
    PanelInfo: TPanel;
    MemoInfo: TPanel;
    BtnEnviaMSG: TBitBtn;
    BtnExecutaProg: TBitBtn;
    BtnTocarSom: TBitBtn;
    BtnEnviaComando: TBitBtn;
    ProgressBar: TProgressBar;
    PageControl: TPageControl;
    TabSheetBemVindo: TTabSheet;
    TabSheetDiretorios: TTabSheet;
    TabSheetHardware: TTabSheet;
    TabSheetAplicativos: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Image1: TImage;
    LabelDir: TLabel;
    LblDiretorios: TLabel;
    EditDir: TComboBox;
    LBArquivos: TListBox;
    LBHardware: TListBox;
    LBAplicativos: TListBox;
    BtnEncerrarAplicacao: TBitBtn;
    BtnMinimizar: TBitBtn;
    BtnEsconder: TBitBtn;
    BtnRestaurar: TBitBtn;
    MainMenu: TMainMenu;
    Arquivo: TMenuItem;
    Conectar: TMenuItem;
    Desconectar: TMenuItem;
    Favoritos: TMenuItem;
    AlterarPort: TMenuItem;
    Sair: TMenuItem;
    Travessuras_Gostosuras: TMenuItem;
    Informacoes: TMenuItem;
    Guerra: TMenuItem;
    LimparHost: TMenuItem;
    DesligaServidor: TMenuItem;
    Ajuda1: TMenuItem;
    Sobre: TMenuItem;
    Comandos: TMenuItem;
    ComoFazer: TMenuItem;
    Linha: TMenuItem;
    ExcluirFavoritos: TMenuItem;
    NomedoUsurio: TMenuItem;
    SistemadeArquivos: TMenuItem;
    Hardware: TMenuItem;
    AplicativosFuncionando: TMenuItem;
    EstadodoServidor: TMenuItem;
    HoranoServidor: TMenuItem;
    CapturareadeTrabalho1: TMenuItem;
    AntiBoot: TMenuItem;
    Boot: TMenuItem;
    BotaoIniciar: TMenuItem;
    DesligarMonitor: TMenuItem;
    PegaMouse: TMenuItem;
    Wincom: TMenuItem;
    DesabilitaCtrlAltDel: TMenuItem;
    AlteraPapeldeParede: TMenuItem;
    InerterBotesdoMouse1: TMenuItem;

    procedure FormCreate(Sender: TObject);



  private
    { Private declarations }
    CliStatus: TCliStatus;

    Procedure AlterarStatus(StatusClient: TCliStatus);
    Procedure ConectarFavorito(Sender: TObject);

  public
    { Public declarations }

    Procedure AppHint(Sender: TObject);

  end;

var
  FrmSGRPClient: TFrmSGRPClient;

implementation

{$R *.dfm}

procedure TFrmSGRPClient.AlterarStatus(StatusClient: TCliStatus);
begin
  CliStatus := StatusClient;
  case StatusClient of
    csNormal:
      StatusBar.Panels[0].Text := 'Normal';
    csProcess:
      StatusBar.Panels[0].Text := 'Processando...';
    csDownload:
      StatusBar.Panels[0].Text := 'Download...';
  end;
end;

Procedure TFrmSGRPClient.AppHint(Sender: TObject);
begin
  StatusBar.Panels[1].Text := Application.Hint;
end;

procedure TFrmSGRPClient.FormCreate(Sender: TObject);
var
  Reg: TRegistry;
  I: Integer;
  SubMenu: TMenuItem;
begin
  AlterarStatus(csNormal);
  Travessuras_Gostosuras.Enabled := False;
  PanelInfo.Enabled := False;
  Desconectar.Enabled := False;
  PageControl.ActivePageIndex := 0;
  Application.OnHint := appHint;
  Try
    {Configura Port}
    Reg := TRegistry.Create;
    Reg.RootKey := HKEY_LOCAL_MACHINE;
    Reg.OpenKey('\Software\VisualBooks\SGRPClient', True);
    ClientSocket.Port := StrToInt
    (Reg.ReadString('Port'));
    AlterarPort.Caption := 'Alterar Port ('+IntToStr(ClientSocket.Port)+')';

    {Monta Favoritos}
    Reg.OpenKey('\Software\VisualBooks\SGRPClient\Hosts', True);
    If (Reg.ValueExists('NumHosts')) Then
    Begin
      for I := Reg.ReadInteger('NumHosts') DownTo 1 do
          Begin
            SubMenu := TMenuItem.Create(self);
            SubMenu.Caption := Reg.ReadString(IntToStr(I));
            SubMenu.OnClick := ConectarFavorito;
            Favoritos.Add(SubMenu);
          End;
          Linha.MenuIndex := Favoritos.Count - 1;
          ExcluirFavoritos.MenuIndex := Favoritos.Count;
    End;
    Reg.CloseKey;
    Reg.Free;
  Except
    ClientSocket.Port := 13352;
    AlterarPort.Caption := 'Alterar Port (13352)';
  End;
end;


Procedure TFrmSGRPClient.ConectarFavorito(Sender: TObject);
Begin
  ClientSocket.Active := False;
  {Para funcionar, altere para Manual a propriedade
  AUTOHOTKEY de MAINMENU}
  ClientSocket.Host := (Sender as TMenuItem).Caption;
  ClientSocket.Active := True;
End;



end.
