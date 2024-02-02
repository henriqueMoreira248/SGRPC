unit UBitmap;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Menus;

type
  TFrmBitmap = class(TForm)
    MainMenu: TMainMenu;
    Image1: TImage;
    SaveDialog: TSaveDialog;
    OpenDialog: TOpenDialog;
    Arquivo1: TMenuItem;
    Salvar: TMenuItem;
    Carregar: TMenuItem;
    Fechar: TMenuItem;
    Exibir: TMenuItem;
    Ajustar: TMenuItem;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmBitmap: TFrmBitmap;

implementation

{$R *.dfm}

end.
