unit udmTelaInicial;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TdmTelaInicial = class(TDataModule)
    qInicial: TFDQuery;
    qInicialSEQUENCIA: TIntegerField;
    qInicialNOME: TStringField;
    qInicialVERSAO: TWideStringField;
    qInicialVERSAOTEMP: TStringField;
    trInicial: TFDTransaction;
    qGrupos: TFDQuery;
    qGruposSEQUENCIA: TIntegerField;
    qGruposDESCRICAO: TStringField;
    qWork: TFDQuery;
    qWorkSEQUENCIA: TIntegerField;
    qWorkNOME: TStringField;
    qWorkVERSAO: TWideStringField;
    qWorkGRUPO: TIntegerField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmTelaInicial: TdmTelaInicial;

implementation

uses
  untModuloDados;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
