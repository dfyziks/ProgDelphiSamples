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
    SG2: TStringGrid;
    Button1: TButton;
    Button2: TButton;
    Label2: TLabel;
    SE2: TSpinEdit;
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
  // создаем 2 массива
  masA, masB: array of array of integer;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var i, j, col, row: integer;
begin
  col := SE2.Value;
  row := SE1.Value;
  // задаем размерность массива
  SetLength(masA, row, col);
  // задаем размерность массива
  SetLength(masB, row, 1);
  // включаем данную команду чтобы рандом работал лучше
  Randomize;
  // выполняем чистку сеток
  for i := 0 to SE2.MaxValue-1 do
    for j := 0 to SE1.MaxValue-1 do
      begin
        SG1.Cells[i, j] := '';
        SG2.Cells[i, j] := '';
      end;
  // выполняем заполнения массива и сетки случайными числами
  for i := 0 to col-1 do
    for j := 0 to row-1 do
      begin
        masA[j, i] := Random(10) - 5;
        SG1.Cells[i, j] := IntToStr(masA[j, i]);
      end;
  // зануляем конечный массив
  for j := 0 to row-1 do
    begin
      masB[j, 0] := 0;
    end;
  // переключение на 1 страницу
  PC1.ActivePageIndex := 0;
  // делаем кнопку активной
  Button2.Enabled := True;
end;

procedure TForm1.Button2Click(Sender: TObject);
var i, j, col, row: integer;
begin
  col := Length(masA[0]);
  row := Length(masA);
  // выполняем расчет по заданию и записываем его в массив и в сетку
  for i := 0 to col-1 do
    for j := 0 to row-1 do
      begin
        masB[j, 0] := masB[j, 0] + masA[j, i];
        SG2.Cells[0, j] := IntToStr(masB[j, 0]);
      end;
  // переключение на 2 страницу
  PC1.ActivePageIndex := 1;
  // делаем кнопку не активной
  Button2.Enabled := False;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  // задаем количество слолбцов и строк у сеток
  SG1.ColCount := SE2.Value;
  SG2.ColCount := 1;
  SG1.RowCount := SE1.Value;
  SG2.RowCount := SE1.Value;
  // переключение на 1 страницу
  PC1.ActivePageIndex := 0;
end;

procedure TForm1.SE1Change(Sender: TObject);
begin
  // задаем количество слолбцов и строк у сеток
  SG1.ColCount := SE2.Value;
  SG2.ColCount := 1;
  SG1.RowCount := SE1.Value;
  SG2.RowCount := SE1.Value;
  // переключение на 1 страницу
  PC1.ActivePageIndex := 0;
end;

end.
