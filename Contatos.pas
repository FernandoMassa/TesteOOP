unit Contatos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Vcl.DBCtrls, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Mask;

type
  TfrmContatos = class(TForm)
    pcContatos: TPageControl;
    tsBusca: TTabSheet;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    qryClientes: TFDQuery;
    qryContatos: TFDQuery;
    edtNomeContLoc: TEdit;
    Label4: TLabel;
    lcbCliente: TDBLookupComboBox;
    qryClientesIDCLIENTE: TFDAutoIncField;
    qryClientesCLIENTE: TStringField;
    qryClientesRAZAOSOCIAL: TStringField;
    qryClientesCNPJ: TStringField;
    qryClientesCPF: TStringField;
    qryClientesDTNASCIMENTO: TDateTimeField;
    rgOpcoes: TRadioGroup;
    dtsClientes: TDataSource;
    tblCli: TFDMemTable;
    tblCliID: TIntegerField;
    dtsCli: TDataSource;
    btnBusca: TButton;
    dtsContatos: TDataSource;
    tsCadastro: TTabSheet;
    Panel2: TPanel;
    btnNovo: TButton;
    btnApagar: TButton;
    btnAlterar: TButton;
    btnSalvar: TButton;
    Label7: TLabel;
    lcbCliente2: TDBLookupComboBox;
    rgOpcoes2: TRadioGroup;
    DBEdit1: TDBEdit;
    Nome: TLabel;
    DBEdit2: TDBEdit;
    procedure rgOpcoesClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure pcContatosChange(Sender: TObject);
    procedure btnBuscaClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnApagarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmContatos: TfrmContatos;

implementation

{$R *.dfm}

uses uDMDados;

procedure TfrmContatos.btnAlterarClick(Sender: TObject);
begin
  if qryContatos.Active then
     if qryContatos.RecordCount > 0 then
        qryContatos.Edit;
end;

procedure TfrmContatos.btnApagarClick(Sender: TObject);
begin
  if qryContatos.Active then
     if qryContatos.RecordCount > 0 then
        if MessageDlg('Deseja apagar esse contato?', mtConfirmation, [mbYes, mbNo], 0, mbYes) = mrYes then
        begin
          qryContatos.Delete;
        end;
end;

procedure TfrmContatos.btnBuscaClick(Sender: TObject);
begin
  qryContatos.Close;
  qryContatos.SQL.Clear;
  qryContatos.SQL.Add('Select                                                  ');
  qryContatos.SQL.Add('  c.idContatos,                                         ');
  qryContatos.SQL.Add('  c.idcliente,                                          ');
  qryContatos.SQL.Add('  c.nome,                                               ');
  qryContatos.SQL.Add('  cl.cliente,                                           ');
  qryContatos.SQL.Add('  cl.RAZAOSOCIAL                                        ');
  qryContatos.SQL.Add('from TBCONTATOS c                                       ');
  qryContatos.SQL.Add('inner join tbcliente cl on (cl.idcliente = c.idcliente) ');
  qryContatos.SQL.Add('where 0=0');
  if trim(lcbCliente.Text) <> '' then
  begin
    qryContatos.SQL.Add('and c.idcliente = ' + tblCliID.AsString);
  end;

  if trim(edtNomeContLoc.Text) <> '' then
  begin
    qryContatos.SQL.Add('and UPPER(c.nome) like UPPER(%' + QuotedStr(edtNomeContLoc.Text) + '%)');
  end;
  qryContatos.Open;
end;

procedure TfrmContatos.btnNovoClick(Sender: TObject);
begin
  if not qryContatos.Active then
     qryContatos.Open;

  qryContatos.Append;
  btnNovo.Enabled := false;
  btnApagar.Enabled := false;
  btnAlterar.Enabled := false;
  btnSalvar.Enabled := true;
end;

procedure TfrmContatos.btnSalvarClick(Sender: TObject);
begin
  btnNovo.Enabled := true;
  btnApagar.Enabled := true;
  btnAlterar.Enabled := true;
  btnSalvar.Enabled := false;

  if trim(lcbCliente2.Text) = '' then
  begin
    ShowMessage('Seleciona um cliente. Operação cancelada.');
    qryContatos.Cancel;
    abort;
  end;

  if qryContatos.State in [dsEdit,dsInsert] then
  begin
     qryContatos.FieldByName('IDCLIENTE').AsInteger := tblCliID.AsInteger;
     qryContatos.Post;
  end;

end;

procedure TfrmContatos.FormCreate(Sender: TObject);
begin
  tblCli.Open;
  pcContatos.ActivePage := tsBusca;
  qryClientes.Open();
end;

procedure TfrmContatos.pcContatosChange(Sender: TObject);
begin
  if pcContatos.ActivePage = tsCadastro then
    rgOpcoesClick(rgOpcoes2)
  else
    rgOpcoesClick(rgOpcoes);
end;

procedure TfrmContatos.rgOpcoesClick(Sender: TObject);
begin

  case (Sender as TRadioGroup).ItemIndex of
    0:
      lcbCliente.ListField := 'CLIENTE;CPF;RAZAOSOCIAL;CNPJ';
    1:
      lcbCliente.ListField := 'CNPJ;RAZAOSOCIAL;CLIENTE;CPF';
    2:
      lcbCliente.ListField := 'CPF;CLIENTE;RAZAOSOCIAL;CNPJ';
    3:
      lcbCliente.ListField := 'RAZAOSOCIAL;CNPJ;CLIENTE;CPF';
  end;

  lcbCliente2.ListField := lcbCliente.ListField;
end;

end.
