unit udmCadastroSistema;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.Client, FireDAC.Comp.DataSet;

type
  TdmCadastroSistema = class(TDataModule)
    qCadastrarSistema: TFDQuery;
    qVerificaSistema: TFDQuery;
    qVerificaSistemaNOME: TStringField;
    upCadastrarSistema: TFDUpdateSQL;
    dsVerificaSistema: TDataSource;
    dsCadastrarSistema: TDataSource;
    dsWork: TDataSource;
    FDQuery1: TFDQuery;
    FDQuery1SEQUENCIA: TIntegerField;
    FDQuery1NOME: TStringField;
    FDQuery1VERSAO: TWideStringField;
    qGen1: TFDQuery;
    qGen1GEN_ID: TLargeintField;
    qWork: TFDQuery;
    qWorkSEQUENCIA: TIntegerField;
    qWorkNOME: TStringField;
    qWorkVERSAO: TWideStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmCadastroSistema: TdmCadastroSistema;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
