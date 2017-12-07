unit code;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    LE1: TLabeledEdit;
    L1: TLabel;
    L2: TLabel;
    L3: TLabel;
    procedure Button1Click(Sender: TObject);
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
var i, a, b, c: integer;
begin
  // �������� ��������
  a := 0;
  b := 0;
  c := 0;
  // �������� ���� �� 1 �� ����� �������� ������
  for i := 1 to Length(LE1.Text) do
    // ������� �� ������ ��������� ������ ������� �� ������������ ����
    case LE1.Text[i] of
      // ���� ��������� ������ "�" �� � �������� +1
      '�', '�': inc(a);
      // ���� ��������� ������ "�" �� � �������� +1
      '�', '�': inc(b);
      // ���� ��������� ������ "�" �� � �������� +1
      '�', '�': inc(c);
    end;
  // ������� � ������� ��������
  L1.Caption := '���-�� ���� � = ' + IntToStr(a);
  L2.Caption := '���-�� ���� � = ' + IntToStr(b);
  L3.Caption := '���-�� ���� � = ' + IntToStr(c);
end;

end.
