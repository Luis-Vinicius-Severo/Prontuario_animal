unit UProprietario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.Mask, Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls;

type
  TFProprietario = class(TForm)
    PDados: TPanel;
    DBGrid1: TDBGrid;
    LNome: TLabel;
    PBotoes: TPanel;
    BtSair: TBitBtn;
    BtCancelar: TBitBtn;
    BtSalvar: TBitBtn;
    BtRemover: TBitBtn;
    BtEditar: TBitBtn;
    BtNovo: TBitBtn;
    Label1: TLabel;
    Endereço: TLabel;
    Cidade: TLabel;
    Estado: TLabel;
    CEP: TLabel;
    PConsulta: TPanel;
    CBPregra: TComboBox;
    EdtPesq: TEdit;
    BtPesquisar: TBitBtn;
    Label2: TLabel;
    Label3: TLabel;
    EdtCodigo: TEdit;
    EdtNome: TEdit;
    EdtEndereco: TEdit;
    edtCidade: TEdit;
    EdtEstado: TEdit;
    EdtCep: TEdit;
    EdtNumero: TEdit;
    EdtBairro: TEdit;
    DBEdit1: TDBEdit;
    procedure BtSairClick(Sender: TObject);
    procedure BtPesquisarClick(Sender: TObject);
    procedure BtNovoClick(Sender: TObject);
    procedure BtEditarClick(Sender: TObject);
    procedure BtCancelarClick(Sender: TObject);
    procedure BtSalvarClick(Sender: TObject);
    procedure DBEdit1Change(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BtRemoverClick(Sender: TObject);
  private
  procedure controleBotoes(funcaoBotao:integer=0);
  procedure limpar;
  procedure mostrar;
  procedure atualizarItemDespesas;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FProprietario: TFProprietario;
  funcaoGeral: integer = 3;

implementation

{$R *.dfm}

uses UDM;

procedure TFProprietario.atualizarItemDespesas;
begin
  if not DM.SqlProntuario.IsEmpty then
  begin
    DM.SqlDespesas.Close;
    DM.SqlDespesas.SQL.Text :=
      'SELECT * FROM TItemDespesas WHERE FKProntuario = ' +
      QuotedStr(DM.SqlProntuario.FieldByName('PkProntuario').AsString);
    DM.SqlDespesas.Open;
  end;
end;



procedure TFProprietario.BtCancelarClick(Sender: TObject);
begin
  funcaoGeral := 3;
    mostrar;
   controleBotoes(3);
end;

procedure TFProprietario.BtEditarClick(Sender: TObject);
begin
  funcaoGeral := 1;
  controleBotoes(funcaoGeral);
end;

procedure TFProprietario.BtNovoClick(Sender: TObject);
begin
   funcaoGeral := 0;
  controleBotoes(funcaoGeral);
end;

procedure TFProprietario.BtPesquisarClick(Sender: TObject);
var pesquisar, pesquisaResul : String;
begin
    pesquisar:= STBProprietario;
    pesquisaResul:= Trim(EdtPesq.Text);
if pesquisaResul <> '' then
   begin
     case CBPregra.ItemIndex of
      1:pesquisaResul:= ' where pkproprietario='+pesquisaResul;
      2:pesquisaResul:= ' where upper(nome) like upper('+QuotedStr(pesquisaResul+'%')+')';

     end;
     end;

     pesquisar:= pesquisar+pesquisaResul;
     dm.executaSQl(pesquisar,dm.SqlProprietario);

     end;

procedure TFProprietario.BtRemoverClick(Sender: TObject);
var x : String;
begin

    try

     if Dm.FBTransactionaltera.TransactionIntf.Active then
         DM.FBTransactionaltera.Rollback;
         DM.FBTransactionaltera.StartTransaction;

             X :='delete from TBPROPRIETARIO'
              +' WHERE PKPROPRIETARIO ='+ EdtCodigo.Text;


      DM.executaSQl(x,dm.SQLModifica);
      DM.FBTransactionaltera.Commit;
      BtPesquisarClick(nil);

      funcaoGeral := 3;
      controleBotoes(funcaoGeral);

  except
      DM.FBTransactionaltera.Rollback;
      showmessage('erro ao salvar dados');
  end;

end;

procedure TFProprietario.BtSairClick(Sender: TObject);
begin
    close;
end;

procedure TFProprietario.BtSalvarClick(Sender: TObject);
var
  x:string;
begin
    try

     if Dm.FBTransactionaltera.TransactionIntf.Active then
         DM.FBTransactionaltera.Rollback;
         DM.FBTransactionaltera.StartTransaction;

      case funcaoGeral of
        0:begin //pressionou botão de incluir
            x:='INSERT INTO TBPROPRIETARIO (NOMEPROPRI, ENDERECO, NUMERO, BAIRRO, CIDADE, ESTADO, CEP) VALUES('
              + QuotedStr(EdtNome.Text)+','
              + QuotedStr(EdtEndereco.Text)+','
              + EdtNumero.Text+','
              + QuotedStr(EdtBairro.Text)+','
              + QuotedStr(edtCidade.Text)+','
              + QuotedStr(EdtEstado.Text)+','
              + QuotedStr(EdtCep.Text)
              +')';
        end;
        1:begin //pressionou botão de incluir
            X:='UPDATE TBPROPRIETARIO SET '
            +' NOMEPROPRI = '+QuotedStr(EdtNome.Text)
            +' ,ENDERECO ='+QuotedStr(EdtEndereco.Text)
            +' ,NUMERO ='+EdtNumero.Text
            +' ,BAIRRO ='+QuotedStr(EdtBairro.Text)
            +' ,CIDADE ='+QuotedStr(edtCidade.Text)
            +' ,ESTADO ='+QuotedStr(EdtEstado.Text)
            +' ,CEP ='+QuotedStr(EdtCep.Text)
            +' WHERE PKPROPRIETARIO ='+ EdtCodigo.Text;
        end;


      end;

      DM.executaSQl(x,dm.SQLModifica);
      BtPesquisarClick(nil);
      funcaoGeral:=3;
      controleBotoes(3);
      DM.FBTransactionaltera.Commit;

  except
      DM.FBTransactionaltera.Rollback;
      showmessage('erro ao salvar dados');
  end;
end;

procedure TFProprietario.controleBotoes(funcaoBotao: integer);
begin
  BtNovo.Enabled := false;
  BtSalvar.Enabled := false;
  BtSalvar.Enabled := false;
  BtRemover.Enabled := false;
  BtEditar.Enabled := false;

  case funcaoBotao of
    0:begin
      limpar ;
      BtSalvar.Enabled:= true;
      BtCancelar.Enabled:= true;
      if EdtNome.CanFocus then
        EdtNome.SetFocus;
    end;

    1:begin
      BtSalvar.Enabled:= true;
      BtCancelar.Enabled:= true;
      if EdtNome.CanFocus then
        EdtNome.SetFocus;
    end;

  else;
         begin
          BtNovo.Enabled := true;
          if DM.SqlProprietario.FieldByName('PKPROPRIETARIO').asstring <> '' then
          begin
                BtEditar.Enabled := true;
                BtRemover.Enabled := true;
          end;

         end;
 end;

end;

procedure TFProprietario.DBEdit1Change(Sender: TObject);
begin
if (funcaoGeral in [0,1]) then
exit;
mostrar;
end;

procedure TFProprietario.FormActivate(Sender: TObject);
begin
dm.SqlProprietario.Open();
atualizarItemDespesas;
end;



procedure TFProprietario.limpar;
var i : Integer;

begin
 for i := 0 to ComponentCount - 1 do
 begin
  if Components[i] is TEdit then TEdit (Components[i]).text:= '';

 end;

end;

procedure TFProprietario.mostrar;
begin
  if (dm.SqlProprietario.Active=false) or (DM.SqlProprietario.FieldByName('pkproprietario').asstring = '') then
       begin
         limpar;
         exit;
       end;

  EdtCodigo.Text:=inttostr(DM.SqlProprietario.FieldByName('pkproprietario').AsInteger);
  EdtNome.Text:=DM.SqlProprietario.FieldByName('nomepropri').AsString;
  EdtEndereco.Text:=DM.SqlProprietario.FieldByName('endereco').AsString;
  EdtNumero.Text:=DM.SqlProprietario.FieldByName('numero').AsString;
  EdtCidade.Text:=DM.SqlProprietario.FieldByName('cidade').AsString;
  EdtEstado.Text:=DM.SqlProprietario.FieldByName('estado').AsString;
  EdtCep.Text:=DM.SqlProprietario.FieldByName('cep').AsString;
  EdtBairro.Text:=DM.SqlProprietario.FieldByName('bairro').AsString;
end;

end.
