object Form1: TForm1
  Left = 0
  Top = 0
  Caption = #1054#1076#1085#1086#1084#1077#1088#1085#1099#1081' '#1084#1072#1089#1089#1080#1074
  ClientHeight = 211
  ClientWidth = 423
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  DesignSize = (
    423
    211)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 16
    Width = 163
    Height = 13
    Caption = #1056#1072#1079#1084#1077#1088#1085#1086#1089#1090#1100' '#1080#1089#1093#1086#1076#1085#1086#1075#1086' '#1084#1072#1089#1089#1080#1074#1072
  end
  object SE1: TSpinEdit
    Left = 181
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
    Width = 412
    Height = 128
    ActivePage = TabSheet2
    Anchors = [akLeft, akTop, akRight, akBottom]
    MultiLine = True
    TabOrder = 1
    object TabSheet1: TTabSheet
      Caption = #1048#1089#1093#1086#1076#1085#1099#1081' '#1084#1072#1089#1089#1080#1074
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object SG1: TStringGrid
        Left = 0
        Top = 0
        Width = 404
        Height = 49
        Align = alTop
        FixedCols = 0
        RowCount = 1
        FixedRows = 0
        TabOrder = 0
      end
      object SG2: TStringGrid
        Left = 0
        Top = 50
        Width = 404
        Height = 50
        Align = alBottom
        FixedCols = 0
        RowCount = 1
        FixedRows = 0
        TabOrder = 1
      end
    end
    object TabSheet2: TTabSheet
      Caption = #1054#1073#1088#1072#1073#1086#1090#1072#1085#1085#1099#1081' '#1084#1072#1089#1089#1080#1074
      ImageIndex = 1
      object Label2: TLabel
        Left = 0
        Top = 67
        Width = 404
        Height = 33
        Align = alBottom
        Caption = #1053#1072#1080#1073#1086#1083#1100#1096#1077#1077' '#1079#1085#1072#1095#1077#1085#1080#1077':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -27
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ExplicitWidth = 287
      end
      object SG3: TStringGrid
        Left = 0
        Top = 0
        Width = 404
        Height = 61
        Align = alTop
        FixedCols = 0
        RowCount = 1
        FixedRows = 0
        TabOrder = 0
      end
    end
  end
  object Button1: TButton
    Left = 8
    Top = 183
    Width = 185
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = #1060#1086#1088#1084#1080#1088#1086#1074#1072#1085#1080#1077' '#1080#1089#1093#1086#1076#1085#1086#1075#1086' '#1084#1072#1089#1080#1074#1072
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 337
    Top = 183
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = #1054#1073#1088#1072#1073#1086#1090#1082#1072
    Enabled = False
    TabOrder = 3
    OnClick = Button2Click
  end
end
