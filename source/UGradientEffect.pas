unit UGradientEffect;

interface

uses
  Graphics, Windows;

type
  TGradientEffect = class(TObject)
  private
    R1, R2, G1, G2, B1, B2: Byte;
    R, G, B: Extended;
    FEndColor: TColor;
    FStartColor: TColor;
    FWidth: Integer;
    FOffset: Integer;
    FCanvas: TCanvas;
    function GetColorOffset(AOffset: Integer): TColor;
    procedure SetData;
    procedure Turn;
  public
    constructor Create(ACanvas: TCanvas; const AStartColor, AEndColor: TColor;
      const AWidth: Integer);

    procedure Paint;

    property StartColor: TColor read FStartColor write FStartColor;
    property EndColor: TColor read FEndColor write FEndColor;
    property Offset: Integer read FOffset write FOffset;
  end;

implementation

uses
  Math;

{ TGradientEffect }

constructor TGradientEffect.Create(ACanvas: TCanvas; const AStartColor,
  AEndColor: TColor; const AWidth: Integer);
begin
  inherited Create;

  FStartColor := AStartColor;
  FEndColor := AEndColor;
  FWidth := AWidth;
  FCanvas := ACanvas;

  SetData;
end;

function TGradientEffect.GetColorOffset(AOffset: Integer): TColor;
begin
  Result :=
    RGB(R1 + Ceil(R * AOffset),
        G1 + Ceil(G * AOffset),
        B1 + Ceil(B * AOffset));
end;

procedure TGradientEffect.Paint;
var
  i: Integer;
  j: Integer;
  c: TColor;
  PreviousColor: TColor;
begin
  if FOffset >= FWidth then
  begin
    FOffset := 0;
    Turn;
  end;

  PreviousColor := StartColor;
  try
    for i := 0 to FWidth - 1 do
    begin
      c := GetColorOffset(FOffset);
      for j := 0 to 5 - 1 do
        FCanvas.Pixels[i, j] := c;
      Inc(FOffset);

      if FOffset >= FWidth then
      begin
        FOffset := 0;
        Turn;
      end;
    end;
  finally
    if (StartColor <> PreviousColor) then
      Turn;
  end; 
end;

procedure TGradientEffect.SetData;
begin
  R1 := GetRValue(FStartColor);
  G1 := GetGValue(FStartColor);
  B1 := GetBValue(FStartColor);

  R2 := GetRValue(FEndColor);
  G2 := GetGValue(FEndColor);
  B2 := GetBValue(FEndColor);

  R := (R2 - R1) / FWidth;
  G := (G2 - G1) / FWidth;
  B := (B2 - B1) / FWidth;
end;

procedure TGradientEffect.Turn;
var
  c: TColor;
begin
  c := StartColor;
  StartColor := EndColor;
  EndColor := c;
  SetData;
end;

end.
