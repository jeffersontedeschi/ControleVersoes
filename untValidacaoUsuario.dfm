object frmValidacaoUsuario: TfrmValidacaoUsuario
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Login'
  ClientHeight = 139
  ClientWidth = 249
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object pnlUsuarioSenha: TPanel
    Left = 0
    Top = 0
    Width = 249
    Height = 139
    Align = alClient
    TabOrder = 0
    object Label1: TLabel
      Left = 36
      Top = 26
      Width = 40
      Height = 13
      Caption = 'Usuario:'
    end
    object Label2: TLabel
      Left = 36
      Top = 66
      Width = 34
      Height = 13
      Caption = 'Senha:'
    end
    object edtUsuario: TEdit
      Left = 92
      Top = 23
      Width = 121
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 0
      OnKeyPress = edtUsuarioKeyPress
    end
    object edtSenha: TEdit
      Left = 92
      Top = 63
      Width = 121
      Height = 21
      PasswordChar = '*'
      TabOrder = 1
      OnKeyPress = edtSenhaKeyPress
    end
    object Login: TButton
      Left = 158
      Top = 90
      Width = 55
      Height = 25
      Caption = 'Login'
      TabOrder = 2
      OnClick = LoginClick
    end
  end
end
