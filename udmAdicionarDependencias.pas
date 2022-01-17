unit udmAdicionarDependencias;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.Stan.StorageBin;

type
  TdmAdicionarDependencias = class(TDataModule)
    trAdicionarDependencia: TFDTransaction;
    qGen: TFDQuery;
    qGenGEN_ID: TLargeintField;
    qBusca: TFDQuery;
    qBuscaSEQUENCIA: TIntegerField;
    qBuscaNOME: TStringField;
    qBuscaVERSAO: TWideStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmAdicionarDependencias: TdmAdicionarDependencias;

implementation

uses
  untControleSistemasDependencias;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
