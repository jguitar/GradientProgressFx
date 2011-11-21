object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 279
  ClientWidth = 643
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object CheckBox1: TCheckBox
    Left = 8
    Top = 68
    Width = 97
    Height = 17
    Caption = 'CheckBox1'
    TabOrder = 0
    OnClick = CheckBox1Click
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 256
    Top = 56
  end
end
