unit Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons;

type
  TfrmTestEmbalsoft = class(TForm)
    btnCadCliente: TBitBtn;
    pnlCheckBD: TPanel;
    btnConectaBD: TBitBtn;
    btnContatos: TBitBtn;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnCadClienteClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnConectaBDClick(Sender: TObject);
    procedure btnContatosClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    procedure Conectar;
  public
    { Public declarations }
  end;

var
  frmTestEmbalsoft: TfrmTestEmbalsoft;

implementation

{$R *.dfm}

uses uDMDados, Clientes, Contatos;

procedure TfrmTestEmbalsoft.btnContatosClick(Sender: TObject);
begin
  if not Assigned(frmContatos) then
    frmContatos := TfrmContatos.Create(Application);
  try
    frmContatos.ShowModal;
  finally
    FreeAndNil(frmContatos);
  end;

end;

procedure TfrmTestEmbalsoft.Button1Click(Sender: TObject);
begin
   ShowMessage('Welcome Janine!');
end;

procedure TfrmTestEmbalsoft.btnCadClienteClick(Sender: TObject);
begin
  if not Assigned(frmClientes) then
    frmClientes := TfrmClientes.Create(Application);
  try
    frmClientes.ShowModal;
  finally
    FreeAndNil(frmClientes);
  end;

end;

procedure TfrmTestEmbalsoft.FormCreate(Sender: TObject);
begin
  if not Assigned(dmDados) then
    dmDados := TdmDados.Create(Application);

  Conectar;
end;

procedure TfrmTestEmbalsoft.btnConectaBDClick(Sender: TObject);
begin
  ShowMessage('Certifique-se de ter o arquivo Config.ini' + #13 + 'no diretótio raiz com os elementos:' + #13 + '[Config]' + #13 +
    'CaminhoBD="caminho do banco"' + #13 + 'NomeBanco="nome do banco"' + #13 + 'E clique em Ok.');

  Conectar;
end;

procedure TfrmTestEmbalsoft.Conectar;
begin
  pnlCheckBD.Caption := dmDados.ConectaBanco;

  if dmDados.conDB.Connected then
    pnlCheckBD.Hide
  else
    pnlCheckBD.Color := clRed;
end;

procedure TfrmTestEmbalsoft.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(dmDados);
end;

end.
