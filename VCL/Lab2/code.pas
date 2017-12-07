unit code;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  // ���������� ��� �������� ��������� ��������� l-left t-top
  l, t: integer;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var dx, dy: integer;
begin
  // ����������� ��� �� X(����� ������ ����� �� 20 �����)
  dx := Form1.ClientWidth div 20;
  // ����������� ��� �� Y(����� ������ ����� �� 20 �����)
  dy := Form1.ClientHeight div 20;
  // ���� ����� ������� ������ ���� �� X � ������� ������� ������ ���� �� Y, ��
  if (Button2.Left > dx) and (Button2.Top > dy) then
    begin
      // �� ����� ������� �������� ���
      Button2.Left := Button2.Left - dx;
      // �� ������� ������� �������� ���
      Button2.Top := Button2.Top - dy;
    end
  // ����� ���������� ������ � �������� ���������
  else
    begin
      Button2.Left := l;
      Button2.Top := t;
    end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  // ���������� ��������� ��������� ������ �� ����� �������
  l := Button2.Left;
  // ���������� ��������� ��������� ������ �� ������� �������
  t := Button2.Top;
end;

procedure TForm1.FormResize(Sender: TObject);
begin
// ���������� ���������� ��������� left ��� ���������� ������(�� ����� ������ �������� ������ ������)
  l := Form1.ClientWidth - Button2.Width;
// ���������� ���������� ��������� left ��� ���������� ������(�� ����� ������ �������� ������ ������)
  t := Form1.ClientHeight - Button2.Height;
end;

end.
