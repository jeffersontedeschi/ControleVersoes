unit untConsultaDependencias;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB, Vcl.Grids,
  Vcl.DBGrids, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls,
  Vcl.DBCtrls, Vcl.ExtCtrls, RLReport, Vcl.Imaging.pngimage, RLFilters,
  RLPDFFilter;

type
  TfrmConsultaDependencias = class(TForm)
    dbgInicioConsulta: TDBGrid;
    cboSistema: TDBLookupComboBox;
    cboVersao: TDBLookupComboBox;
    Panel1: TPanel;
    Panel2: TPanel;
    lblSistema: TLabel;
    lblVersao: TLabel;
    Button1: TButton;
    RLReport1: TRLReport;
    RLBand1: TRLBand;
    RLBand2: TRLBand;
    rldbtxtSISTEMA: TRLDBText;
    RLDBText2: TRLDBText;
    RLDBText3: TRLDBText;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    lblSistemaSelecionado: TRLLabel;
    lblGrupoSistema: TRLLabel;
    RLBand3: TRLBand;
    RLLabel1: TRLLabel;
    RLLabel2: TRLLabel;
    RLLabel3: TRLLabel;
    RLImage1: TRLImage;
    DataImpressao: TRLLabel;
    lblData: TRLLabel;
    RLPDFFilter1: TRLPDFFilter;
    rlGrupoSistema: TRLLabel;
    RLDBText1: TRLDBText;
    lblGrupo: TLabel;
    Label1: TLabel;
    RLLabel6: TRLLabel;
    lblVersaoSelecionada: TRLLabel;
    cboGrupo: TDBLookupComboBox;
    Label2: TLabel;
    procedure FormShow(Sender: TObject);
    procedure cboVersaoChange(Sender: TObject);
    procedure cboSistemaClick(Sender: TObject);
    procedure cboVersaoClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cboGrupoClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    vCombo, vGrupo : integer;
  end;

var
  frmConsultaDependencias: TfrmConsultaDependencias;

implementation

{$R *.dfm}

uses untControleSistemasDependencias, untModuloDados,
  untTelaInicialDependencias, udmConsultaDependencias;

procedure TfrmConsultaDependencias.cboVersaoChange(Sender: TObject);
begin
  dmConsultaDependencias.qConsulta.Close;
  dmConsultaDependencias.qConsulta.ParamByName('SISTEMA_BUSCAR').AsInteger := vCombo;
  dmConsultaDependencias.qConsulta.ParamByName('VERSAO_BUSCAR').AsString := frmInicioControleDependencias.vVersao;
  dmConsultaDependencias.qConsulta.open;
end;

procedure TfrmConsultaDependencias.cboVersaoClick(Sender: TObject);
begin

  vCombo := cboSistema.KeyValue;

  dmConsultaDependencias.qConsulta.Close;
  dmConsultaDependencias.qConsulta.ParamByName('SISTEMA_BUSCAR').AsInteger := vCombo;
  dmConsultaDependencias.qConsulta.ParamByName('VERSAO_BUSCAR').AsString := cboVersao.Text;
  dmConsultaDependencias.qConsulta.open;

  dmConsultaDependencias.qVersao.Close;
  dmConsultaDependencias.qVersao.sql.Clear;
  dmConsultaDependencias.qVersao.sql.Add('select distinct dependencias.versao_sistema from dependencias where'+
                  ' dependencias.id_sistema = :id_sistema');
  dmConsultaDependencias.qVersao.ParamByName('ID_SISTEMA').AsInteger := vCombo;
  dmConsultaDependencias.qVersao.open;

end;

procedure TfrmConsultaDependencias.Button1Click(Sender: TObject);
begin
   // Preview de Impressão em PDF

   if trim(cboSistema.text) = '' then
    lblSistemaSelecionado.Caption := 'NOME DE SISTEMA NÃO CADASTRADO'
   else
    lblSistemaSelecionado.Caption := cboSistema.text;

   if trim(cboVersao.text) = '' then
    lblVersaoSelecionada.Caption := 'VERSÃO NÃO CADASTRADA'
   else
    lblVersaoSelecionada.Caption := cboVersao.text;

   if trim(cboGrupo.text) = '' then
    lblGrupoSistema.caption := 'GRUPO NÃO CADASTRADO'
   else
   lblGrupoSistema.caption := cboGrupo.text;

   lblData.Caption := DateTimeToStr(now);
   RLReport1.Preview();

end;

procedure TfrmConsultaDependencias.cboGrupoClick(Sender: TObject);
begin

  dmConsultaDependencias.qConsulta.Close;
  dmConsultaDependencias.qConsulta.ParamByName('SISTEMA_BUSCAR').AsInteger := vCombo;
  dmConsultaDependencias.qConsulta.ParamByName('GRUPO').asString := cboGrupo.Text;
  dmConsultaDependencias.qConsulta.open;

end;

