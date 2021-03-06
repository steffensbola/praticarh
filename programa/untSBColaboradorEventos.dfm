inherited frmSBColaboradorEvento: TfrmSBColaboradorEvento
  Caption = 
    'Associar o colaborador a seus eventos padr'#245'es da folha de pagame' +
    'nto'
  ClientHeight = 548
  Position = poDesigned
  ExplicitLeft = -20
  ExplicitWidth = 1043
  ExplicitHeight = 580
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Height = 548
    ExplicitHeight = 548
    inherited pgConsulta: TPageControl
      inherited tsVisualiza: TTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 985
        ExplicitHeight = 407
        inherited gridRegistros: TDBGrid
          Columns = <
            item
              Expanded = False
              FieldName = 'EVENTO_COD'
              Title.Caption = 'C'#243'digo'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TIPO'
              Title.Caption = 'Tipo'
              Width = 40
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCRICAO'
              Title.Caption = 'Evento'
              Width = 241
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PESSOA_COD'
              Title.Caption = 'Pessoa'
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOME'
              Title.Caption = 'Nome'
              Width = 389
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DATA_NASC'
              Title.Caption = 'Nascimento'
              Width = 247
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PESSOA_COD'
              Visible = False
            end>
        end
        inherited Panel2: TPanel
          inherited Label1: TLabel
            Left = 16
            Width = 150
            Caption = 'PESQUISA pelo evento:'
            ExplicitLeft = 16
            ExplicitWidth = 150
          end
          object Label5: TLabel [3]
            Left = 424
            Top = 13
            Width = 137
            Height = 13
            Caption = 'PESQUISA pelo nome'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Verdana'
            Font.Style = [fsBold]
            ParentFont = False
          end
          inherited edtPesquisa: TEdit
            Left = 16
            Width = 346
            OnChange = edtPesquisaChange
            ExplicitLeft = 16
            ExplicitWidth = 346
          end
          object Edit1: TEdit
            Left = 424
            Top = 32
            Width = 385
            Height = 21
            TabOrder = 1
            OnChange = Edit1Change
          end
        end
      end
      inherited tsManutencao: TTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 985
        ExplicitHeight = 407
        object Label2: TLabel
          Left = 3
          Top = 367
          Width = 302
          Height = 13
          Caption = '* Clique duplo para selecionar o colaborador na lista'
          FocusControl = btnCancel
        end
        object Label3: TLabel
          Left = 11
          Top = 386
          Width = 111
          Height = 13
          Caption = 'Selecionado agora:'
        end
        object Label4: TLabel
          Left = 128
          Top = 386
          Width = 4
          Height = 13
        end
        object LabeledEdit1: TLabeledEdit
          Left = 3
          Top = 24
          Width = 414
          Height = 21
          EditLabel.Width = 83
          EditLabel.Height = 13
          EditLabel.Caption = 'Buscar pessoa'
          TabOrder = 0
          OnChange = LabeledEdit1Change
        end
        object LabeledEdit2: TLabeledEdit
          Left = 448
          Top = 24
          Width = 505
          Height = 21
          EditLabel.Width = 88
          EditLabel.Height = 13
          EditLabel.Caption = 'Buscar eventos'
          TabOrder = 1
          OnChange = LabeledEdit2Change
        end
        object DBGrid1: TDBGrid
          Left = 3
          Top = 51
          Width = 414
          Height = 297
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 2
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Verdana'
          TitleFont.Style = []
          OnDblClick = DBGrid1DblClick
          Columns = <
            item
              Expanded = False
              FieldName = 'PESSOA_COD'
              Title.Caption = 'C'#243'digo'
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOME'
              Title.Caption = 'Nome'
              Width = 246
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DATA_NASC'
              Title.Caption = 'Nascimento'
              Width = 265
              Visible = True
            end>
        end
        object DBGrid2: TDBGrid
          Left = 448
          Top = 51
          Width = 505
          Height = 334
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 3
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Verdana'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'EVENTO_COD'
              Title.Caption = 'Evento'
              Width = 58
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TIPO'
              Title.Caption = 'Tipo'
              Width = 59
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCRICAO'
              Title.Caption = 'Descri'#231#227'o'
              Width = 361
              Visible = True
            end>
        end
      end
    end
    inherited btnNovo: TBitBtn
      Left = 18
      Top = 481
      ExplicitLeft = 18
      ExplicitTop = 481
    end
    inherited btnSalvar: TBitBtn
      Left = 191
      Top = 481
      OnClick = btnSalvarClick
      ExplicitLeft = 191
      ExplicitTop = 481
    end
    inherited btnEditar: TBitBtn
      Left = 354
      Top = 337
      Visible = False
      ExplicitLeft = 354
      ExplicitTop = 337
    end
    inherited btnExcluir: TBitBtn
      Left = 365
      Top = 481
      OnClick = btnExcluirClick
      ExplicitLeft = 365
      ExplicitTop = 481
    end
    inherited btnCancel: TBitBtn
      Left = 536
      Top = 481
      ExplicitLeft = 536
      ExplicitTop = 481
    end
  end
end
