program TesteEmbalsoft;

uses
  Vcl.Forms,
  Principal in 'Principal.pas' {frmTestEmbalsoft},
  uDMDados in 'uDMDados.pas' {dmDados: TDataModule},
  AuxUnit in 'AuxUnit.pas',
  Clientes in 'Clientes.pas' {frmClientes},
  UCliente in 'UCliente.pas',
  Contatos in 'Contatos.pas' {frmContatos};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmTestEmbalsoft, frmTestEmbalsoft);
  Application.Run;
end.
