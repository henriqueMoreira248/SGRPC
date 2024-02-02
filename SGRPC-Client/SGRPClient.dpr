program SGRPClient;

uses
  Vcl.Forms,
  USGRPClient in 'USGRPClient.pas' {FrmSGRPClient},
  UBitmap in 'UBitmap.pas' {FrmBitmap};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmSGRPClient, FrmSGRPClient);
  Application.CreateForm(TFrmBitmap, FrmBitmap);
  Application.Run;
end.
