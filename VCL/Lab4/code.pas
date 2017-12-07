unit code;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Math;

type
  TForm1 = class(TForm)
    Button1: TButton;
    LEx: TLabeledEdit;
    LEy: TLabeledEdit;
    LEz: TLabeledEdit;
    La: TLabel;
    Lb: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure LExKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var a, a1, b, b1, x, y, z: extended;
    c1, c2, c3: integer;
begin
  // ��������� ������� �� ������ � ����� � ������� ����� ��� ��������� ������
  Val(LEx.Text, x, c1);
  // ��������� ������� �� ������ � ����� � ������� ����� ��� ��������� ������
  Val(LEy.Text, y, c2);
  // ��������� ������� �� ������ � ����� � ������� ����� ��� ��������� ������
  Val(LEz.Text, z, c3);
  // ��������� ���� ��������
  // ���� ���� ������ �� ����� 0, ��
  if (c1 <> 0) or (c2 <> 0) or (c3 <> 0) then
    begin
      // ����� ������� ���� ��� �������� �� �������
      // ���� ������ ������, ��
      if (LEx.Text = '') then
        begin
          // ������� ��������� �� ����
          ShowMessage('����������� ����: X');
          // �������� ����� �� ��� ������
          LEx.SetFocus;
          // ��������� ���������� ����
          exit;
        end
      else
        // ���� ������ ������, ��
        if (LEy.Text = '') then
          begin
            // ������� ��������� �� ����
            ShowMessage('����������� ����: Y');
            // �������� ����� �� ��� ������
            LEy.SetFocus;
            // ��������� ���������� ����
            exit;
          end
        else
          // ���� ������ ������, ��
          if (LEz.Text = '') then
            begin
              // ������� ��������� �� ����
              ShowMessage('����������� ����: Z');
              // �������� ����� �� ��� ������
              LEz.SetFocus;
              // ��������� ���������� ����
              exit;
            end;
      // ������� ��������� ��� ��������� ������ ��������
      ShowMessage('�������� ������ � ���������');
      // ��������� ���������� ����
      exit;
    end;
  // �������� ���������
  a := 0;
  a1 := 0;
  b := 0;
  b1 := 0;
  // try finally ����� ��� ��������������� �������
  //(���� try � ��� ��������� ������, � � ����� finally ��������� ������ ��� ������� ���������� try �����)
  try
    // try except ����� ��� ����������� ������������ ��������
    //(� ����� try ��������� �������, � ���� �� ������ ���������� ������, �� ��������� �� ��� � ����� except
    //� ������ ������ ������� ��� ������)
    try
      // �������� ���������� A �� 2 ����� (a, a1) ��� �������� ��������� ����������
      a1 := (8 + sqr(Abs(x - y)) + 1 / sqr(x) + sqr(y) + 2);
      a := Power(a1, 1 / 3);
      // �������� ���������� B �� 2 ����� (b, b1) ��� �������� ��������� ����������
      b1 := Sqr(Tan(2 * z)) + 1;
      b := Exp(Abs(x - y)) * Power(b1, x);
    except
      on E: Exception do
        ShowMessage('��������� ������ � ����������: ' + E.Message);
    end;
  finally
    // ������� ��������� ��������
    La.Caption := 'A = ' + FloatToStr(a);
    Lb.Caption := 'B = ' + FloatToStr(b);
  end;
end;

procedure TForm1.LExKeyPress(Sender: TObject; var Key: Char);
var i: integer;
begin
  // ���� �������� ������ �� � ��������� ���������, �� �� ���� ������ ������
  if not(key in ['0'..'9', '-', '.', #8]) then key := #0;
  // ���� �������� ������ "-" � ������ ��������, �� �� ���� ������ ������
  if (key = '-') and ((Sender as TLabeledEdit).Text <> '') then key := #0;
  // �������� ���� �� 1-�� ������� � ������ �� ����� ������
  for i := 1 to Length((Sender as TLabeledEdit).Text) do
    // ���� �������� ������ "." � � ������ ���������� ".", �� �� ���� ������ ������
    if ((Sender as TLabeledEdit).Text[i] = '.') and (key = '.') then key := #0;
end;

end.
