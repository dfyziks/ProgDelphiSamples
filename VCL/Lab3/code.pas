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
  // зануляем счетчики
  a := 0;
  b := 0;
  c := 0;
  // начинаем цикл от 1 до длины введеной строки
  for i := 1 to Length(LE1.Text) do
    // проходя по строке проверяем каждый элемент на соответствия ниже
    case LE1.Text[i] of
      // если совпадает символ "г" то к счетчиту +1
      'Г', 'г': inc(a);
      // если совпадает символ "д" то к счетчиту +1
      'Д', 'д': inc(b);
      // если совпадает символ "в" то к счетчиту +1
      'В', 'в': inc(c);
    end;
  // выводим в лейболы счетчики
  L1.Caption := 'Кол-во букв Г = ' + IntToStr(a);
  L2.Caption := 'Кол-во букв Д = ' + IntToStr(b);
  L3.Caption := 'Кол-во букв В = ' + IntToStr(c);
end;

end.
