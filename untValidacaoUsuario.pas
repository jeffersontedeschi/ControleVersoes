unit untValidacaoUsuario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfrmValidacaoUsuario = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    edtUsuario: TEdit;
    edtSenha: TEdit;
    Login: TButton;
    pnlUsuarioSenha: TPanel;
    procedure LoginClick(Sender: TObject);
    procedure edtUsuarioKeyPress(Sender: TObject; var Key: Char);
    procedure edtSenhaKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmValidacaoUsuario: TfrmValidacaoUsuario;

implementation

uses
  untTelaInicialDependencias, udmTelaInicial;

{$R *.dfm}

procedure TfrmValidacaoUsuario.edtSenhaKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then
   begin
    Key := #0;
    Perform(Wm_NextDlgCtl,0,0);
   end;
end;

procedure TfrmValidacaoUsuario.edtUsuarioKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (Key = #13) then
   begin
    Key := #0;
    Perform(Wm_NextDlgCtl,0,0);
   end;
end;

procedure TfrmValidacaoUsuario.LoginClick(Sender: TObject);
begin
  if (edtUsuario.text = 'SUPER') and (edtSenha.text = '.Pr0@ns1,') then
    begin
     frmInicioControleDependencias.validaUsuario := true;
     close;
    end
  else
  begin
   showMessage('Senha Incorreta');
    edtUsuario.SetFocus;
    Abort;
  end;
end;


end.
