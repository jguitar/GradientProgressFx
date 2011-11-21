unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, UGradientProgressFx;

type
  TForm1 = class(TForm)
    Timer1: TTimer;
    CheckBox1: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
  private
    FGradient: TGradientProgressFx;
  end;

var
  Form1: TForm1;

implementation

uses
  Math;

{$R *.dfm}

procedure TForm1.CheckBox1Click(Sender: TObject);
begin
  Timer1.Enabled := CheckBox1.Checked;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Timer1.Enabled := False;
  Timer1.Interval := 30;
  FGradient := TGradientProgressFx.Create(Canvas, clRed, clLime, Width)
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  FGradient.Free;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  FGradient.Offset := FGradient.Offset + 15;
  FGradient.Paint;
end;

end.
