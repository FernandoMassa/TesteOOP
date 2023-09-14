unit uDMDados;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs, FireDAC.Phys.SQLiteWrapper.Stat, FireDAC.VCLUI.Wait, Data.DB,
  FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet, Dialogs;

type
  TdmDados = class(TDataModule)
    conDB: TFDConnection;
    tranDB: TFDTransaction;
    qryCliente: TFDQuery;
    qryContato: TFDQuery;
    dtsCliente: TDataSource;
    dtsContato: TDataSource;
    qryAux: TFDQuery;
    procedure qryClienteAfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    function ConectaBanco: string;
  end;

var
  dmDados: TdmDados;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses AuxUnit;

{$R *.dfm}

function TdmDados.ConectaBanco: string;
var
  vAux: TAux;
begin
  Result := '';
  vAux := TAux.Create;

  try
    conDB.ConnectionName := 'BDCANDIDATO';
    conDB.Params.Database := vAux.CaminhoDef + vAux.NomeBancoDef;

    try
      conDB.Connected := true;
      Result := 'Banco conectado';
    except
      try
        conDB.ConnectionName := vAux.NomeBanco;
        conDB.Params.Database := vAux.CaminhoBD + vAux.NomeBanco;
        conDB.Connected := true;
        Result := 'Banco conectado';
      except
        on E: Exception do
        begin
          ShowMessage('Não foi possivel conectar no banco de dados! ' + #13 + E.Message);
          Result := 'Erro ao conectar no banco de dados';
        end;
      end;
    end;

  finally

    FreeAndNil(vAux);
  end;

end;

procedure TdmDados.qryClienteAfterScroll(DataSet: TDataSet);
begin
  qryContato.Close;
  qryContato.SQL.Clear;
  if not qryCliente.IsEmpty then
    qryContato.Open('Select * from TBCONTATOS where IDCLIENTE = ' + qryCliente.FieldByName('IDCLIENTE').AsString);
end;

initialization

end.
