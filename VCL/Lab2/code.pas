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
  // переменные для хранения ихнодного положения l-left t-top
  l, t: integer;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var dx, dy: integer;
begin
  // расчитываем шаг по X(общую ширину делим на 20 шагов)
  dx := Form1.ClientWidth div 20;
  // расчитываем шаг по Y(общую высоту делим на 20 шагов)
  dy := Form1.ClientHeight div 20;
  // если левая сторона больше шага по X и верхняя сторона больше шага по Y, то
  if (Button2.Left > dx) and (Button2.Top > dy) then
    begin
      // от левой стороны отнимаем шаг
      Button2.Left := Button2.Left - dx;
      // от верхней стороны отнимаем шаг
      Button2.Top := Button2.Top - dy;
    end
  // иначе возвращаем кнопку в исходное положение
  else
    begin
      Button2.Left := l;
      Button2.Top := t;
    end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  // записываем начальное положение кнопки по левой стороне
  l := Button2.Left;
  // записываем начальное положение кнопки по верхней стороне
  t := Button2.Top;
end;

procedure TForm1.FormResize(Sender: TObject);
begin
// перерасчет начального положения left при разтяжении кнопки(от общей ширины отнимаем ширину кнопки)
  l := Form1.ClientWidth - Button2.Width;
// перерасчет начального положения left при разтяжении кнопки(от общей высоты отнимаем высоту кнопки)
  t := Form1.ClientHeight - Button2.Height;
end;

end.
