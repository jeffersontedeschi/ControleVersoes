unit udmConsultaDependencias;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TdmConsultaDependencias = class(TDataModule)
    qSistema: TFDQuery;
    qSistemaSEQUENCIA: TIntegerField;
    qSistemaNOME: TStringField;
    dsSistema: TDataSource;
    dsVersao: TDataSource;
    qVersao: TFDQuery;
    qVersaoVERSAO_SISTEMA: TWideStringField;
    dsConsulta: TDataSource;
    qConsulta: TFDQuery;
    qConsultaSISTEMA: TStringField;
    qConsultaMINIMA: TWideStringField;
    qConsultaMAXIMA: TWideStringField;
    dsGrupo: TDataSource;
    qGrupo: TFDQuery;
    qGrupoDESCRICAO: TStringField;
    qGrupoSEQUENCIA: TIntegerField;
    qConsultaGRUPO: TStringField;
    qGr: TFDQuery;
    qGrNOME: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmConsultaDependencias: TdmConsultaDependencias;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
