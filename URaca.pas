unit URaca;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.Mask, Vcl.DBCtrls;

type
  TFRaca = class(TForm)
    DBGrid1: TDBGrid;
    PConsulta: TPanel;
    CBPregra: TComboBox;
    EdtPesq: TEdit;
    BtPesquisar: TBitBtn;
    PBotoes: TPanel;
    BtSair: TBitBtn;
    BtCancelar: TBitBtn;
    BtSalvar: TBitBtn;
    BtRemover: TBitBtn;
    BtEditar: TBitBtn;
    BtNovo: TBitBtn;
    Pdados: TPanel;
    DescricaoAnimal: TLabel;
    EdtDescri: TEdit;
    LCodRaca: TLabel;
    EdtCodRaca: TEdit;
    LNome: TLabel;
    EdtNome: TEdit;
    DBEdit1: TDBEdit;
    procedure FormActivate(Sender: TObject);
    procedure BtPesquisarClick(Sender: TObject);
    procedure BtNovoClick(Sender: TObject);
    procedure BtEditarClick(Sender: TObject);
    procedure BtRemoverClick(Sender: TObject);
    procedure BtSalvarClick(Sender: TObject);
    procedure BtSairClick(Sender: TObject);
    procedure BtCancelarClick(Sender: TObject);
    procedure DBEdit1Change(Sender: TObject);
  private
  procedure controleBotoes(funcaoBotao:integer=0);
  procedure limpar;
  procedure mostrar;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRaca: TFRaca;
  funcaoGeral: integer = 3;

implementation

{$R *.dfm}

uses UDM;

procedure TFRaca.BtCancelarClick(Sender: TObject);
begin
    funcaoGeral := 3;
    mostrar;
    controleBotoes(3);
end;

procedure TFRaca.BtEditarClick(Sender: TObject);
begin
  funcaoGeral := 1;
  controleBotoes(funcaoGeral);
end;

procedure TFRaca.BtNovoClick(Sender: TObject);
begin
  funcaoGeral := 0;
  controleBotoes(funcaoGeral);
end;

procedure TFRaca.BtPesquisarClick(Sender: TObject);
var pesquisar, pesquisaResul : String;
begin
    pesquisar:= STBRaca;
    pesquisaResul:= Trim(EdtPesq.Text);
if pesquisaResul <> '' then
   begin
     case CBPregra.ItemIndex of
      1:pesquisaResul:= ' where pkraca='+pesquisaResul;
      2:pesquisaResul:= ' where upper(nome) like upper('+QuotedStr(pesquisaResul+'%')+')';

     end;
     end;

     pesquisar:= pesquisar+pesquisaResul;
     dm.executaSQl(pesquisar,dm.SqlRaca);

end;

procedure TFRaca.BtRemoverClick(Sender: TObject);
var x : String;
begin

    try

     if Dm.FBTransactionaltera.TransactionIntf.Active then
         DM.FBTransactionaltera.Rollback;
         DM.FBTransactionaltera.StartTransaction;

             X :='delete from TBRACA'
              +' WHERE PKRACA ='+ EdtCodRaca.Text;


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

procedure TFRaca.BtSairClick(Sender: TObject);
begin
  close;
end;

procedure TFRaca.BtSalvarClick(Sender: TObject);
var
  x:string;
begin
    try

     if Dm.FBTransactionaltera.TransactionIntf.Active then
         DM.FBTransactionaltera.Rollback;
         DM.FBTransactionaltera.StartTransaction;

      case funcaoGeral of
        0:begin //pressionou botão de incluir
            x:= 'INSERT INTO TBRACA (DESCRICAORACA, NOMERACA) VALUES ('
              + QuotedStr(EdtDescri.Text)+','
              + QuotedStr(EdtNome.Text)
              +')';
        end;
        1:begin //pressionou botão de incluir
            X:='UPDATE TBRACA SET '
             +' NOME = '+QuotedStr(EdtNome.Text)
            +' ,DESCRICAORACA = '+QuotedStr(EdtDescri.Text)
            +' WHERE PKRACA ='+ EdtCodRaca.Text;
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

procedure TFRaca.controleBotoes(funcaoBotao: integer);
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
      if EdtDescri.CanFocus then
        EdtDescri.SetFocus;
    end;

    1:begin
      BtSalvar.Enabled:= true;
      BtCancelar.Enabled:= true;
      if EdtDescri.CanFocus then
        EdtDescri.SetFocus;
    end;

  else;
         begin
          BtNovo.Enabled := true;
          if DM.SqlRaca.FieldByName('PKRACA').asstring <> '' then
          begin
                BtEditar.Enabled := true;
                BtRemover.Enabled := true;
          end;

         end;
 end;

end;

procedure TFRaca.DBEdit1Change(Sender: TObject);
begin
if (funcaoGeral in [0,1]) then
exit;
mostrar;
end;

procedure TFRaca.FormActivate(Sender: TObject);
begin
dm.SqlRaca.Open();
mostrar;
end;

procedure TFRaca.limpar;
var i : Integer;

begin
 for i := 0 to ComponentCount - 1 do
 begin
  if Components[i] is TEdit then TEdit (Components[i]).text:= '';

 end;

end;

procedure TFRaca.mostrar;
begin
  if (dm.SqlRaca.Active=false) or (DM.SqlRaca.FieldByName('pkraca').asstring = '') then
       begin
         limpar;
         exit;
       end;

  EdtCodRaca.Text:=inttostr(DM.SqlRaca.FieldByName('pkraca').AsInteger);
  EdtDescri.Text:=DM.SqlRaca.FieldByName('descricaoraca').AsString;
  EdtNome.Text:=DM.SqlRaca.FieldByName('nomeraca').AsString;

end;

end.
