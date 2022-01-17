unit untControleSistemasDependencias;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.Buttons, FireDAC.Stan.StorageBin, Vcl.ExtCtrls, System.StrUtils, System.Types;

type
  TfrmAdicionarDependencias = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    btnAddDependencia: TSpeedButton;
    btnCancelar: TSpeedButton;
    dsBusca: TDataSource;
    FDMemTable1: TFDMemTable;
    FDMemTable1SEQUENCIA: TIntegerField;
    FDMemTable1NOME: TStringField;
    FDMemTable1VERSAO: TWideStringField;
    FDMemTable1tempVersao: TStringField;
    procedure btnAddDependenciaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCancelarClick(Sender: TObject);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);

  private
    { Private declarations }

  public
    { Public declarations }
     s : integer;
  end;

var
  frmAdicionarDependencias: TfrmAdicionarDependencias;
  registro : TBookmark;
implementation

{$R *.dfm}

uses untModuloDados, untAdicionarDependencias, untTelaInicialDependencias, udmAdicionarDependencias;

procedure TfrmAdicionarDependencias.btnAddDependenciaClick(
  Sender: TObject);
 var gen_id, i, x, z, y, w, qtdAntigo, qtdNovo, Resultado : integer;
     stringNova, stringAntiga, totalNovo, totalAntigo: string;
     StringSeparadaAntiga, StringSeparadaNova : TStringDynArray;
  begin
  //variavel para validar mudança de dados
  i := 0;

  //abre a transação
  dmAdicionarDependencias.trAdicionarDependencia.StartTransaction;

  //abre o generator e adiciona na variavel gen_id o ultimo valor
  dmAdicionarDependencias.qgen.close;
  dmAdicionarDependencias.qgen.open;
  gen_id := dmAdicionarDependencias.qGenGEN_ID.AsInteger;

  // verifica se foi alterado algum dado da tabela
  FDMemTable1.First;
  while not(FDMemTable1.Eof) do
    begin
     if FDMemTable1tempVersao.AsString <> FDMemTable1VERSAO.AsString then
      begin
      i := 1;
      break
      end;
    FDMemTable1.next;
    end;

  // varredura na tabela para adicionar todos campos caso tenha sido alterado algum dado
  FDMemTable1.First;
   if i <> 0 then
     begin
      while not(FDMemTable1.Eof) do
     begin
     dmAdicionarDependencias.qBusca.close;
     dmAdicionarDependencias.qBusca.sql.clear;
     dmAdicionarDependencias.qbusca.sql.add('insert into dependencias (id_dependencia, id_sistema, versao_sistema) values (:dep, :sys, :vrs )');
     dmAdicionarDependencias.qbusca.ParamByName('dep').AsInteger := gen_id;
     dmAdicionarDependencias.qbusca.ParamByName('sys').AsInteger := FDMemTable1.FieldByName('SEQUENCIA').AsInteger;
     dmAdicionarDependencias.qbusca.ParamByName('vrs').asString :=  FDMemTable1.FieldByName('VERSAO').asString;

     // Recebe os Valores Antigo e Novo e Separa eles em casas
      stringNova := FDMemTable1.FieldByName('VERSAO').asString;
      stringSeparadaNova := SplitString(stringNova, '.');
      stringAntiga := FDMemTable1tempVersao.AsString;
      stringSeparadaAntiga := SplitString(stringAntiga, '.');
      qtdNovo := length(StringSeparadaNova);

      //Maneira 1
      // Adiciona-se o zero a esquerda para completar os 4 numeros de cada casas (máx 4 casas)
       for w := 0 to qtdNovo -1  do
       begin
        qtdAntigo := length(StringSeparadaNova[w]);
         for x:= 1 to 4 - qtdAntigo  do
          StringSeparadaNova[w] := '0' + StringSeparadaNova[w];
       end;

      //Maneira 2
     // Adiciona-se o zero a esquerda para completar os 4 numeros de cada casas (máx 4 casas)
       for w := 0 to length(StringSeparadaAntiga) -1  do
        for x:= 1 to 4 - length(StringSeparadaAntiga[w])  do
          StringSeparadaAntiga[w] := '0' + StringSeparadaAntiga[w];

       // Remove os pontos de separação e une os numeros tornando-os um só
        for y:= 0 to length(StringSeparadaNova) -1 do
         totalNovo := totalNovo +  StringReplace(stringSeparadaNova[y], '.', '', [rfReplaceAll]);

        for z:= 0 to length(StringSeparadaAntiga) -1 do
         totalAntigo := totalAntigo +  StringReplace(stringSeparadaAntiga[z], '.', '', [rfReplaceAll]);



      // comparação para saber qual numero é maior, caso menor entrará no IF e não gravará.
      if StrToInt64(totalNovo) < StrToInt64(Trim(totalAntigo)) then
       begin
        ShowMessage('VERSÃO MENOR QUE A ANTERIOR E NÃO SERÁ ALTERADA: '+
                    FDMemTable1.FieldByName('NOME').asString);
        dmAdicionarDependencias.trAdicionarDependencia.Rollback;
        totalNovo := '';
        totalAntigo := '';
        Abort;
       end
      else
       begin
        dmAdicionarDependencias.qbusca.Prepare;
        dmAdicionarDependencias.qbusca.ExecSQL;
        totalNovo := '';
        totalAntigo := '';
        FDMemTable1.next;
       end;
     end;
     FDMemTable1.First;
    end
   else
    begin
     ShowMessage('Nenhum Sistema foi Alterado!');
     close;
    end;

    //commit transaction
    dmAdicionarDependencias.trAdicionarDependencia.Commit;

    //desabilita os botões
    btnCancelar.Enabled := false;
    btnAddDependencia.Enabled := false;
    DBGrid1.Enabled := false;
    close;
end;

procedure TfrmAdicionarDependencias.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dmAdicionarDependencias := nil;
end;

procedure TfrmAdicionarDependencias.FormCreate(Sender: TObject);
begin
  if not(Assigned(dmAdicionarDependencias)) then
      Application.CreateForm(TdmAdicionarDependencias, dmAdicionarDependencias);
end;

procedure TfrmAdicionarDependencias.FormShow(Sender: TObject);
begin
  dmAdicionarDependencias.qBusca.close;
  dmAdicionarDependencias.qBusca.open;

  FDMemTable1.CopyDataSet(dmAdicionarDependencias.qBusca, [coStructure, coRestart, coAppend]);

  btnCancelar.Enabled := true;
  btnAddDependencia.Enabled := true;
  DBGrid1.Enabled := true;
  FDMemTable1.First;
  FDMemTable1VERSAO.FocusControl;
end;

procedure TfrmAdicionarDependencias.btnCancelarClick(Sender: TObject);
begin
  close;
end;

procedure TfrmAdicionarDependencias.DBGrid1KeyPress(Sender: TObject;
  var Key: Char);
begin
   if not (key in ['0'..'9','.',#8]) then
    key :=#0;
end;

end.
