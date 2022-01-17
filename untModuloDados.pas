unit untModuloDados;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client, IniFiles,
  WinSock, Data.SqlExpr, Data.DBXFirebird, Vcl.Dialogs, Winapi.Windows;

type
  TdmControleDependencias = class(TDataModule)
    DB: TFDConnection;
    SQLConnection1: TSQLConnection;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmControleDependencias: TdmControleDependencias;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{Função para criptografar e descriptografar uma string}
function Crypt(Action, Src: String): String;
var
 KeyLen, KeyPos, OffSet : Integer;
 Dest, Key : String;
 SrcPos, SrcAsc, TmpSrcAsc, Range : Integer;
begin
 if (Src = '') Then
 begin
  Result:= '';
  Exit;
 end;
 Key := 'YUQL23KL23DF90WI5E1JAS467NMCXXL6JAOAUWWMCL0AOMM4A4VZYW9KHJUI2347EJHJKDF3424SKL K3LAKDJSL9RTIKJ';
 Dest := '';
 KeyLen := Length(Key);
 KeyPos := 0;
 SrcPos := 0;
 SrcAsc := 0;
 Range := 256;
 if (Action = UpperCase('C')) then
 begin
  Randomize;
  OffSet := Random(Range);
  Dest := Format('%1.2x',[OffSet]);
  for SrcPos := 1 to Length(Src) do
  begin
   //Application.ProcessMessages;
   SrcAsc := (Ord(Src[SrcPos]) + OffSet) Mod 255;
   if KeyPos < KeyLen then KeyPos := KeyPos + 1 else KeyPos := 1;
   SrcAsc := SrcAsc Xor Ord(Key[KeyPos]);
   Dest := Dest + Format('%1.2x',[SrcAsc]);
   OffSet := SrcAsc;
  end;
 end
 Else
  if (Action = UpperCase('D')) then
  begin
   OffSet := StrToInt('$'+ copy(Src,1,2));
   SrcPos := 3;
   repeat
    SrcAsc := StrToInt('$'+ copy(Src,SrcPos,2));
    if (KeyPos < KeyLen) Then KeyPos := KeyPos + 1 else KeyPos := 1;
    TmpSrcAsc := SrcAsc Xor Ord(Key[KeyPos]);
    if TmpSrcAsc <= OffSet
    then
     TmpSrcAsc := 255 + TmpSrcAsc - OffSet
    else
     TmpSrcAsc := TmpSrcAsc - OffSet;
    Dest := Dest + Chr(TmpSrcAsc);
    OffSet := SrcAsc;
    SrcPos := SrcPos + 2;
   until (SrcPos >= Length(Src));
  end;
  Result:= Dest;
end;


procedure TdmControleDependencias.DataModuleCreate(Sender: TObject);
  var iniConf : TIniFile;
      vBanco, vIp, vPassword, vVerificaString : String;
begin
  try
      if not FileExists('C:\Proansi\ControleVersoes.ini') then
      begin
       ShowMessage('Arquivo.INI não encontrado!');
       ExitProcess(0);
      end;

      iniConf := TIniFile.Create('C:\Proansi\ControleVersoes.ini');
      vIp := iniConf.ReadString('Configuracao', 'Server', '');
      vBanco := iniConf.ReadString('Configuracao', 'DataBase', '');

      //verifica se tem senha no .ini, caso não tiver ele adiciona.
      vVerificaString := iniConf.ReadString('Configuracao', 'senha',  '');
      if vVerificaString = '' then
         iniConf.WriteString('Configuracao', 'senha',  Crypt('C', '.cana2002,'));

      //armazena a senha na variavel e remove a criptografia
      vPassword := iniConf.ReadString('Configuracao', 'senha', '');
      vPassword := crypt('D', vPassword);

      //deleta a senha do .ini e finaliza as ações do bloco.
      iniConf.DeleteKey('Configuracao', 'senha');
      iniConf.Free;


      //preenche os parametros da conexão com os dados + senha da variavel acima
      DB.Params.Clear;
      DB.Params.Add('server=' + vIp);
      dB.Params.Add('Database=' + vBanco);
      DB.Params.Add('user_name=SYSDBA');
      DB.Params.Add('password='+ vPassword);
      DB.Params.Add('DriverID=FB');
      DB.Connected := true;


     finally
  end;

end;

end.
