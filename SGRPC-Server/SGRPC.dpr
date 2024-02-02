program SGRPC;

uses
  Vcl.Forms,
  SGRPServer in 'SGRPServer.pas' {FrmSGRPCServer};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmSGRPCServer, FrmSGRPCServer);
  Application.Run;
end.
