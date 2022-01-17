unit untCadastroSistema;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls,
  Vcl.Buttons, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.ExtCtrls, udmTelaInicial;

type
  TfrmCadastroSistema = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    edtNomeSistema: TEdit;
    Panel2: TPanel;
    Label2: TLabel;
    edtVersaoSistema: TEdit;
    btnCadastrar: TButton;
    btnCancelar: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnCadastrarClick(Sender: TObject);
    procedure edtVersaoSistemaKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);

  private
    { Private declarations }
    dmTelaIni : TdmTelaInicial;
  public
    { Public declarations }
    vFrmDependencias : integer;
  end;

var
  frmCadastroSistema: TfrmCadastroSistema;

implementation

{$R *.dfm}

uses untModuloDados, untTelaInicialDependencias, udmCadastroSistema;

procedure TfrmCadastroSistema.btnCadastrarClick(Sender: TObject);
begin

  var vNome : string;
  var vId, vDependencia: Integer;
begin

  //verifica se existe sistema com o mesmo nome da tentativa de cadastro;
   dmCadastroSistema.qVerificaSistema.Close;
   dmCadastroSistema.qVerificaSistema.open;

   if dmCadastroSistema.qVerificaSistema.locate('NOME', edtNomeSistema.text,[loCaseInsensitive]) then
   begin
    ShowMessage('Esse sistema já está cadastrado!');
    edtNomeSistema.SetFocus;
    abort;
   end;

  //cadastra o nome do sistema no banco;
  if not(trim(edtNomeSistema.Text) = '') and not(trim(edtVersaoSistema.Text) = '') then
    begin
    dmCadastroSistema.qWork.close;
    dmCadastroSistema.qWork.sql.clear;
    dmCadastroSistema.qWork.sql.add(' insert into DEPENDENCIAS (DEPENDENCIAS.ID_DEPENDENCIA,'+
                  ' DEPENDENCIAS.ID_SISTEMA, DEPENDENCIAS.VERSAO_SISTEMA)' +
                  ' select :DEP, SISTEMAS.SEQUENCIA,' +
                  ' (select first 1 D.VERSAO_SISTEMA' +
                  ' from DEPENDENCIAS D' +
                  ' where D.ID_SISTEMA = SISTEMAS.SEQUENCIA' +
                  ' order by D.ID_DEPENDENCIA desc) as VERSAO' +
                  ' from SISTEMAS' +
                  ' order by SISTEMAS.SEQUENCIA');
    dmCadastroSistema.qWork.ParamByName('dep').AsInteger := dmCadastroSistema.qGen1GEN_ID.AsInteger;
    dmCadastroSistema.qWork.Prepare;
    dmCadastroSistema.qWork.ExecSQL;


    dmCadastroSistema.qCadastrarSistema.close;
    dmCadastroSistema.qCadastrarSistema.SQL.Clear;
    dmCadastroSistema.qCadastrarSistema.sql.Add('insert into sistemas (nome) values (:nome_sistema) returning sequencia');
    dmCadastroSistema.qCadastrarSistema.ParamByName('nome_sistema').AsString := edtNomeSistema.Text;
    dmCadastroSistema.qCadastrarSistema.Prepare;
    dmCadastroSistema.qCadastrarSistema.open;
    vId := dmCadastroSistema.qCadastrarSistema.Fields[0].AsInteger;
    edtNomeSistema.Text := '';


    dmCadastroSistema.qCadastrarSistema.close;
    dmCadastroSistema.qCadastrarSistema.SQL.Clear;
    dmCadastroSistema.qCadastrarSistema.sql.Add('insert into dependencias (id_sistema, id_dependencia, versao_sistema) values (:id_sistema, :id_dependencia, :versao_sistema)');
    dmCadastroSistema.qCadastrarSistema.ParamByName('id_sistema').AsInteger :=  vId;
    dmCadastroSistema.qCadastrarSistema.ParamByName('id_dependencia').AsInteger := dmCadastroSistema.qGen1GEN_ID.AsInteger;
    dmCadastroSistema.qCadastrarSistema.ParamByName('versao_sistema').AsString := edtVersaoSistema.Text;
    dmCadastroSistema.qCadastrarSistema.Prepare;
    dmCadastroSistema.qCadastrarSistema.ExecSQL;
    edtVersaoSistema.Text := '';
   end
  else
  begin
    if trim(UpperCase((edtNomeSistema.text))) = '' then
     begin
       ShowMessage('Preencha o NOME para cadastrar o sistema!');
       edtNomeSistema.SetFocus;
       abort;
     end
    else
     begin
       ShowMessage('Preencha a VERSÃO para cadastrar o sistema!');
       edtVersaoSistema.SetFocus;
       abort;
     end;
  end;

  close;
end;
end;

procedure TfrmCadastroSistema.btnCancelarClick(Sender: TObject);
begin
  close;
end;

procedure TfrmCadastroSistema.edtVersaoSistemaKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (key in ['0'..'9','.',#8]) then
  key :=#0;
end;

procedure TfrmCadastroSistema.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  //  dmCadastroSistema.Destroy;
end;

procedure TfrmCadastroSistema.FormCreate(Sender: TObject);
begin
  if not(Assigned(dmCadastroSistema)) then
  Application.CreateForm(TdmCadastroSistema, dmCadastroSistema);

  if not(Assigned(dmTelaInicial)) then
  Application.CreateForm(TdmTelaInicial, dmTelaInicial);

end;

end.
