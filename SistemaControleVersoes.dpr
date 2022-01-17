program SistemaControleVersoes;

uses
  Vcl.Forms,
  untControleSistemasDependencias in 'untControleSistemasDependencias.pas' {frmAdicionarDependencias},
  untModuloDados in 'untModuloDados.pas' {dmControleDependencias: TDataModule},
  untTelaInicialDependencias in 'untTelaInicialDependencias.pas' {frmInicioControleDependencias},
  untConsultaDependencias in 'untConsultaDependencias.pas' {frmConsultaDependencias},
  untCadastroSistema in 'untCadastroSistema.pas' {frmCadastroSistema},
  Vcl.Themes,
  Vcl.Styles,
  udmCadastroSistema in 'udmCadastroSistema.pas' {dmCadastroSistema: TDataModule},
  udmConsultaDependencias in 'udmConsultaDependencias.pas' {dmConsultaDependencias: TDataModule},
  udmAdicionarDependencias in 'udmAdicionarDependencias.pas' {dmAdicionarDependencias: TDataModule},
  udmTelaInicial in 'udmTelaInicial.pas' {dmTelaInicial: TDataModule},
  untVincularGrupoSistema in 'untVincularGrupoSistema.pas' {frmVincularGrupoSistema},
  untValidacaoUsuario in 'untValidacaoUsuario.pas' {frmValidacaoUsuario};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Carbon');
  Application.CreateForm(TdmControleDependencias, dmControleDependencias);
  Application.CreateForm(TfrmInicioControleDependencias, frmInicioControleDependencias);
  Application.CreateForm(TfrmValidacaoUsuario, frmValidacaoUsuario);
  Application.Run;
end.
