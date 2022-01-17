unit untTelaInicialDependencias;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.Buttons, Vcl.ExtCtrls, Vcl.Menus, Vcl.StdCtrls, Vcl.DBCtrls;

type
  TfrmInicioControleDependencias = class(TForm)
    Panel1: TPanel;
    dbgInicioConsulta: TDBGrid;
    Panel2: TPanel;
    SpeedButton2: TSpeedButton;
    SpeedButton1: TSpeedButton;
    dsInicial: TDataSource;
    popUpGrupos: TPopupMenu;
    AdicionarGrupo1: TMenuItem;
    SpeedButton3: TSpeedButton;
    dsPesquisarGrupo: TDataSource;
    dbGrupo: TDBLookupComboBox;
    Label1: TLabel;
    Label2: TLabel;
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton2Click(Sender: TObject);
    procedure File1Click(Sender: TObject);
    procedure AdicionarGrupo1Click(Sender: TObject);
    procedure dbGrupoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);

  private

    { Private declarations }
  public
    { Public declarations }
    vSistema, vGrupo: Integer;
    vVersao, vNomeSistema : string;
    var validaUsuario : boolean;
  end;

var
  frmInicioControleDependencias: TfrmInicioControleDependencias;

implementation

{$R *.dfm}

uses untControleSistemasDependencias, untModuloDados, untConsultaDependencias,
  untCadastroSistema, udmTelaInicial, udmConsultaDependencias,
  untVincularGrupoSistema, untValidacaoUsuario;

procedure TfrmInicioControleDependencias.AdicionarGrupo1Click(Sender: TObject);
begin

  validaUsuario := false;
  Application.CreateForm(TfrmValidacaoUsuario, frmValidacaoUsuario);
  frmValidacaoUsuario.ShowModal();

 if validaUsuario then
   begin
   vsistema := dmTelaInicial.qInicialSEQUENCIA.AsInteger;
   vNomeSistema := dmTelaInicial.qInicialNOME.asString;
   Application.CreateForm(TfrmVincularGrupoSistema, frmVincularGrupoSistema);
   frmVincularGrupoSistema.ShowModal();
   dmTelaInicial.qinicial.Close;
   dmTelaInicial.qinicial.open;
   end
end;


procedure TfrmInicioControleDependencias.DBGrid1DblClick(Sender: TObject);
begin
   if trim(dmTelaInicial.qInicialSEQUENCIA.AsString) = '' then
    begin
     ShowMessage('NÃO HÁ SISTEMAS CADASTRADOS');
     exit;
    end;

   // monta tela com os dados da versão mais recente com versão recomendada
   vsistema := dmTelaInicial.qInicialSEQUENCIA.AsInteger;
   vVersao := dmTelaInicial.qInicialVERSAO.AsString;

   //enviar ID para combobox da prox tela
   dmTelaInicial.qwork.close;
   dmTelaInicial.qWork.ParamByName('SISTEMA').asString := IntToStr(vsistema) ;
   dmTelaInicial.qwork.Open;


   // if necessário para tratar sistema sem grupo
   if dmTelaInicial.qworkGrupo.Text = '' then
      vGrupo := 0
   else
   vGrupo :=  StrToInt(dmTelaInicial.qworkGrupo.AsString);



   //Abre tela de consultas
   Application.CreateForm(TfrmConsultaDependencias, frmConsultaDependencias);
   frmConsultaDependencias.ShowModal();
end;



procedure TfrmInicioControleDependencias.dbGrupoClick(
  Sender: TObject);
begin

