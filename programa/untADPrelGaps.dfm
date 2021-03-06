object FRMGAPS: TFRMGAPS
  Left = 0
  Top = 0
  Caption = 'Relat'#243'rio de Gaps '
  ClientHeight = 448
  ClientWidth = 913
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 8
    Width = 107
    Height = 13
    Caption = 'Colaborador Avaliado:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 368
    Top = 8
    Width = 92
    Height = 13
    Caption = 'Cargo do Avaliado:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lblcargo: TLabel
    Left = 466
    Top = 8
    Width = 3
    Height = 13
  end
  object Label3: TLabel
    Left = 16
    Top = 315
    Width = 241
    Height = 13
    Caption = 'Compet'#234'ncias com m'#233'dia acima da nota da fun'#231#227'o'
  end
  object edtPessoa: TEdit
    Left = 16
    Top = 27
    Width = 337
    Height = 21
    TabOrder = 0
    OnChange = edtPessoaChange
  end
  object gridNomes: TDBGrid
    Left = 16
    Top = 51
    Width = 337
    Height = 115
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'PESSOA_COD'
        Title.Caption = 'C'#243'digo'
        Width = 44
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME'
        Title.Caption = 'Nome'
        Width = 167
        Visible = True
      end>
  end
  object btnBuscar: TButton
    Left = 16
    Top = 175
    Width = 114
    Height = 25
    Caption = 'Buscar Avalia'#231#245'es'
    TabOrder = 2
    OnClick = btnBuscarClick
  end
  object listDatas: TDBLookupComboBox
    Left = 136
    Top = 178
    Width = 136
    Height = 21
    KeyField = 'AVALIACAO_DATA'
    ListField = 'AVALIACAO_DATA'
    TabOrder = 3
  end
  object Button1: TButton
    Left = 278
    Top = 175
    Width = 75
    Height = 25
    Caption = 'Carregar'
    TabOrder = 4
    OnClick = Button1Click
  end
  object gridCHA: TDBGrid
    Left = 16
    Top = 206
    Width = 337
    Height = 99
    TabOrder = 5
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'DESCRICAO'
        Title.Caption = 'Compet'#234'ncia (CHA)'
        Width = 117
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOTA_CARGO'
        Title.Caption = 'Fun'#231#227'o'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MEDIA'
        Title.Caption = 'M'#233'dia'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GAP'
        Visible = True
      end>
  end
  object DBChart1: TDBChart
    Left = 368
    Top = 27
    Width = 521
    Height = 406
    Title.Text.Strings = (
      'Gaps das Compet'#234'ncias para Fun'#231#227'o')
    View3DOptions.Elevation = 315
    View3DOptions.Orthogonal = False
    View3DOptions.Perspective = 0
    View3DOptions.Rotation = 360
    TabOrder = 6
    object Series1: TBarSeries
      ColorEachPoint = True
      Marks.Callout.Brush.Color = clBlack
      Marks.Visible = True
      Gradient.Direction = gdTopBottom
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Bar'
      YValues.Order = loNone
    end
  end
  object grid2: TDBGrid
    Left = 16
    Top = 334
    Width = 337
    Height = 99
    TabOrder = 7
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'DESCRICAO'
        Title.Caption = 'Compet'#234'ncia (CHA)'
        Width = 117
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOTA_CARGO'
        Title.Caption = 'Fun'#231#227'o'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MEDIA'
        Title.Caption = 'M'#233'dia'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GAP'
        Visible = True
      end>
  end
end
