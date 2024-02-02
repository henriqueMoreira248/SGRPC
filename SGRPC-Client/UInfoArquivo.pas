unit UInfoArquivo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.ComCtrls;

type
  TFrmInfoArquivo = class(TForm)
    PageControl1: TPageControl;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    LblLocal: TLabel;
    LblTipo: TLabel;
    LblNome: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    LblTamanho: TLabel;
    BtnRenomear: TBitBtn;
    BtnApagar: TBitBtn;
    BtnExecutar: TBitBtn;
    BtnDownload: TBitBtn;
    BtnOK: TBitBtn;
    CBSomenteLeitura: TCheckBox;
    CBOculto: TCheckBox;
    CBArquivo: TCheckBox;
    CBSistema: TCheckBox;
    Geral: TTabSheet;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmInfoArquivo: TFrmInfoArquivo;

implementation

{$R *.dfm}

end.
