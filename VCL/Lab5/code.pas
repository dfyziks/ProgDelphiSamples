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
  // очищаем график от предыдущей рисовки на нем
  Series1.Clear;
  // выполняем перевод из строки в число с выводом места где произошла ошибка
  Val(LExn.Text, xn, c1);
  // выполняем перевод из строки в число с выводом места где произошла ошибка
  Val(LExk.Text, xk, c2);
  // выполняем перевод из строки в число с выводом места где произошла ошибка
  Val(LEdx.Text, dx, c3);
  // выполняем блок проверки
  // если коды ошибок не равны 0, то
  if (c1 <> 0) or (c2 <> 0) or (c3 <> 0) then
    begin
      // здесь написан блок для проверки на пустоту
      // если строка пустая, то
      if (LExn.Text = '') then
        begin
          // выводим сообщение об этом
          ShowMessage('Незаполнено поле: Начало');
          // передаем фокус на эту строку
          LExn.SetFocus;
          // прерываем выполнение кода
          exit;
        end
      else
        if (LExk.Text = '') then
          begin
            // выводим сообщение об этом
            ShowMessage('Незаполнено поле: Конец');
            // передаем фокус на эту строку
            LExk.SetFocus;
            // прерываем выполнение кода
            exit;
          end
        else
          if (LEdx.Text = '') then
            begin
              // выводим сообщение об этом
              ShowMessage('Незаполнено поле: Шаг по оси X');
              // передаем фокус на эту строку
              LEdx.SetFocus;
              // прерываем выполнение кода
              exit;
            end;
      // выводим сообщение что произошла ошибка перевода
      ShowMessage('Возникла ошибка с переводом');
      // прерываем выполнение кода
      exit;
    end;
  // проверка на нулевой шаг
  if (dx = 0) then
    begin
      // выводим сообщение об этом
      ShowMessage('Шаг равен нулю');
      // прерываем выполнение кода
      exit;
    end
  else
    // проверка чтобы шаг был меньше интервала
    if ((Abs(xn) + Abs(xk)) < Abs(dx)) then
      begin
        // выводим сообщение об этом
        ShowMessage('Шаг больше интервала');
        // прерываем выполнение кода
        exit;
      end
    else
      // проверка на соответствие шага интервалу
      //(от большего к меньшему, то шаг отрицательный)(от меньшего к большему, то шаг положительный)
      if ((xn < xk) and (dx < 0)) or ((xn > xk) and (dx > 0)) then
        begin
          // выводим сообщение об этом
          ShowMessage('Шаг не в ту сторону');
          // прерываем выполнение кода
          exit;
        end;
  // если начало меньше конца, то выполняем эту часть
  if (xn < xk) then
    while (xn <= xk) do
      begin
        // try except нужен для безопасного проделования расчетов
        //(в блоке try выполняем расчеты, а если не удачно выполнился расчет, то выполняем то что в блоке except
        //в данном случае выводим тип ошибки)
        try
          // выполняем проверочный расчет
          y := y1(xn);
        except
          // шагаем дальше
          xn := xn + dx;
          // пропускаем 1 итерацию цикла
          Continue;
        end;
        // призваиваем переменной y результат выполнения функции
        y := y1(xn);
        // добавляем на график точку с координатами xn, y
        Series1.AddXY(xn, y, '', clRed);
        // шагаем дальше
        xn := xn + dx;
      end
  else
    // а если наоборот начало больше конца, то выполняем эту часть
    if (xn > xk) then
      while (xn >= xk) do
        begin
          // try except нужен для безопасного проделования расчетов
          //(в блоке try выполняем расчеты, а если не удачно выполнился расчет, то выполняем то что в блоке except
          //в данном случае выводим тип ошибки)
          try
            // выполняем проверочный расчет
            y := y1(xn);
          except
            // шагаем дальше
            xn := xn + dx;
            // пропускаем 1 итерацию цикла
            Continue;
          end;
          // призваиваем переменной y результат выполнения функции
          y := y1(xn);
          // добавляем на график точку с координатами xn, y
          Series1.AddXY(xn, y, '', clRed);
          // шагаем дальше
          xn := xn + dx;
        end;
end;

procedure TForm1.LExnKeyPress(Sender: TObject; var Key: Char);
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
// функция в которой выполняются расчеты по заданию
function TForm1.y1(x: extended): extended;
begin
  if (x >= 1) then Result := Power(Cos(x), 4);
  if (x <= -1) then Result := Power(Sin(x), 5);
  if (x > -1) and (x < 1) then Result := 1;
end;

end.
