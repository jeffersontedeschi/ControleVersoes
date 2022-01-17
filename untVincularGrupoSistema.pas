unit untVincularGrupoSistema;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.DBCtrls, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.Grids, Vcl.DBGrids, Vcl.Mask, Vcl.ExtCtrls;

type
  TfrmVincularGrupoSistema = class(TForm)
    dsComboBox: TDataSource;
    qComboBox: TFDQuery;
    grdGrupos: TDBGrid;
    dsGrid: TDataSource;
    qMontaGrid: TFDQuery;
    Salvar: TButton;
    qMontaGridDESCRICAO: TStringField;
    qMontaGridATIVO: TStringField;
    qWork: TFDQuery;
    qComboBoxSEQUENCIA: TIntegerField;
    qComboBoxNOME: TStringField;
    qMontaGridSEQUENCIA: TIntegerField;
    lblNomeSistema: TLabel;
    Panel1: TPanel;
    pnlBottom: TPanel;
    pnlTop: TPanel;
    procedure FormShow(Sender: TObject);
    procedure grdGruposDblClick(Sender: TObject);
    procedure SalvarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmVincularGrupoSistema: TfrmVincularGrupoSistema;

implementation

uses
  udmTelaInicial, udmConsultaDependencias, untTelaInicialDependencias, untModuloDados;

{$R *.dfm}

procedure TfrmVincularGrupoSistema.grdGruposDblClick(Sender: TObject);
begin
    dsGrid.Edit;
     if qMontaGridATIVO.Text = 'S' then
         qMontaGridATIVO.Text := 'N'
      else
         qMontaGridATIVO.Text := 'S'
end;

procedure TfrmVincularGrupoSistema.SalvarClick(Sender: TObject);
begin

  qwork.close;
  qwork.sql.clear;
  qwork.sql.Add('delete from SISTEMA_VINC where SISTEMA_VINC.SEQSISTEMA = :SISTEMA');
  qWork.ParamByName('SISTEMA').AsInteger := frmInicioControleDependencias.vsistema;
  qWork.Prepare;
  qWork.ExecSQL;


  qMontagrid.First;
  While not qMontaGrid.Eof do
    begin
     if (Trim(qMontaGridATIVO.AsString) = 'S') then
      begin
       qwork.close;
       qwork.sql.clear;
       qwork.sql.add(' insert into SISTEMA_VINC (SISTEMA_VINC.SEQSISTEMA, SISTEMA_VINC.SEQGRUPO, SISTEMA_VINC.ATIVO)' +
                    ' values (:SEQSISTEMA, :SEQGRUPO, :ATIVO)   ');

       qWork.ParamByName('SEQSISTEMA').AsInteger := frmInicioControleDependencias.vsistema;
       qWork.ParamByName('SEQGRUPO').AsString := qMontaGridSEQUENCIA.AsString;
       qWork.ParamByName('ATIVO').AsString := qMontaGridATIVO.AsSTRING;
       qWork.Prepare;
       qWork.ExecSQL;
      end;
       qMontaGrid.next;
    end;
   ShowMessage('Alterações Realizadas com Sucesso!');

   close;
   end;


procedure TfrmVincularGrupoSistema.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dmTelaInicial.qInicial.close;
  dmTelaInicial.qInicial.open;
end;

procedure TfrmVincularGrupoSistema.FormShow(Sender: TObject);
var x : integer;
begin
  lblNomeSistema.Caption := frmInicioControleDependencias.vNomeSistema;
  x := frmInicioControleDependencias.vsistema ;

   qComboBox.close;
   qComboBox.open;

   qMontaGrid.Close;
   qMontaGrid.sql.Clear;

   qmontagrid.SQL.add('select SISTEMAS_GRUPO.SEQUENCIA, SISTEMAS_GRUPO.DESCRICAO, coalesce((select V.ATIVO '+
                      ' from SISTEMA_VINC V '+
                      ' where V.SEQSISTEMA = '+ IntToStr(frmInicioControleDependencias.vsistema) + 'and '+
                      ' V.SEQGRUPO = SISTEMAS_GRUPO.SEQUENCIA), ''N'') as ATIVO '+
                      ' from SISTEMAS_GRUPO');
   qmontagrid.Open;
end;

end.