procedure TfrmConsultaDependencias.cboSistemaClick(Sender: TObject);
begin

 var vVersao : String;

  // mudança do dbgrid(Sistema) ao mudar o sistema selecionado
  vCombo := cboSistema.KeyValue;


  dmConsultaDependencias.qGrupo.SQL.Clear;
  dmConsultaDependencias.qGrupo.sql.add('select * from SISTEMAS_GRUPO ' +
                                        ' inner join SISTEMA_VINC on SISTEMAS_GRUPO.SEQUENCIA = SISTEMA_VINC.SEQGRUPO' +
                                        ' inner join SISTEMAS on SISTEMA_VINC.SEQSISTEMA = SISTEMAS.SEQUENCIA' +
                                        ' where SISTEMAS.SEQUENCIA = :SISTEMA ');
  dmConsultaDependencias.qGrupo.ParamByName('SISTEMA').asString := IntToStr(vCombo);
  dmConsultaDependencias.qGrupo.open;


  dmConsultaDependencias.qGR.close;
  dmConsultaDependencias.qGR.ParamByName('SISTEMA').AsInteger := vCombo;
  dmConsultaDependencias.qGR.open;
  lblGrupo.caption := dmConsultaDependencias.qGRNOME.Text;


  dmConsultaDependencias.qConsulta.Close;
  dmConsultaDependencias.qConsulta.ParamByName('SISTEMA_BUSCAR').AsInteger := vCombo;
  dmConsultaDependencias.qConsulta.ParamByName('GRUPO').asString := lblGrupo.caption;
  dmConsultaDependencias.qConsulta.open;


  dmConsultaDependencias.qVersao.Close;
  dmConsultaDependencias.qVersao.sql.Clear;
  dmConsultaDependencias.qVersao.sql.Add('select distinct dependencias.versao_sistema, dependencias.id_sistema from dependencias where'
                 +' dependencias.id_sistema = :SISTEMA order by 1 desc');
  dmConsultaDependencias.qVersao.ParamByName('SISTEMA').AsInteger := vCombo;
  dmConsultaDependencias.qVersao.open;
  dmConsultaDependencias.qVersaoVERSAO_SISTEMA.AsString;

 if trim(dmConsultaDependencias.qVersaoVERSAO_SISTEMA.AsString) = '' then
  begin
   ShowMessage('NÃO HÁ VERSÃO CADASTRADA, SELECIONE OUTRO SISTEMA!');
   cboVersao.Enabled := false;
   exit;
  end;

  cboGrupo.KeyValue := dmConsultaDependencias.qGrupoSEQUENCIA.AsInteger;
  cboGrupoClick(Sender);
  cboVersao.Enabled := true;
  cboVersao.KeyValue :=  dmConsultaDependencias.qVersaoVERSAO_SISTEMA.AsString;
  cboVersaoClick(Self);

end;

procedure TfrmConsultaDependencias.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FreeAndNil(dmConsultaDependencias);
end;

procedure TfrmConsultaDependencias.FormCreate(Sender: TObject);
begin
  if not(Assigned(dmConsultaDependencias)) then
      Application.CreateForm(TdmConsultaDependencias, dmConsultaDependencias);
end;

procedure TfrmConsultaDependencias.FormShow(Sender: TObject);
begin

 // abre consulta para montar o combobox
  dmConsultaDependencias.qSistema.close;
  dmConsultaDependencias.qSistema.open;

  dmConsultaDependencias.qGr.close;
  dmConsultaDependencias.qGr.ParamByName('SISTEMA').asInteger := frmInicioControleDependencias.vSistema;
  dmConsultaDependencias.qGr.open;

  dmConsultaDependencias.qGrupo.close;
  dmConsultaDependencias.qGrupo.open;


 //traz o valor do ID clicado da tela anterior para os combobox
  cboSistema.KeyValue := frmInicioControleDependencias.vSistema;
  cboVersao.KeyValue  := frmInicioControleDependencias.vVersao;
  lblGrupo.Caption    := dmConsultaDependencias.qGrNOME.text; // REMOVER AO FINALIZAR O CÓDIGO
  cboGrupo.KeyValue   := IntToStr(frmInicioControleDependencias.vGrupo);

  // Monta no combobox de grupo apenas os grupos que o sistema pertence
  dmConsultaDependencias.qGrupo.SQL.Clear;
  dmConsultaDependencias.qGrupo.sql.add('select * from SISTEMAS_GRUPO ' +
                                        ' inner join SISTEMA_VINC on SISTEMAS_GRUPO.SEQUENCIA = SISTEMA_VINC.SEQGRUPO' +
                                        ' inner join SISTEMAS on SISTEMA_VINC.SEQSISTEMA = SISTEMAS.SEQUENCIA' +
                                        ' where SISTEMAS.SEQUENCIA = :SISTEMA ');
  dmConsultaDependencias.qGrupo.ParamByName('SISTEMA').asString := IntToStr(frmInicioControleDependencias.vSistema);
  dmConsultaDependencias.qGrupo.open;

  // Monta as versões no combobox de Versão
  dmConsultaDependencias.qVersao.SQL.Clear;
  dmConsultaDependencias.qVersao.sql.add('select distinct dependencias.versao_sistema, dependencias.id_sistema'+
                  ' from dependencias where dependencias.id_sistema = :SISTEMA');
  dmConsultaDependencias.qVersao.ParamByName('SISTEMA').AsInteger := cboSistema.KeyValue;
  dmConsultaDependencias.qVersao.Prepare;
  dmConsultaDependencias.qVersao.open;

  if dmConsultaDependencias.qVersaoVERSAO_SISTEMA.AsString = '' then
    begin
     ShowMessage('NÃO HÁ VERSÃO CADASTRADA, SELECIONE OUTRO SISTEMA!');
     cboVersao.Enabled := false;
     exit;
    end
  else
    cboVersao.Enabled := true;

  dmConsultaDependencias.qConsulta.close;
  dmConsultaDependencias.qConsulta.ParamByName('SISTEMA_BUSCAR').AsInteger := frmInicioControleDependencias.vSistema;
  dmConsultaDependencias.qConsulta.ParamByName('VERSAO_BUSCAR').AsString := frmInicioControleDependencias.vVersao;
  dmConsultaDependencias.qConsulta.ParamByName('GRUPO').asString := lblGrupo.caption;
  dmConsultaDependencias.qConsulta.open;

end;

end.
