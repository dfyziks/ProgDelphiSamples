unit code;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, VclTee.TeeGDIPlus,
  Vcl.ExtCtrls, VCLTee.TeEngine, VCLTee.Series, VCLTee.TeeProcs, VCLTee.Chart, Math;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Chart1: TChart;
    Series1: TLineSeries;
    LExn: TLabeledEdit;
    LExk: TLabeledEdit;
    LEdx: TLabeledEdit;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure LExnKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    function y1(x: extended): extended;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var xn, xk, dx, y: extended;
    c1, c2, c3: integer;
begin
  // ������� ������ �� ���������� ������� �� ���
  Series1.Clear;
  // ��������� ������� �� ������ � ����� � ������� ����� ��� ��������� ������
  Val(LExn.Text, xn, c1);
  // ��������� ������� �� ������ � ����� � ������� ����� ��� ��������� ������
  Val(LExk.Text, xk, c2);
  // ��������� ������� �� ������ � ����� � ������� ����� ��� ��������� ������
  Val(LEdx.Text, dx, c3);
  // ��������� ���� ��������
  // ���� ���� ������ �� ����� 0, ��
  if (c1 <> 0) or (c2 <> 0) or (c3 <> 0) then
    begin
      // ����� ������� ���� ��� �������� �� �������
      // ���� ������ ������, ��
      if (LExn.Text = '') then
        begin
          // ������� ��������� �� ����
          ShowMessage('����������� ����: ������');
          // �������� ����� �� ��� ������
          LExn.SetFocus;
          // ��������� ���������� ����
          exit;
        end
      else
        if (LExk.Text = '') then
          begin
            // ������� ��������� �� ����
            ShowMessage('����������� ����: �����');
            // �������� ����� �� ��� ������
            LExk.SetFocus;
            // ��������� ���������� ����
            exit;
          end
        else
          if (LEdx.Text = '') then
            begin
              // ������� ��������� �� ����
              ShowMessage('����������� ����: ��� �� ��� X');
              // �������� ����� �� ��� ������
              LEdx.SetFocus;
              // ��������� ���������� ����
              exit;
            end;
      // ������� ��������� ��� ��������� ������ ��������
      ShowMessage('�������� ������ � ���������');
      // ��������� ���������� ����
      exit;
    end;
  // �������� �� ������� ���
  if (dx = 0) then
    begin
      // ������� ��������� �� ����
      ShowMessage('��� ����� ����');
      // ��������� ���������� ����
      exit;
    end
  else
    // �������� ����� ��� ��� ������ ���������
    if ((Abs(xn) + Abs(xk)) < Abs(dx)) then
      begin
        // ������� ��������� �� ����
        ShowMessage('��� ������ ���������');
        // ��������� ���������� ����
        exit;
      end
    else
      // �������� �� ������������ ���� ���������
      //(�� �������� � ��������, �� ��� �������������)(�� �������� � ��������, �� ��� �������������)
      if ((xn < xk) and (dx < 0)) or ((xn > xk) and (dx > 0)) then
        begin
          // ������� ��������� �� ����
          ShowMessage('��� �� � �� �������');
          // ��������� ���������� ����
          exit;
        end;
  // ���� ������ ������ �����, �� ��������� ��� �����
  if (xn < xk) then
    while (xn <= xk) do
      begin
        // try except ����� ��� ����������� ������������ ��������
        //(� ����� try ��������� �������, � ���� �� ������ ���������� ������, �� ��������� �� ��� � ����� except
        //� ������ ������ ������� ��� ������)
        try
          // ��������� ����������� ������
          y := y1(xn);
        except
          // ������ ������
          xn := xn + dx;
          // ���������� 1 �������� �����
          Continue;
        end;
        // ����������� ���������� y ��������� ���������� �������
        y := y1(xn);
        // ��������� �� ������ ����� � ������������ xn, y
        Series1.AddXY(xn, y, '', clRed);
        // ������ ������
        xn := xn + dx;
      end
  else
    // � ���� �������� ������ ������ �����, �� ��������� ��� �����
    if (xn > xk) then
      while (xn >= xk) do
        begin
          // try except ����� ��� ����������� ������������ ��������
          //(� ����� try ��������� �������, � ���� �� ������ ���������� ������, �� ��������� �� ��� � ����� except
          //� ������ ������ ������� ��� ������)
          try
            // ��������� ����������� ������
            y := y1(xn);
          except
            // ������ ������
            xn := xn + dx;
            // ���������� 1 �������� �����
            Continue;
          end;
          // ����������� ���������� y ��������� ���������� �������
          y := y1(xn);
          // ��������� �� ������ ����� � ������������ xn, y
          Series1.AddXY(xn, y, '', clRed);
          // ������ ������
          xn := xn + dx;
        end;
end;

procedure TForm1.LExnKeyPress(Sender: TObject; var Key: Char);
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
// ������� � ������� ����������� ������� �� �������
function TForm1.y1(x: extended): extended;
begin
  if (x >= 1) then Result := Power(Cos(x), 4);
  if (x <= -1) then Result := Power(Sin(x), 5);
  if (x > -1) and (x < 1) then Result := 1;
end;

end.
