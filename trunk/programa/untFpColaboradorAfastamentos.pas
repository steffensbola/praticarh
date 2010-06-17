unit untFpColaboradorAfastamentos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, untModelo, StdCtrls, Buttons, Grids, DBGrids, ComCtrls, ExtCtrls,
  DBCtrls;

type
  TfrmFpColaboradorAfastamentos = class(TfrmModelo)
    Label2: TLabel;
    lkpColaborador: TDBLookupComboBox;
    Label3: TLabel;
    edtMotivo: TEdit;
    Label4: TLabel;
    dtpDataIni: TDateTimePicker;
    dtpDataFim: TDateTimePicker;
    Label5: TLabel;
    rgAtestado: TRadioGroup;
    Label6: TLabel;
    edtHoraInicial: TEdit;
    Label7: TLabel;
    edtHoraFinal: TEdit;
    procedure btnSalvarClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFpColaboradorAfastamentos: TfrmFpColaboradorAfastamentos;

implementation

uses uClassFP_COLABORADOR_AFASTAMENTOS, uClassGE_COLABORADORES;

{$R *.dfm}

procedure TfrmFpColaboradorAfastamentos.btnEditarClick(Sender: TObject);
var
  COLABAFASTAMENTO: TuClassFP_COLABORADOR_AFASTAMENTOS;
begin
  inherited;
  COLABAFASTAMENTO := TuClassFP_COLABORADOR_AFASTAMENTOS.Create;
  try
    COLABAFASTAMENTO.PCOL_AFA_COD := gridRegistros.Columns[0].Field.Value;
    COLABAFASTAMENTO.Carregar;

    lkpColaborador.KeyValue := COLABAFASTAMENTO.PPESSOA_COD;
    edtMotivo.Text := COLABAFASTAMENTO.PMOTIVO;
    dtpDataIni.Date := StrToDate(COLABAFASTAMENTO.PDATA_INICIAL);
    dtpDataFim.Date := StrToDate(COLABAFASTAMENTO.PDATA_FINAL);
    edtHoraInicial.Text := COLABAFASTAMENTO.PHORA_INICIAL;
    edtHoraFinal.Text := COLABAFASTAMENTO.PHORA_FINAL;

    if COLABAFASTAMENTO.PATESTADO_MEDICO = 'S' then
      rgAtestado.ItemIndex := 0
    else
      rgAtestado.ItemIndex := 1;   

  finally
    COLABAFASTAMENTO.Free;
  end;
end;

procedure TfrmFpColaboradorAfastamentos.btnExcluirClick(Sender: TObject);
var
  COLABAFASTAMENTO: TuClassFP_COLABORADOR_AFASTAMENTOS;
begin
  inherited;
  if (MessageDlg('Excluir Registro?',mtConfirmation,[mbYes,mbNo],0) = mrYes) then
    begin
      COLABAFASTAMENTO := TuClassFP_COLABORADOR_AFASTAMENTOS.Create;
      try
        COLABAFASTAMENTO.PCOL_AFA_COD := gridRegistros.Columns[0].Field.Value;
        COLABAFASTAMENTO.Excluir;
        gridRegistros.DataSource := COLABAFASTAMENTO.Consultar('');
      finally
        COLABAFASTAMENTO.Free;
      end;
    end;
end;

procedure TfrmFpColaboradorAfastamentos.btnSalvarClick(Sender: TObject);
var
  COLABAFASTAMENTO: TuClassFP_COLABORADOR_AFASTAMENTOS;
begin
  inherited;
  COLABAFASTAMENTO := TuClassFP_COLABORADOR_AFASTAMENTOS.Create;
  try
    if lblModo1.Caption = 'Inserindo' then
      begin
        COLABAFASTAMENTO.PPESSOA_COD := lkpColaborador.KeyValue;
        COLABAFASTAMENTO.PMOTIVO := edtMotivo.Text;
        COLABAFASTAMENTO.PDATA_INICIAL := FormatDateTime('dd/MM/yyyy',dtpDataIni.Date);
        COLABAFASTAMENTO.PDATA_FINAL := FormatDateTime('dd/MM/yyyy',dtpDataFim.Date);
        COLABAFASTAMENTO.PHORA_INICIAL := edtHoraInicial.Text;
        COLABAFASTAMENTO.PHORA_FINAL := edtHoraFinal.Text;
        if rgAtestado.ItemIndex = 0 then
          COLABAFASTAMENTO.PATESTADO_MEDICO := 'S'
        else
          COLABAFASTAMENTO.PATESTADO_MEDICO := 'N';

        if COLABAFASTAMENTO.Salvar then
          begin
            lblModo1.Caption := 'Listando';
            tsVisualiza.Show;
            gridRegistros.DataSource := COLABAFASTAMENTO.Consultar('');
          end
        else
          ShowMessage('Falha!');

      end
    else if lblModo1.Caption = 'Editando' then
      begin
        COLABAFASTAMENTO.PPESSOA_COD := lkpColaborador.KeyValue;
        COLABAFASTAMENTO.PMOTIVO := edtMotivo.Text;
        COLABAFASTAMENTO.PDATA_INICIAL := FormatDateTime('dd/MM/yyyy',dtpDataIni.Date);
        COLABAFASTAMENTO.PDATA_FINAL := FormatDateTime('dd/MM/yyyy',dtpDataFim.Date);
        COLABAFASTAMENTO.PHORA_INICIAL := edtHoraInicial.Text;
        COLABAFASTAMENTO.PHORA_FINAL := edtHoraFinal.Text;        
        if rgAtestado.ItemIndex = 0 then
          COLABAFASTAMENTO.PATESTADO_MEDICO := 'S'
        else
          COLABAFASTAMENTO.PATESTADO_MEDICO := 'N';
        COLABAFASTAMENTO.PCOL_AFA_COD := gridRegistros.Columns[0].Field.Value;

        if COLABAFASTAMENTO.Editar then
          begin
            lblModo1.Caption := 'Listando';
            tsVisualiza.Show;
            gridRegistros.DataSource := COLABAFASTAMENTO.Consultar('');
          end;
      end;
  finally
    COLABAFASTAMENTO.Free;
  end;
end;

procedure TfrmFpColaboradorAfastamentos.FormShow(Sender: TObject);
var
  COLABAFASTAMENTO: TuClassFP_COLABORADOR_AFASTAMENTOS;
  COLABORADOR: TuClassGE_COLABORADORES;
begin
  inherited;
  COLABAFASTAMENTO := TuClassFP_COLABORADOR_AFASTAMENTOS.Create;
  COLABORADOR := TuClassGE_COLABORADORES.Create;
  try
    lkpColaborador.ListSource := COLABORADOR.ConsultaPessoaColaborador('GE_COLABORADORES.STATUS = ''A'' ');

    gridRegistros.DataSource := COLABAFASTAMENTO.Consultar('');

  finally
    COLABAFASTAMENTO.Free;
    COLABORADOR.Free;
  end;
end;

end.
