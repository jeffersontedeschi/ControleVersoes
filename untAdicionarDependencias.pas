unit untAdicionarDependencias;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.Buttons, Vcl.StdCtrls;

type
  TfrmAddDependencia = class(TForm)
    dbgridAdicionarDependencias: TDBGrid;
    qOrigem: TFDQuery;
    upAdicionar: TFDUpdateSQL;
    dsAdicionar: TDataSource;
    SpeedButton1: TSpeedButton;
    qOrigemNOME: TStringField;
    trAdicionar: TFDTransaction;
    qOrigemID: TIntegerField;
    qOrigemVERSAO_SISTEMA: TWideStringField;
    qOrigemID_DEPENDENCIA: TIntegerField;
    qOrigemID_SISTEMA: TIntegerField;
    qWork: TFDQuery;
    procedure FormShow(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);


  private
    { Private declarations }
  public
    { Public declarations }
      s : string;
  end;

var
  frmAddDependencia: TfrmAddDependencia;

implementation

{$R *.dfm}

uses untControleSistemasDependencias, untModuloDados;


procedure TfrmAddDependencia.FormShow(Sender: TObject);
begin
  qOrigem.close;
  qOrigem.open;
  qOrigem.edit;
end;


procedure TfrmAddDependencia.SpeedButton1Click(Sender: TObject);

begin
  trAdicionar.StartTransaction;

     s := dbgridAdicionarDependencias.columns.items[4].field.text;
     qWork.close;

     qWork.sql.Clear;
     qWork.SQL.add('INSERT INTO dependencias (versao_sistema) VALUES  (:s)');
     qWork.ParamByName('s').AsString := s;
     qWork.Prepare;
     qWork.ExecSQL;

    trAdicionar.Commit;


end;
end.
