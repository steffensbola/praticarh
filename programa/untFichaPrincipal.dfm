object frmFichaPrincipal: TfrmFichaPrincipal
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Organic PM - Ficha Funcional'
  ClientHeight = 348
  ClientWidth = 576
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 24
    Width = 329
    Height = 25
    Caption = 'ORGANIC PM - Ficha Funcional.'
    Color = clWindowText
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clTeal
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object MainMenu1: TMainMenu
    Left = 272
    Top = 144
    object Principal1: TMenuItem
      Caption = 'Principal'
    end
    object Manuteno1: TMenuItem
      Caption = 'Manuten'#231#227'o'
      object Colaboradores1: TMenuItem
        Caption = 'Colaboradores'
        OnClick = Colaboradores1Click
      end
      object ColabDependentes1: TMenuItem
        Caption = 'Colab. Dependentes'
        OnClick = ColabDependentes1Click
      end
      object ColabCargos1: TMenuItem
        Caption = 'Colab. Cargos'
        OnClick = ColabCargos1Click
      end
      object ColabSalarios1: TMenuItem
        Caption = 'Colab. Salarios'
        OnClick = ColabSalarios1Click
      end
      object ColabBenefcios1: TMenuItem
        Caption = 'Colab. Benef'#237'cios'
        OnClick = ColabBenefcios1Click
      end
      object ColabAfastamentos1: TMenuItem
        Caption = 'Colab. Afastamentos'
        OnClick = ColabAfastamentos1Click
      end
    end
    object Lanamentos1: TMenuItem
      Caption = 'Lan'#231'amentos'
      object AtributosdosColaboradores1: TMenuItem
        Caption = 'Atributos dos Colaboradores'
        OnClick = AtributosdosColaboradores1Click
      end
      object ContrataodeCadidatos1: TMenuItem
        Caption = 'Contrata'#231#227'o de Cadidatos'
        OnClick = ContrataodeCadidatos1Click
      end
    end
    object Relatrios1: TMenuItem
      Caption = 'Relat'#243'rios'
      object FichaFuncional1: TMenuItem
        Caption = 'Ficha Funcional'
        OnClick = FichaFuncional1Click
      end
    end
  end
end
