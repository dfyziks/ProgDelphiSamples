object Form1: TForm1
  Left = 0
  Top = 0
  Caption = #1055#1086#1089#1090#1088#1086#1077#1085#1080#1077' '#1075#1088#1072#1092#1080#1082#1072' '#1092#1091#1085#1082#1094#1080#1081' '#1085#1072' '#1079#1072#1076#1072#1085#1085#1086#1084' '#1080#1085#1090#1077#1088#1074#1072#1083#1077
  ClientHeight = 329
  ClientWidth = 659
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    659
    329)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 545
    Top = 24
    Width = 56
    Height = 16
    Anchors = [akTop, akRight]
    Caption = #1048#1085#1090#1077#1088#1074#1072#1083
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Button1: TButton
    Left = 521
    Top = 280
    Width = 107
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = #1043#1088#1072#1092#1080#1082
    TabOrder = 0
    OnClick = Button1Click
  end
  object Chart1: TChart
    Left = 0
    Top = 0
    Width = 481
    Height = 329
    Title.Text.Strings = (
      'Y=Y(x)')
    View3D = False
    TabOrder = 1
    Anchors = [akLeft, akTop, akRight, akBottom]
    DefaultCanvas = 'TGDIPlusCanvas'
    ColorPaletteIndex = 13
    object Series1: TLineSeries
      Legend.Visible = False
      ShowInLegend = False
      Brush.BackColor = clDefault
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
      YValues.Order = loNone
    end
  end
  object LExn: TLabeledEdit
    Left = 545
    Top = 56
    Width = 107
    Height = 21
    Anchors = [akTop, akRight]
    EditLabel.Width = 47
    EditLabel.Height = 16
    EditLabel.Caption = #1053#1072#1095#1072#1083#1086' '
    EditLabel.Font.Charset = DEFAULT_CHARSET
    EditLabel.Font.Color = clWindowText
    EditLabel.Font.Height = -13
    EditLabel.Font.Name = 'Tahoma'
    EditLabel.Font.Style = []
    EditLabel.ParentFont = False
    LabelPosition = lpLeft
    TabOrder = 2
    Text = '0'
    OnKeyPress = LExnKeyPress
  end
  object LExk: TLabeledEdit
    Left = 545
    Top = 101
    Width = 107
    Height = 21
    Anchors = [akTop, akRight]
    EditLabel.Width = 47
    EditLabel.Height = 16
    EditLabel.Caption = #1050#1086#1085#1077#1094'   '
    EditLabel.Font.Charset = DEFAULT_CHARSET
    EditLabel.Font.Color = clWindowText
    EditLabel.Font.Height = -13
    EditLabel.Font.Name = 'Tahoma'
    EditLabel.Font.Style = []
    EditLabel.ParentFont = False
    LabelPosition = lpLeft
    TabOrder = 3
    Text = '20'
    OnKeyPress = LExnKeyPress
  end
  object LEdx: TLabeledEdit
    Left = 521
    Top = 195
    Width = 107
    Height = 21
    Anchors = [akTop, akRight]
    EditLabel.Width = 90
    EditLabel.Height = 16
    EditLabel.Caption = '   '#1064#1072#1075' '#1087#1086' '#1086#1089#1080' X'
    EditLabel.Font.Charset = DEFAULT_CHARSET
    EditLabel.Font.Color = clWindowText
    EditLabel.Font.Height = -13
    EditLabel.Font.Name = 'Tahoma'
    EditLabel.Font.Style = []
    EditLabel.ParentFont = False
    TabOrder = 4
    Text = '0.5'
    OnKeyPress = LExnKeyPress
  end
end
