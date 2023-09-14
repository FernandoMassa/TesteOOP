unit Clientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, System.MaskUtils,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.WinXPickers, Vcl.Mask,
  Vcl.DBCtrls;

type
  TfrmClientes = class(TForm)
    pcCliente: TPageControl;
    tsCons: TTabSheet;
    tsCad: TTabSheet;
    griClientes: TDBGrid;
    Panel1: TPanel;
    rgOpcoes: TRadioGroup;
    edtCampoBusca: TEdit;
    dtpDatanasc: TDatePicker;
    Label1: TLabel;
    chkDtNasc: TCheckBox;
    btnBuscar: TButton;
    edtCliente: TEdit;
    edtRazaoSocial: TEdit;
    Label2: TLabel;
    Panel2: TPanel;
    btnNovo: TButton;
    btnApagar: TButton;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    edtDTNasc: TDatePicker;
    Label6: TLabel;
    btnAlterar: TButton;
    Label7: TLabel;
    edtID: TEdit;
    btnCopiaDados: TButton;
    Panel3: TPanel;
    DBGrid1: TDBGrid;
    Panel4: TPanel;
    edtCNPJ: TEdit;
    edtCPF: TEdit;
    pnlContato: TPanel;
    DBGrid2: TDBGrid;
    Panel6: TPanel;
    cadContato: TButton;
    btnSalvar: TButton;
    procedure chkDtNascClick(Sender: TObject);
    procedure btnBuscarClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCopiaDadosClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnApagarClick(Sender: TObject);
    procedure cadContatoClick(Sender: TObject);
  private
    { Private declarations }
    vTipoEvento: Char;
    function InsereUpdateCliente(AEvento: Char): Boolean;
    function SoNumeros(const ATexto: string): string;
  public
    { Public declarations }
  end;

var
  frmClientes: TfrmClientes;

implementation

{$R *.dfm}

uses uDMDados, UCliente, Contatos;

procedure TfrmClientes.btnAlterarClick(Sender: TObject);
begin
  edtCliente.ReadOnly := false;
  edtRazaoSocial.ReadOnly := false;
  edtCNPJ.ReadOnly := false;
  edtCPF.ReadOnly := false;
  edtDTNasc.Enabled := true;

  btnNovo.Enabled := false;
  btnAlterar.Enabled := false;
  btnApagar.Enabled := false;
  btnSalvar.Enabled := true;

  vTipoEvento := 'A';
end;

procedure TfrmClientes.btnApagarClick(Sender: TObject);
var
  vCliente: TCliente;
begin
  vCliente := TCliente.Create;
  try
    vCliente.IDCliente := StrToIntDef(edtID.Text, 0);
    if vCliente.DeletaCliente then
    begin
      edtCliente.Text := '';
      edtRazaoSocial.Text := '';
      edtCNPJ.Text := '';
      edtCPF.Text := '';
      edtDTNasc.Date := Now;
      pcCliente.ActivePage := tsCons;
      btnBuscar.Click;
    end;
  finally
    FreeAndNil(vCliente);
  end;
end;

procedure TfrmClientes.btnBuscarClick(Sender: TObject);
var
  vTipoDado: string;
  vDtNasc: TDate;
begin
  vDtNasc := 0;

  case rgOpcoes.ItemIndex of
    0:
      vTipoDado := 'CLIENTE';
    1:
      vTipoDado := 'RAZAOSOCIAL';
    2:
      vTipoDado := 'CNPJ';
    3:
      vTipoDado := 'CPF';
  end;

  if chkDtNasc.Checked then
    vDtNasc := dtpDatanasc.Date;

  TCliente.BuscaCliente(UpperCase(trim(edtCampoBusca.Text)), vTipoDado, vDtNasc);
end;

