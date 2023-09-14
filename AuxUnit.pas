unit AuxUnit;

interface

uses
  SysUtils, Forms, IniFiles;

type
  TAux = class
  private
    FCaminhoBD: string;
    FNomeBanco: string;
    FRetorno: string;
    FNomeBancoDef: string;
    FCaminhoDef: string;
    procedure SetCaminhoBD(const Value: string);
    procedure SetNomeBanco(const Value: string);
    procedure SetRetorno(const Value: string);
    procedure SetCaminhoDef(const Value: string);
    procedure SetNomeBancoDef(const Value: string);
  public
    constructor Create;
    property CaminhoDef: string read FCaminhoDef write SetCaminhoDef;
    property NomeBancoDef: string read FNomeBancoDef write SetNomeBancoDef;
    property CaminhoBD: string read FCaminhoBD write SetCaminhoBD;
    property NomeBanco: string read FNomeBanco write SetNomeBanco;
    property Retorno: string read FRetorno write SetRetorno;
  end;

implementation

constructor TAux.Create;
var
  vIniFile: TIniFile;
begin
  inherited;

  Retorno := 'Banco Conectado';
  CaminhoDef := ExtractFilePath(Application.ExeName);
  NomeBancoDef := 'BDCANDIDATO.SQLite3';

  if FileExists(CaminhoDef + 'Config.ini') then
    vIniFile := TIniFile.Create(CaminhoDef + 'Config.ini')
  else
  begin
    Retorno := 'Não foi possivel encontrar o arquivo de configuração';
    exit;
  end;

  if Assigned(vIniFile) then
  begin
    try
      CaminhoBD := vIniFile.ReadString('Config', 'CaminhoBD', CaminhoDef);
      NomeBanco := vIniFile.ReadString('Config', 'NomeBanco', 'BDCANDIDATO.SQLite3');
    finally
      vIniFile.Free;
    end;
  end;
end;

procedure TAux.SetCaminhoBD(const Value: string);
begin
  FCaminhoBD := Value;
end;

procedure TAux.SetCaminhoDef(const Value: string);
begin
  FCaminhoDef := Value;
end;

procedure TAux.SetNomeBanco(const Value: string);
begin
  FNomeBanco := Value;
end;

procedure TAux.SetNomeBancoDef(const Value: string);
begin
  FNomeBancoDef := Value;
end;

procedure TAux.SetRetorno(const Value: string);
begin
  FRetorno := Value;
end;

end.
