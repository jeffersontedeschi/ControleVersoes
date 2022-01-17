object frmCadastroSistema: TfrmCadastroSistema
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Cadastrar Sistema'
  ClientHeight = 166
  ClientWidth = 264
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 264
    Height = 166
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 13
      Top = 11
      Width = 67
      Height = 13
      Caption = 'Nome Sistema'
    end
    object Label2: TLabel
      Left = 13
      Top = 73
      Width = 73
      Height = 13
      Caption = 'Vers'#227'o Sistema'
    end
    object edtNomeSistema: TEdit
      Left = 12
      Top = 30
      Width = 241
      Height = 21
      MaxLength = 40
      TabOrder = 0
    end
    object Panel2: TPanel
      Left = 0
      Top = 127
      Width = 264
      Height = 39
      Align = alBottom
      BevelOuter = bvSpace
      BorderWidth = 3
      TabOrder = 2
      object btnCadastrar: TButton
        Left = 19
        Top = 7
        Width = 110
        Height = 25
        Caption = 'Cadastrar'
        TabOrder = 1
        OnClick = btnCadastrarClick
      end
      object btnCancelar: TButton
        Left = 135
        Top = 7
        Width = 110
        Height = 25
        Caption = 'Cancelar'
        TabOrder = 0
        OnClick = btnCancelarClick
      end
    end
    object edtVersaoSistema: TEdit
      Left = 12
      Top = 92
      Width = 241
      Height = 21
      MaxLength = 20
      TabOrder = 1
      OnKeyPress = edtVersaoSistemaKeyPress
    end
  end
end
