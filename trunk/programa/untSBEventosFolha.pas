unit untSBEventosFolha;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, untModelo, StdCtrls, Buttons, Grids, DBGrids, ComCtrls, ExtCtrls;

type
  TfrmSBEventosFolha = class(TfrmModelo)
    gridFolha: TDBGrid;
    gridFixos: TDBGrid;
    valorFinal: TLabeledEdit;
    gridVeriaveis: TDBGrid;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    procedure FormShow(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure gridRegistrosDblClick(Sender: TObject);
    procedure gridFolhaDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSBEventosFolha: TfrmSBEventosFolha;

implementation

uses uClassFuncoesGerais, uClassGE_COLABORADORES,
  uClassFP_COLABORADOR_BENEFICIOS, uClassSB_FOLHA_PAGAMENTO,
  uClassSB_EVENTOS_FOLHA;

{$R *.dfm}

procedure TfrmSBEventosFolha.btnNovoClick(Sender: TObject);
var
  UTILS: TuClassFuncoesGerais;
  FOLHA: TuClassSB_FOLHA_PAGAMENTO;
begin
  inherited;
  try
    UTILS:= TuClassFuncoesGerais.Create;  
    UTILS.GravaLog('Visualizou os detalhes da folha de pagamento j� processada');
    FOLHA:= TuClassSB_FOLHA_PAGAMENTO.Create;

    gridFolha.DataSource:= FOLHA.Consultar('SB_FOLHA_PAGAMENTO.PESSOA_COD = '+gridRegistros.Columns[0].Field.AsString);
    Label4.Caption:= 'Folhas de pagamento de:'+ gridRegistros.Columns[1].Field.AsString;

   
  finally
    UTILS.Free;
    FOLHA.Free;
  end;

end;

procedure TfrmSBEventosFolha.FormShow(Sender: TObject);
var
  UTILS: TuClassFuncoesGerais;
  COLAB: TuClassGE_COLABORADORES;
begin
  inherited;
  try
    UTILS:= TuClassFuncoesGerais.Create;  
    UTILS.GravaLog('Acesso a de visualiza��o dos eventos de uma folha de pagamento (j� processada)');    
     COLAB:= TuClassGE_COLABORADORES.Create;
     gridRegistros.DataSource:= COLAB.ConsultaPessoaColaborador('');
  finally
    UTILS.Free;
    COLAB.Free;
  end;

end;

procedure TfrmSBEventosFolha.gridFolhaDblClick(Sender: TObject);
var
  FOLHA: TuClassSB_FOLHA_PAGAMENTO;
  FIXOS: TuClassFP_COLABORADOR_BENEFICIOS;
  EVENTOS: TuClassSB_EVENTOS_FOLHA;
begin
  inherited;
  try
    FOLHA:= TuClassSB_FOLHA_PAGAMENTO.Create;
    FIXOS:= TuClassFP_COLABORADOR_BENEFICIOS.Create;
    EVENTOS:= TuClassSB_EVENTOS_FOLHA.Create;

    FOLHA.PFOL_PAG_COD:= gridFolha.Columns[0].Field.AsString;
    FOLHA.Carregar;

    valorFinal.Text:= FOLHA.PTOTAL_REMUNERACAO;

    
    // consulta os eventos fixos deste intervalo de datas



    // os eventos desta folha
    gridVeriaveis.DataSource:= EVENTOS.Consultar('SB_EVENTOS_FOLHA.FOL_PAG_COD = '+ FOLHA.PFOL_PAG_COD
                                                +' and SB_EVENTOS_FOLHA.PESSOA_COD = '+gridRegistros.Columns[0].Field.AsString);

    
  finally
    FOLHA.Free;
    FIXOS.Free;
    EVENTOS.Free;
  end;
end;

procedure TfrmSBEventosFolha.gridRegistrosDblClick(Sender: TObject);
begin
  inherited;
  btnNovo.Click;
end;

end.
