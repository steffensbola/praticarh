unit untGeColaboradores;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, untModelo, StdCtrls, Buttons, Grids, DBGrids, ComCtrls, ExtCtrls,
  DBCtrls, ExtDlgs;

type
  TfrmGeColaboradores = class(TfrmModelo)
    Label2: TLabel;
    edtNome: TEdit;
    Label3: TLabel;
    edtEndereco: TEdit;
    Label4: TLabel;
    edtMail1: TEdit;
    Label5: TLabel;
    edtNaturalidade: TEdit;
    Label6: TLabel;
    Label7: TLabel;
    edtCpf: TEdit;
    Label8: TLabel;
    edtBairro: TEdit;
    Label9: TLabel;
    edtMail2: TEdit;
    Label10: TLabel;
    edtCidade: TEdit;
    Label11: TLabel;
    edtCep: TEdit;
    Label12: TLabel;
    edtPais: TEdit;
    Label13: TLabel;
    edtNumero: TEdit;
    dtpDataNasc: TDateTimePicker;
    Label14: TLabel;
    lkpUnidFederat: TDBLookupComboBox;
    Label15: TLabel;
    edtComplemento: TEdit;
    Label16: TLabel;
    lkpEstadoCivil: TDBLookupComboBox;
    Label17: TLabel;
    edtCnh: TEdit;
    Label18: TLabel;
    edtGrupoSan: TEdit;
    Label19: TLabel;
    edtBanco: TEdit;
    Label20: TLabel;
    dtpDataAdmissao: TDateTimePicker;
    Label21: TLabel;
    dtpDataDemissao: TDateTimePicker;
    Label22: TLabel;
    edtAgencia: TEdit;
    Label23: TLabel;
    edtContaCorrente: TEdit;
    Label24: TLabel;
    edtObs: TEdit;
    Label25: TLabel;
    SpeedButton1: TSpeedButton;
    Image1: TImage;
    OpenPictureDialog1: TOpenPictureDialog;
    CheckBox1: TCheckBox;
    rgSexo: TRadioGroup;
    procedure FormShow(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure gridRegistrosDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGeColaboradores: TfrmGeColaboradores;
  CaminhoFoto:string;
  SelecionouImagem:Boolean;

implementation

uses uClassGE_ESTADOS_CIVIS, uClassGE_UNIDADES_FEDERATIVAS, uClassGE_PESSOAS,
  uClassGE_COLABORADORES, uClassFuncoesGerais;

{$R *.dfm}

procedure TfrmGeColaboradores.btnEditarClick(Sender: TObject);
var
  PESSOA: TuClassGE_PESSOAS;
  COLABORADOR: TuClassGE_COLABORADORES;
begin
  inherited;
  PESSOA := TuClassGE_PESSOAS.Create;
  COLABORADOR := TuClassGE_COLABORADORES.Create;
  try
    PESSOA.PPESSOA_COD := gridRegistros.Columns[0].Field.Value;
    PESSOA.Carregar;
    edtNome.Text := PESSOA.PNOME;
    edtEndereco.Text := PESSOA.PENDERECO;
    edtMail1.Text := PESSOA.PEMAIL_1;
    edtNaturalidade.Text := PESSOA.PNATURALIDADE;
    edtCpf.Text := PESSOA.PCPF;
    edtBairro.Text := PESSOA.PBAIRRO;
    edtMail2.Text := PESSOA.PEMAIL_2;
    edtCidade.Text := PESSOA.PCIDADE;
    edtCep.Text := PESSOA.PCEP;
    edtPais.Text := PESSOA.PPAIS;
    edtNumero.Text := PESSOA.PNUMERO;
    edtComplemento.Text := PESSOA.PCOMPLEMENTO;
    dtpDataNasc.Date := StrToDate(PESSOA.PDATA_NASC);
    lkpUnidFederat.KeyValue := PESSOA.PUNI_FED_COD;
    lkpEstadoCivil.KeyValue := PESSOA.PEST_CIV_COD;

    COLABORADOR.PPESSOA_COD := gridRegistros.Columns[0].Field.Value;;
    COLABORADOR.Carregar;
    edtCnh.Text := COLABORADOR.PCNH;
    edtGrupoSan.Text := COLABORADOR.PGRUPO_SANGUINEO;
    edtBanco.Text := COLABORADOR.PBANCO;
    edtAgencia.Text := COLABORADOR.PAGENCIA;
    edtContaCorrente.Text := COLABORADOR.PCONTA_CORRENTE;
    edtObs.Text := COLABORADOR.POBSERVACAO;
    dtpDataAdmissao.Date := StrToDate(COLABORADOR.PDATA_ADMISSAO);
    if COLABORADOR.PDATA_DEMISSAO <> '' then
      dtpDataDemissao.Date := StrToDate(COLABORADOR.PDATA_DEMISSAO);
    if COLABORADOR.PFOTO <> '' then
      Image1.Picture.LoadFromFile(ExtractFilePath(Application.ExeName)+COLABORADOR.PFOTO);

  finally
    PESSOA.Free;
    COLABORADOR.Free;
  end;
end;

procedure TfrmGeColaboradores.btnExcluirClick(Sender: TObject);
var
  COLABORADOR: TuClassGE_COLABORADORES;
begin
  inherited;
    if (MessageDlg('Excluir Registro?',mtConfirmation,[mbYes,mbNo],0) = mrYes) then
    begin
      COLABORADOR := TuClassGE_COLABORADORES.Create;
      try
        COLABORADOR.PPESSOA_COD := gridRegistros.Columns[0].Field.Value;
        COLABORADOR.Excluir;   //SOMENTE INATIVA O COLABORADOR
        gridRegistros.DataSource := COLABORADOR.Consultar('GE_COLABORADORES.STATUS = ''A'' ');
      finally
        COLABORADOR.Free;
      end;
    end; 
end;

procedure TfrmGeColaboradores.btnSalvarClick(Sender: TObject);
var
  PESSOA: TuClassGE_PESSOAS;
  COLABORADOR: TuClassGE_COLABORADORES;
  GERAL: TuClassFuncoesGerais;
begin
  inherited;
  try
    PESSOA := TuClassGE_PESSOAS.Create;
    COLABORADOR := TuClassGE_COLABORADORES.Create;
    GERAL := TuClassFuncoesGerais.Create;
    try
      if lblModo1.Caption = 'Inserindo' then
      begin

        PESSOA.PNOME := edtNome.Text;
        PESSOA.PDATA_NASC := DateToStr(dtpDataNasc.Date);
        PESSOA.PCPF := edtCpf.Text;
        PESSOA.PENDERECO := edtEndereco.Text;
        PESSOA.PBAIRRO := edtBairro.Text;
        PESSOA.PEMAIL_1 := edtMail1.Text;
        PESSOA.PEMAIL_2 := edtMail2.Text;
        PESSOA.PNATURALIDADE := edtNaturalidade.Text;
        PESSOA.PCIDADE := edtCidade.Text;
        PESSOA.PCEP := edtCep.Text;
        PESSOA.PPAIS := edtPais.Text;
        PESSOA.PUNI_FED_COD := lkpUnidFederat.KeyValue;
        PESSOA.PNUMERO := edtNumero.Text;
        PESSOA.PCOMPLEMENTO := edtComplemento.Text;
        PESSOA.PEST_CIV_COD := lkpEstadoCivil.KeyValue;
        if rgSexo.ItemIndex = 0 then
          PESSOA.PSEXO := 'Masculino'
        else
          PESSOA.PSEXO := 'Feminino';


        if PESSOA.Salvar then
          begin
            COLABORADOR.PPESSOA_COD := IntToStr(GERAL.UltimoID('GE_PESSOAS','PESSOA_COD'));
            COLABORADOR.PCNH := edtCnh.Text;
            COLABORADOR.PGRUPO_SANGUINEO := edtGrupoSan.Text;
            COLABORADOR.POBSERVACAO := edtObs.Text;
            if CheckBox1.Checked then
              COLABORADOR.PDATA_DEMISSAO := DatetoStr(dtpDataDemissao.Date);
            COLABORADOR.PDATA_ADMISSAO := DatetoStr(dtpDataAdmissao.Date);  
            COLABORADOR.PSTATUS := 'A';
            COLABORADOR.PBANCO := edtBanco.Text;
            COLABORADOR.PAGENCIA := edtAgencia.Text;
            COLABORADOR.PCONTA_CORRENTE := edtContaCorrente.Text;
            if SelecionouImagem then            
              COLABORADOR.PFOTO := 'imagens\'+edtNome.Text+ExtractFileExt(CaminhoFoto);

            if COLABORADOR.Salvar then
              begin
                lblModo1.Caption := 'Listando';
                tsVisualiza.Show;
                gridRegistros.DataSource := COLABORADOR.ConsultaPessoaColaborador('GE_COLABORADORES.STATUS = ''A'' ');
                TuClassFuncoesGerais.GravaLog('Cadastrou novo Colaborador: '+edtNome.Text);
              end;
          end;
      end
    else if lblModo1.Caption = 'Editando' then
      begin
        PESSOA.PNOME := edtNome.Text;
        PESSOA.PDATA_NASC := DateToStr(dtpDataNasc.Date);
        PESSOA.PCPF := edtCpf.Text;
        PESSOA.PENDERECO := edtEndereco.Text;
        PESSOA.PBAIRRO := edtBairro.Text;
        PESSOA.PEMAIL_1 := edtMail1.Text;
        PESSOA.PEMAIL_2 := edtMail2.Text;
        PESSOA.PNATURALIDADE := edtNaturalidade.Text;
        PESSOA.PCIDADE := edtCidade.Text;
        PESSOA.PCEP := edtCep.Text;
        PESSOA.PPAIS := edtPais.Text;
        PESSOA.PUNI_FED_COD := lkpUnidFederat.KeyValue;
        PESSOA.PNUMERO := edtNumero.Text;
        PESSOA.PCOMPLEMENTO := edtComplemento.Text;
        PESSOA.PEST_CIV_COD := lkpEstadoCivil.KeyValue;
        PESSOA.PPESSOA_COD := gridRegistros.Columns[0].Field.Value;
        if rgSexo.ItemIndex = 0 then
          PESSOA.PSEXO := 'Masculino'
        else
          PESSOA.PSEXO := 'Feminino';

        if PESSOA.Editar then
          begin
            COLABORADOR.PPESSOA_COD := gridRegistros.Columns[0].Field.Value;
            COLABORADOR.PCNH := edtCnh.Text;
            COLABORADOR.PGRUPO_SANGUINEO := edtGrupoSan.Text;
            COLABORADOR.POBSERVACAO := edtObs.Text;
            COLABORADOR.PDATA_ADMISSAO := DateToStr(dtpDataAdmissao.Date);
            if CheckBox1.Checked then            
              COLABORADOR.PDATA_DEMISSAO := DatetoStr(dtpDataDemissao.Date);
            COLABORADOR.PSTATUS := 'A';
            COLABORADOR.PBANCO := edtBanco.Text;
            COLABORADOR.PAGENCIA := edtAgencia.Text;
            COLABORADOR.PCONTA_CORRENTE := edtContaCorrente.Text;
            COLABORADOR.PPESSOA_COD := gridRegistros.Columns[0].Field.Value;
            COLABORADOR.PFOTO := 'imagens\'+edtNome.Text+ExtractFileExt(OpenPictureDialog1.FileName);

            if COLABORADOR.Editar then
              begin
                lblModo1.Caption := 'Listando';
                tsVisualiza.Show;
                gridRegistros.DataSource := COLABORADOR.ConsultaPessoaColaborador('GE_COLABORADORES.STATUS = ''A'' ');
                TuClassFuncoesGerais.GravaLog('Editou cadastro do Colaborador: '+edtNome.Text);
              end;
          end;
      end;
         

    finally
      PESSOA.Free;
      COLABORADOR.Free;
      GERAL.Free;
    end;
  except on E: Exception do
  end;
end;

procedure TfrmGeColaboradores.CheckBox1Click(Sender: TObject);
begin
  inherited;
  if CheckBox1.Checked then
    begin
      dtpDataDemissao.Enabled := True;
      Label21.Enabled := True;
    end
  else
    begin
      dtpDataDemissao.Enabled := False;
      Label21.Enabled := False;
    end;
end;

procedure TfrmGeColaboradores.FormShow(Sender: TObject);
var
  ESTADOCIVIL: TuClassGE_ESTADOS_CIVIS;
  UNIDADEFEDERATIVA: TuClassGE_UNIDADES_FEDERATIVAS;
  COLABORADOR: TuClassGE_COLABORADORES;
begin
  inherited;
  SelecionouImagem := False;
  dtpDataNasc.Date := Date;
  dtpDataAdmissao.Date := Date;
  dtpDataDemissao.Date := Date;

  ESTADOCIVIL := TuClassGE_ESTADOS_CIVIS.Create;
  UNIDADEFEDERATIVA := TuClassGE_UNIDADES_FEDERATIVAS.Create;
  COLABORADOR := TuClassGE_COLABORADORES.Create;
  try
    lkpEstadoCivil.ListSource := ESTADOCIVIL.Consultar('');
    lkpUnidFederat.ListSource := UNIDADEFEDERATIVA.Consultar('');

    gridRegistros.DataSource := COLABORADOR.ConsultaPessoaColaborador('GE_COLABORADORES.STATUS = ''A''');

  finally
    ESTADOCIVIL.Free;
    UNIDADEFEDERATIVA.Free;
    COLABORADOR.Free;
  end;

end;

procedure TfrmGeColaboradores.gridRegistrosDblClick(Sender: TObject);
begin
//  frmBiometriaDigital := TfrmBiometriaDigital.Create(Self);
//  frmBiometriaDigital.edtIdPessoa.Text :=  gridRegistros.Columns[0].Field.Value;
//  frmBiometriaDigital.ShowModal;

end;

procedure TfrmGeColaboradores.SpeedButton1Click(Sender: TObject);
var
  caminho:string;
begin
  inherited;
  caminho := ExtractFilePath(Application.ExeName)+'imagens\';
  OpenPictureDialog1.Execute();
  CopyFile(PAnsiChar(OpenPictureDialog1.FileName),PansiChar(Caminho+ExtractFileName(OpenPictureDialog1.FileName)),False);
  RenameFile(Caminho+ExtractFileName(OpenPictureDialog1.FileName),Caminho+edtNome.Text+ExtractFileExt(OpenPictureDialog1.FileName));
  Image1.Picture.LoadFromFile(ExtractFilePath(Application.ExeName)+'imagens/'+edtNome.Text+ExtractFileExt(OpenPictureDialog1.FileName));
  CaminhoFoto := ExtractFilePath(Application.ExeName)+'imagens/'+edtNome.Text+ExtractFileExt(OpenPictureDialog1.FileName);
  SelecionouImagem:= True;
end;

end.
