program SGRPCServer;

uses
  Vcl.Forms,
  UServer in 'UServer.pas' {FrmSGRPCServer};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmSGRPCServer, FrmSGRPCServer);
  Application.Run;
end.
