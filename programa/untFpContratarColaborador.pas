unit untFpContratarColaborador;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBCtrls, StdCtrls, ExtCtrls, Grids, DBGrids, Menus;

type
  TfrmFpContratarColaborador = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    lkpProcessoSeletivo: TDBLookupComboBox;
    Label2: TLabel;
    gridCandidatos: TDBGrid;
    PopupMenu1: TPopupMenu;
    Editar1: TMenuItem;
    procedure FormShow(Sender: TObject);
    procedure lkpProcessoSeletivoClick(Sender: TObject);
    procedure Editar1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFpContratarColaborador: TfrmFpContratarColaborador;

implementation

uses uClassFuncoesGerais, untFpCadColaborador;

{$R *.dfm}

procedure TfrmFpContratarColaborador.Editar1Click(Sender: TObject);
begin
  frmFpCadColaborador := TfrmFpCadColaborador.Create(Self);
  frmFpCadColaborador.pPessoaCod := gridCandidatos.Columns[0].Field.Value;
  frmFpCadColaborador.pProcessoCod := lkpProcessoSeletivo.KeyValue;
  frmFpCadColaborador.ShowModal;
end;

procedure TfrmFpContratarColaborador.FormShow(Sender: TObject);
var
  GERAL: TuClassFuncoesGerais;
begin
  GERAL := TuClassFuncoesGerais.Create;
  try
    lkpProcessoSeletivo.ListSource := GERAL.BuscaProcessoSeletivo(' status = ''finalizado'' ');
  finally
    GERAL.Free;
  end;
end;

procedure TfrmFpContratarColaborador.lkpProcessoSeletivoClick(Sender: TObject);
var
  GERAL: TuClassFuncoesGerais;
begin
  GERAL := TuClassFuncoesGerais.Create;
  try
    gridCandidatos.DataSource := GERAL.BuscaCandidatosProcessSel(lkpProcessoSeletivo.KeyValue,'classificado'); 
  finally
    GERAL.Free;
  end;
end;

end.
