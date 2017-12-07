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
  // создаем 3 массива
  masA, masB, masC: array of integer;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var i, col: integer;
begin
  col := SE1.Value;
  // задаем размерность массива
  SetLength(masA, col);
  // задаем размерность массива
  SetLength(masB, col);
  // задаем размерность массива
  SetLength(masC, col);
  // включаем данную команду чтобы рандом работал лучше
  Randomize;
  // выполняем чистку сеткок
  for i := 0 to SE1.MaxValue-1 do
    begin
      SG1.Cells[i, 0] := '';
      SG2.Cells[i, 0] := '';
      SG3.Cells[i, 0] := '';
    end;
  // выполняем заполнения массива и сетки случайными числами
  for i := 0 to col-1 do
    begin
      masA[i] := Random(100) - 50;
      masB[i] := Random(100) - 50;
      SG1.Cells[i, 0] := IntToStr(masA[i]);
      SG2.Cells[i, 0] := IntToStr(masB[i]);
    end;
  // убираем максимальное число
  Label2.Caption := 'Наибольшее значение: ';
  // переключение на 1 страницу
  PC1.ActivePageIndex := 0;
  // делаем кнопку активной
  Button2.Enabled := True;
end;

procedure TForm1.Button2Click(Sender: TObject);
var i, col, max: integer;
begin
  // присваиваем переменной самое минимальное значение
  max := -MaxInt;
  col := Length(masA);
  // выполняем расчет по заданию и записываем его в массив и в сетку
  for i := 0 to col-1 do
    begin
      masC[i] := masA[i] + masB[i];
      SG3.Cells[i, 0] := IntToStr(masC[i]);
      // попутно выполняем поиск максимально числа
      if (max < masC[i]) then
        max := masC[i];
    end;
  // выводим максимальное число
  Label2.Caption := 'Наибольшее значение: ' + IntToStr(max);
  // переключение на 2 страницу
  PC1.ActivePageIndex := 1;
  // делаем кнопку не активной
  Button2.Enabled := False;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  // задаем количество слолбцов и строк сетки 1 и 2
  SG1.ColCount := SE1.Value;
  SG2.ColCount := SE1.Value;
  SG3.ColCount := SE1.Value;
  // переключение на 1 страницу
  PC1.ActivePageIndex := 0;
end;

procedure TForm1.SE1Change(Sender: TObject);
begin
  // задаем количество слолбцов и строк сетки 1 и 2
  SG1.ColCount := SE1.Value;
  SG2.ColCount := SE1.Value;
  SG3.ColCount := SE1.Value;
  // переключение на 1 страницу
  PC1.ActivePageIndex := 0;
end;

end.
