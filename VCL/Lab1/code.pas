unit code;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
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
begin
  Application.MessageBox('Вы нажали на кнопку', 'Сообщение', MB_OK);
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  MessageDlg('Закрываем форму', mtInformation, mbOKCancel, 1);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  ShowMessage('Форма создалась');
end;

end.