dmTelaInicial.qInicial.Close;
dmTelaInicial.qinicial.SQL.clear;
dmTelaInicial.qinicial.SQL.add(' select distinct SISTEMAS.SEQUENCIA, SISTEMAS.NOME,' +
                               ' (select first 1 D.VERSAO_SISTEMA' +
                               ' from DEPENDENCIAS D' +
                               ' where D.ID_SISTEMA = SISTEMAS.SEQUENCIA' +
                               ' order by D.ID_DEPENDENCIA desc) as VERSAO' +
                               ' from SISTEMAS' +
                               ' inner join SISTEMA_VINC on SISTEMAS.SEQUENCIA = SISTEMA_VINC.SEQSISTEMA' +
                               ' where SISTEMA_VINC.ATIVO = ''S'' and' +
                               ' SISTEMA_VINC.SEQGRUPO = :GRUPO');

  if dbGrupo.Text = 'TODOS' then
   begin
    dmTelaInicial.qinicial.Close;
    dmTelaInicial.qinicial.SQL.clear;
    dmTelaInicial.qInicial.SQL.Add(' select SISTEMAS.SEQUENCIA, SISTEMAS.NOME, ' +
                                   ' (select first 1 D.VERSAO_SISTEMA ' +
                                   '  from DEPENDENCIAS D ' +
                                   '  where D.ID_SISTEMA = SISTEMAS.SEQUENCIA ' +
                                   '  order by D.id_dependencia desc) as VERSAO ' +
                                   '  from SISTEMAS ' +
                                   '  order by sistemas.sequencia');
    dmTelaInicial.qinicial.open;
   end
  else
   begin
    dmTelaInicial.qinicial.ParamByName('GRUPO').asInteger := dbGrupo.KeyValue;
    dmTelaInicial.qInicial.open;
   end
end;

procedure TfrmInicioControleDependencias.File1Click(Sender: TObject);
begin
     if trim(dmTelaInicial.qInicialSEQUENCIA.AsString) = '' then
    begin
     ShowMessage('NÃO HÁ SISTEMAS CADASTRADOS');
     exit;
    end;

   // monta tela com os dados da versão mais recente com versão recomendada
   vNomeSistema :=  dmTelaInicial.qInicialNOME.AsString;
   vsistema := dmTelaInicial.qInicialSEQUENCIA.AsInteger;


   // Abrir tela para cadastro de Familia
   Application.CreateForm(TfrmVincularGrupoSistema, frmVincularGrupoSistema);
   frmVincularGrupoSistema.ShowModal();
end;

procedure TfrmInicioControleDependencias.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  ExitProcess(0);
end;

procedure TfrmInicioControleDependencias.FormCreate(Sender: TObject);
begin

  if not(Assigned(udmTelaInicial.dmTelaInicial)) then
    Application.CreateForm(TdmTelaInicial, dmTelaInicial);

     dmTelaInicial.qGrupos.close;
     dmTelaInicial.qGrupos.Open;

    dmTelaInicial.qinicial.Close;
    dmTelaInicial.qinicial.SQL.clear;
    dmTelaInicial.qInicial.SQL.Add(' select SISTEMAS.SEQUENCIA, SISTEMAS.NOME, ' +
                                   ' (select first 1 D.VERSAO_SISTEMA ' +
                                   '  from DEPENDENCIAS D ' +
                                   '  where D.ID_SISTEMA = SISTEMAS.SEQUENCIA ' +
                                   '  order by D.id_dependencia desc) as VERSAO ' +
                                   '  from SISTEMAS ' +
                                   '  order by sistemas.sequencia');
    dmTelaInicial.qinicial.open;

end;


procedure TfrmInicioControleDependencias.FormShow(Sender: TObject);
begin
     dbgrupo.KeyValue:= dmTelaInicial.qGrupos.fieldbyname('SEQUENCIA').Value;
end;

procedure TfrmInicioControleDependencias.SpeedButton1Click(Sender: TObject);
begin
  validaUsuario := false;
  Application.CreateForm(TfrmValidacaoUsuario, frmValidacaoUsuario);
  frmValidacaoUsuario.ShowModal();

 if validaUsuario then
  begin
    Application.CreateForm(TfrmAdicionarDependencias, frmAdicionarDependencias);
    frmAdicionarDependencias.ShowModal();
    dmTelaInicial.qInicial.close;
    dmTelaInicial.qInicial.open;
  end

end;

procedure TfrmInicioControleDependencias.SpeedButton2Click(Sender: TObject);

begin
  validaUsuario := false;
  Application.CreateForm(TfrmValidacaoUsuario, frmValidacaoUsuario);
  frmValidacaoUsuario.ShowModal();

 if validaUsuario then
   begin
   Application.CreateForm(TfrmCadastroSistema, frmCadastroSistema);
   frmCadastroSistema.ShowModal();
   dmTelaInicial.qinicial.Close;
   dmTelaInicial.qinicial.open;
   end
end;
end.
