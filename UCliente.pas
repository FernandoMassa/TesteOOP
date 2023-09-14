unit UCliente;

interface

uses
  SysUtils, IniFiles, Controls, Dialogs;

type
  TCliente = class
  private
    FCNPJ: string;
    FCPF: string;
    FIDCliente: Integer;
    FRazaoSocial: string;
    FDTNasc: TDate;
    FCliente: string;
    procedure SetCNPJ(const Value: string);
    procedure SetCPF(const Value: string);
    procedure SetDTNasc(const Value: TDate);
    procedure SetID(const Value: Integer);
    procedure SetCliente(const Value: string);
    procedure SetRazaoSocial(const Value: string);

  public
    property IDCliente: Integer read FIDCliente write SetID;
    property Cliente: string read FCliente write SetCliente;
    property RazaoSocial: string read FRazaoSocial write SetRazaoSocial;
    property CNPJ: string read FCNPJ write SetCNPJ;
    property CPF: string read FCPF write SetCPF;
    property DTNasc: TDate read FDTNasc write SetDTNasc;

    function InsereCliente: Boolean;
    function AlteraCliente: Boolean;
    function DeletaCliente: Boolean;

    class function BuscaCliente(const ADado, ATipo: string; ADtNasc: TDate): Boolean;
  end;

implementation

{ TCliente }

uses uDMDados;

function TCliente.AlteraCliente: Boolean;
begin
  Result := true;
  dmDados.qryAux.Close;
  dmDados.qryAux.SQL.Clear;
  dmDados.qryAux.SQL.Add('update tbcliente');
  dmDados.qryAux.SQL.Add('set CLIENTE = ' + QuotedStr(FCliente));
  dmDados.qryAux.SQL.Add(', RAZAOSOCIAL = ' + QuotedStr(FRazaoSocial));
  dmDados.qryAux.SQL.Add(', CNPJ = ' + QuotedStr(FCNPJ));
  dmDados.qryAux.SQL.Add(', CPF = ' + QuotedStr(FCPF));
  dmDados.qryAux.SQL.Add(', DTNASCIMENTO = ' + QuotedStr(DateToStr(FDTNasc)));
  dmDados.qryAux.SQL.Add('where IDCLIENTE = ' + IntToStr(FIDCliente));
  try
    dmDados.qryAux.ExecSQL;
    dmDados.conDB.Commit;
  except
    on E: Exception do
    begin
      ShowMessage('Erro ao alterar o registro!' + #13 + E.Message);
      Result := false;
    end;
  end;

end;

function TCliente.DeletaCliente: Boolean;
begin
  Result := true;
  if MessageDlg('Certeza de que quer apagar este cliente?', mtConfirmation, [mbYes, mbNo], 0, mbYes) = mrYes then
  begin
    Result := true;
    dmDados.qryAux.Close;
    dmDados.qryAux.SQL.Clear;
    dmDados.qryAux.SQL.Add('delete from TBCLIENTE where  IDCLIENTE = ' + FIDCliente.ToString);
    try
      dmDados.qryAux.ExecSQL;
      dmDados.conDB.Commit;
    except
      on E: Exception do
      begin
        ShowMessage('Erro ao tentar apagar um regisrto!' + #13 + E.Message);
        Result := false;
      end;
    end;
  end
  else
    ShowMessage('Nada foi apagado, operação cancelada.');
end;

class function TCliente.BuscaCliente(const ADado, ATipo: string; ADtNasc: TDate): Boolean;
begin
  Result := true;
  dmDados.qryCliente.Close;
  dmDados.qryCliente.SQL.Clear;
  dmDados.qryCliente.SQL.Add('select * from TBCLIENTE');
  dmDados.qryCliente.SQL.Add('Where 0=0');
  if trim(ADado) <> '' then
    dmDados.qryCliente.SQL.Add('AND UPPER(' + ATipo + ') = like upper(' + QuotedStr('%' + ADado + '%') + ')');

  if ADtNasc > 0 then
    dmDados.qryCliente.SQL.Add('AND DTNASCIMENTO = ' + QuotedStr(DateToStr(ADtNasc)));

  try
    dmDados.qryCliente.Open;
    if dmDados.qryCliente.IsEmpty then
      ShowMessage('Sem resultados no banco de dados!');
  except
    on E: Exception do
    begin
      ShowMessage('Ocorreu um erro na consulta!' + #13 + E.Message);
      Result := false;
    end;
  end;

end;

function TCliente.InsereCliente: Boolean;
begin
  Result := true;
  dmDados.qryAux.Close;
  dmDados.qryAux.SQL.Clear;
  dmDados.qryAux.SQL.Add('INSERT INTO TBCLIENTE (CLIENTE,RAZAOSOCIAL,CNPJ,CPF,DTNASCIMENTO)');
  dmDados.qryAux.SQL.Add('values(' + QuotedStr(FCliente) + ',');
  dmDados.qryAux.SQL.Add(QuotedStr(FRazaoSocial) + ',');
  dmDados.qryAux.SQL.Add(QuotedStr(FCNPJ) + ',');
  dmDados.qryAux.SQL.Add(QuotedStr(FCPF) + ',');
  dmDados.qryAux.SQL.Add(QuotedStr(DateToStr(FDTNasc)) + ')');
  try
    dmDados.qryAux.ExecSQL;
    dmDados.conDB.Commit;
  except
    on E: Exception do
    begin
      ShowMessage('Erro ao cadastrar o registro!' + #13 + E.Message);
      Result := false;
    end;
  end;
end;

procedure TCliente.SetCNPJ(const Value: string);
begin
  FCNPJ := Value;
end;

procedure TCliente.SetCPF(const Value: string);
begin
  FCPF := Value;
end;

procedure TCliente.SetDTNasc(const Value: TDate);
begin
  FDTNasc := Value;
end;

procedure TCliente.SetID(const Value: Integer);
begin
  FIDCliente := Value;
end;

procedure TCliente.SetCliente(const Value: string);
begin
  FCliente := Value;
end;

procedure TCliente.SetRazaoSocial(const Value: string);
begin
  FRazaoSocial := Value;
end;

end.
