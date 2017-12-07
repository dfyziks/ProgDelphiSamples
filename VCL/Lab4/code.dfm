object Form1: TForm1
  Left = 0
  Top = 0
  Caption = #1055#1088#1086#1075#1088#1072#1084#1084#1072' '#1076#1083#1103' '#1074#1074#1086#1076#1072' '#1080' '#1072#1085#1072#1083#1080#1079#1072' '#1095#1080#1089#1083#1072
  ClientHeight = 157
  ClientWidth = 424
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    424
    157)
  PixelsPerInch = 96
  TextHeight = 13
  object La: TLabel
    Left = 8
    Top = 80
    Width = 21
    Height = 16
    Anchors = [akLeft, akBottom]
    Caption = 'A ='
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Lb: TLabel
    Left = 8
    Top = 120
    Width = 20
    Height = 16
    Anchors = [akLeft, akBottom]
    Caption = 'B ='
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Button1: TButton
    Left = 341
    Top = 124
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = #1056#1072#1089#1095#1077#1090
    TabOrder = 0
    OnClick = Button1Click
  end
  object LEx: TLabeledEdit
    Left = 8
    Top = 32
    Width = 121
    Height = 21
    Alignment = taCenter
    EditLabel.Width = 8
    EditLabel.Height = 16
    EditLabel.BiDiMode = bdLeftToRight
    EditLabel.Caption = 'X'
    EditLabel.Font.Charset = DEFAULT_CHARSET
    EditLabel.Font.Color = clWindowText
    EditLabel.Font.Height = -13
    EditLabel.Font.Name = 'Tahoma'
    EditLabel.Font.Style = []
    EditLabel.ParentBiDiMode = False
    EditLabel.ParentFont = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    Text = '4.12'
    OnKeyPress = LExKeyPress
  end
  object LEy: TLabeledEdit
    Left = 152
    Top = 32
    Width = 121
    Height = 21
    Alignment = taCenter
    Anchors = [akTop]
    EditLabel.Width = 7
    EditLabel.Height = 16
    EditLabel.Caption = 'Y'
    EditLabel.Font.Charset = DEFAULT_CHARSET
    EditLabel.Font.Color = clWindowText
    EditLabel.Font.Height = -13
    EditLabel.Font.Name = 'Tahoma'
    EditLabel.Font.Style = []
    EditLabel.ParentFont = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    Text = '3.054'
    OnKeyPress = LExKeyPress
  end
  object LEz: TLabeledEdit
    Left = 295
    Top = 32
    Width = 121
    Height = 21
    Alignment = taCenter
    Anchors = [akTop, akRight]
    EditLabel.Width = 7
    EditLabel.Height = 16
    EditLabel.Caption = 'Z'
    EditLabel.Font.Charset = DEFAULT_CHARSET
    EditLabel.Font.Color = clWindowText
    EditLabel.Font.Height = -13
    EditLabel.Font.Name = 'Tahoma'
    EditLabel.Font.Style = []
    EditLabel.ParentFont = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    Text = '-1.02'
    OnKeyPress = LExKeyPress
  end
end
