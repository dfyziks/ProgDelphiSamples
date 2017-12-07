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
  // выполняем перевод из строки в число с выводом места где произошла ошибка
  Val(LEx.Text, x, c1);
  // выполняем перевод из строки в число с выводом места где произошла ошибка
  Val(LEy.Text, y, c2);
  // выполняем перевод из строки в число с выводом места где произошла ошибка
  Val(LEz.Text, z, c3);
  // выполняем блок проверки
  // если коды ошибок не равны 0, то
  if (c1 <> 0) or (c2 <> 0) or (c3 <> 0) then
    begin
      // здесь написан блок для проверки на пустоту
      // если строка пустая, то
      if (LEx.Text = '') then
        begin
          // выводим сообщение об этом
          ShowMessage('Незаполнено поле: X');
          // передаем фокус на эту строку
          LEx.SetFocus;
          // прерываем выполнение кода
          exit;
        end
      else
        // если строка пустая, то
        if (LEy.Text = '') then
          begin
            // выводим сообщение об этом
            ShowMessage('Незаполнено поле: Y');
            // передаем фокус на эту строку
            LEy.SetFocus;
            // прерываем выполнение кода
            exit;
          end
        else
          // если строка пустая, то
          if (LEz.Text = '') then
            begin
              // выводим сообщение об этом
              ShowMessage('Незаполнено поле: Z');
              // передаем фокус на эту строку
              LEz.SetFocus;
              // прерываем выполнение кода
              exit;
            end;
      // выводим сообщение что произошла ошибка перевода
      ShowMessage('Возникла ошибка с переводом');
      // прерываем выполнение кода
      exit;
    end;
  // зануляем пременные
  a := 0;
  a1 := 0;
  b := 0;
  b1 := 0;
  // try finally нужен для безопасностного расчета
  //(блок try в нем выполняем расчет, а в блоке finally выполняем только при удачном выполнении try блока)
  try
    // try except нужен для безопасного проделования расчетов
    //(в блоке try выполняем расчеты, а если не удачно выполнился расчет, то выполняем то что в блоке except
    //в данном случае выводим тип ошибки)
    try
      // разделил переменную A на 2 куска (a, a1) для простоты понимания матиматики
      a1 := (8 + sqr(Abs(x - y)) + 1 / sqr(x) + sqr(y) + 2);
      a := Power(a1, 1 / 3);
      // разделил переменную B на 2 куска (b, b1) для простоты понимания матиматики
      b1 := Sqr(Tan(2 * z)) + 1;
      b := Exp(Abs(x - y)) * Power(b1, x);
    except
      on E: Exception do
        ShowMessage('Произошла ошибка с сообщением: ' + E.Message);
    end;
  finally
    // выводим результат расчетов
    La.Caption := 'A = ' + FloatToStr(a);
    Lb.Caption := 'B = ' + FloatToStr(b);
  end;
end;

procedure TForm1.LExKeyPress(Sender: TObject; var Key: Char);
var i: integer;
begin
  // если вводимый символ не в указанном множестве, то не даем ввести символ
  if not(key in ['0'..'9', '-', '.', #8]) then key := #0;
  // если вводимый символ "-" и строка непустая, то не даем ввести символ
  if (key = '-') and ((Sender as TLabeledEdit).Text <> '') then key := #0;
  // начинаем цикл от 1-го символа в строке до длины строки
  for i := 1 to Length((Sender as TLabeledEdit).Text) do
    // если вводимый символ "." и в строке попадается ".", то не даем ввести символ
    if ((Sender as TLabeledEdit).Text[i] = '.') and (key = '.') then key := #0;
end;

end.