procedure TfrmClientes.btnCopiaDadosClick(Sender: TObject);
begin
  edtID.Text := dmDados.qryCliente.FieldByName('IDCLIENTE').AsString;
  edtCliente.Text := dmDados.qryCliente.FieldByName('CLIENTE').AsString;
  edtRazaoSocial.Text := dmDados.qryCliente.FieldByName('RAZAOSOCIAL').AsString;
  edtCNPJ.Text := dmDados.qryCliente.FieldByName('CNPJ').AsString;
  // FormatMaskText('##.###.###/###-##', dmDados.qryCliente.FieldByName('CNPJ').AsString);
  edtCPF.Text := dmDados.qryCliente.FieldByName('CPF').AsString;
  // FormatMaskText('###.###.###-##', dmDados.qryCliente.FieldByName('CPF').AsString);
  edtDTNasc.Date := dmDados.qryCliente.FieldByName('DTNASCIMENTO').AsDateTime;

  pcCliente.ActivePage := tsCad;
end;

procedure TfrmClientes.btnNovoClick(Sender: TObject);
begin
  edtCliente.ReadOnly := false;
  edtRazaoSocial.ReadOnly := false;
  edtCNPJ.ReadOnly := false;
  edtCPF.ReadOnly := false;
  edtDTNasc.Enabled := true;
  pnlContato.Hide;
  if trim(edtCliente.Text) <> '' then
    if MessageDlg('Deseja manter os dados que estão nos campos?', mtConfirmation, [mbYes, mbNo], 0, mbYes) = mrNo then
    begin
      edtCliente.Text := '';
      edtRazaoSocial.Text := '';
      edtCNPJ.Text := '';
      edtCPF.Text := '';
      edtDTNasc.Date := Now;
    end;

  btnNovo.Enabled := false;
  btnAlterar.Enabled := false;
  btnApagar.Enabled := false;
  btnSalvar.Enabled := true;
  vTipoEvento := 'I';
end;

procedure TfrmClientes.btnSalvarClick(Sender: TObject);
begin
  if vTipoEvento <> '-' then
    if InsereUpdateCliente(vTipoEvento) then
      ShowMessage('Realizado com sucesso!');

  edtCliente.ReadOnly := true;
  edtRazaoSocial.ReadOnly := true;
  edtCNPJ.ReadOnly := true;
  edtCPF.ReadOnly := true;
  edtDTNasc.Enabled := false;

  btnNovo.Enabled := true;
  btnAlterar.Enabled := true;
  btnApagar.Enabled := true;
  btnSalvar.Enabled := false;
  pnlContato.Show;

  vTipoEvento := '-';
end;

procedure TfrmClientes.cadContatoClick(Sender: TObject);
begin
  if not Assigned(frmContatos) then
    frmContatos := TfrmContatos.Create(Application);
  try
    frmContatos.ShowModal;
  finally
    FreeAndNil(frmContatos);
  end;

  dmDados.qryContato.Close;
  dmDados.qryContato.Open;
end;

procedure TfrmClientes.chkDtNascClick(Sender: TObject);
begin
  dtpDatanasc.Enabled := chkDtNasc.Checked;
end;

procedure TfrmClientes.FormCreate(Sender: TObject);
begin
  vTipoEvento := '-';
  pcCliente.ActivePage := tsCons;
  btnSalvar.Enabled := false;
end;

function TfrmClientes.InsereUpdateCliente(AEvento: Char): Boolean;
var
  vCliente: TCliente;
begin
  vCliente := TCliente.Create;
  try
    vCliente.IDCliente := StrToIntDef(edtID.Text, 0);
    vCliente.Cliente := edtCliente.Text;
    vCliente.RazaoSocial := edtRazaoSocial.Text;
    vCliente.CNPJ := SoNumeros(edtCNPJ.Text);
    vCliente.CPF := SoNumeros(edtCPF.Text);
    vCliente.DTNasc := edtDTNasc.Date;

    if AEvento = 'I' then
      Result := vCliente.InsereCliente;

    if AEvento = 'A' then
      Result := vCliente.AlteraCliente;
  finally
    FreeAndNil(vCliente);
  end;
end;

function TfrmClientes.SoNumeros(const ATexto: string): string;
var
  i: Integer;
begin
  Result := '';
  for i := 1 to length(ATexto) do
  begin
    if ATexto[i] in ['0' .. '9'] then
      Result := Result + ATexto[i];
  end;
end;

end.
