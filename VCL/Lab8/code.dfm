object Form1: TForm1
  Left = 0
  Top = 0
  Caption = #1044#1074#1091#1084#1077#1088#1085#1099#1081' '#1084#1072#1089#1089#1080#1074
  ClientHeight = 302
  ClientWidth = 553
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  DesignSize = (
    553
    302)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 16
    Width = 139
    Height = 13
    Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1089#1090#1088#1086#1082' '#1084#1072#1090#1088#1080#1094#1099
  end
  object Label2: TLabel
    Left = 256
    Top = 16
    Width = 157
    Height = 13
    Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1089#1090#1086#1083#1073#1094#1086#1074' '#1084#1072#1090#1088#1080#1094#1099
  end
  object SE1: TSpinEdit
    Left = 160
    Top = 13
    Width = 52
    Height = 22
    MaxValue = 100
    MinValue = 1
    TabOrder = 0
    Value = 5
    OnChange = SE1Change
  end
  object PC1: TPageControl
    Left = 8
    Top = 49
    Width = 542
    Height = 219
    ActivePage = TabSheet2
    Anchors = [akLeft, akTop, akRight, akBottom]
    MultiLine = True
    TabOrder = 1
    object TabSheet1: TTabSheet
      Caption = #1048#1089#1093#1086#1076#1085#1072#1103' '#1084#1072#1090#1088#1080#1094#1072
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 404
      ExplicitHeight = 100
      object SG1: TStringGrid
        Left = 0
        Top = 0
        Width = 534
        Height = 191
        Align = alClient
        FixedCols = 0
        RowCount = 1
        FixedRows = 0
        TabOrder = 0
        ExplicitWidth = 404
        ExplicitHeight = 49
      end
    end
    object TabSheet2: TTabSheet
      Caption = #1056#1077#1079#1091#1083#1100#1090#1072#1090' '#1086#1073#1088#1072#1073#1086#1090#1082#1080
      ImageIndex = 1
      object SG2: TStringGrid
        Left = 0
        Top = 0
        Width = 534
        Height = 191
        Align = alClient
        FixedCols = 0
        RowCount = 1
        FixedRows = 0
        TabOrder = 0
      end
    end
  end
  object Button1: TButton
    Left = 8
    Top = 274
    Width = 185
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = #1060#1086#1088#1084#1080#1088#1086#1074#1072#1085#1080#1077' '#1080#1089#1093#1086#1076#1085#1086#1081' '#1090#1072#1073#1083#1080#1094#1099
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 467
    Top = 274
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = #1054#1073#1088#1072#1073#1086#1090#1082#1072
    Enabled = False
    TabOrder = 3
    OnClick = Button2Click
  end
  object SE2: TSpinEdit
    Left = 429
    Top = 13
    Width = 52
    Height = 22
    MaxValue = 100
    MinValue = 1
    TabOrder = 4
    Value = 6
    OnChange = SE1Change
  end
end
