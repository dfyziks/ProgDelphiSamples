unit code;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids, Vcl.ComCtrls,
  Vcl.Samples.Spin;

type
  TForm1 = class(TForm)
    SE1: TSpinEdit;
    Label1: TLabel;
    PC1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    SG1: TStringGrid;
    SG3: TStringGrid;
    Button1: TButton;
    Button2: TButton;
    SG2: TStringGrid;
    Label2: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure SE1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  // ������� 3 �������
  masA, masB, masC: array of integer;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var i, col: integer;
begin
  col := SE1.Value;
  // ������ ����������� �������
  SetLength(masA, col);
  // ������ ����������� �������
  SetLength(masB, col);
  // ������ ����������� �������
  SetLength(masC, col);
  // �������� ������ ������� ����� ������ ������� �����
  Randomize;
  // ��������� ������ ������
  for i := 0 to SE1.MaxValue-1 do
    begin
      SG1.Cells[i, 0] := '';
      SG2.Cells[i, 0] := '';
      SG3.Cells[i, 0] := '';
    end;
  // ��������� ���������� ������� � ����� ���������� �������
  for i := 0 to col-1 do
    begin
      masA[i] := Random(100) - 50;
      masB[i] := Random(100) - 50;
      SG1.Cells[i, 0] := IntToStr(masA[i]);
      SG2.Cells[i, 0] := IntToStr(masB[i]);
    end;
  // ������� ������������ �����
  Label2.Caption := '���������� ��������: ';
  // ������������ �� 1 ��������
  PC1.ActivePageIndex := 0;
  // ������ ������ ��������
  Button2.Enabled := True;
end;

procedure TForm1.Button2Click(Sender: TObject);
var i, col, max: integer;
begin
  // ����������� ���������� ����� ����������� ��������
  max := -MaxInt;
  col := Length(masA);
  // ��������� ������ �� ������� � ���������� ��� � ������ � � �����
  for i := 0 to col-1 do
    begin
      masC[i] := masA[i] + masB[i];
      SG3.Cells[i, 0] := IntToStr(masC[i]);
      // ������� ��������� ����� ����������� �����
      if (max < masC[i]) then
        max := masC[i];
    end;
  // ������� ������������ �����
  Label2.Caption := '���������� ��������: ' + IntToStr(max);
  // ������������ �� 2 ��������
  PC1.ActivePageIndex := 1;
  // ������ ������ �� ��������
  Button2.Enabled := False;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  // ������ ���������� �������� � ����� ����� 1 � 2
  SG1.ColCount := SE1.Value;
  SG2.ColCount := SE1.Value;
  SG3.ColCount := SE1.Value;
  // ������������ �� 1 ��������
  PC1.ActivePageIndex := 0;
end;

procedure TForm1.SE1Change(Sender: TObject);
begin
  // ������ ���������� �������� � ����� ����� 1 � 2
  SG1.ColCount := SE1.Value;
  SG2.ColCount := SE1.Value;
  SG3.ColCount := SE1.Value;
  // ������������ �� 1 ��������
  PC1.ActivePageIndex := 0;
end;

end.
