unit UAnimais;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.Mask, Datasnap.DBClient, Vcl.DBCtrls;

type
  TFAnimais = class(TForm)
    DBGrid1: TDBGrid;
    Pdados: TPanel;
    PBotoes: TPanel;
    BtSair: TBitBtn;
    BtCancelar: TBitBtn;
    BtSalvar: TBitBtn;
    BtRemover: TBitBtn;
    BtEditar: TBitBtn;
    BtNovo: TBitBtn;
    EdtCodAnimal: TEdit;
    LCodAnimal: TLabel;
    LNome: TLabel;
    EdtNome: TEdit;
    LDataNasc: TLabel;
    LRaca: TLabel;
    LPeso: TLabel;
    EdtPeso: TEdit;
    Label1: TLabel;
    EdtDataNasc: TMaskEdit;
    PConsulta: TPanel;
    CBPregra: TComboBox;
    EdtPesq: TEdit;
    BtPesquisa: TBitBtn;
    DBEdit1: TDBEdit;
    DBProprietario: TDBLookupComboBox;
    DBRaca: TDBLookupComboBox;
    procedure BtNovoClick(Sender: TObject);
    procedure BtEditarClick(Sender: TObject);
    procedure BtSairClick(Sender: TObject);
    procedure BtSalvarClick(Sender: TObject);
    procedure BtPesquisaClick(Sender: TObject);
    procedure BtRemoverClick(Sender: TObject);
    procedure BtCancelarClick(Sender: TObject);
    procedure DBEdit1Change(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
  procedure controleBotoes(funcaoBotao:integer=0);
  procedure limpar;
  procedure mostrar;
    { Private declarations }
  public

    { Public declarations }
  end;

var
  FAnimais: TFAnimais;
  funcaoGeral: integer = 3;

implementation

{$R *.dfm}

uses UDM, UPrincipal, UPronturario, UProprietario, URaca;

{ TFAnimais }

procedure TFAnimais.BtCancelarClick(Sender: TObject);
begin
  funcaoGeral := 3;
    mostrar;
   controleBotoes(3);
end;

procedure TFAnimais.BtEditarClick(Sender: TObject);
begin
  funcaoGeral := 1;
  controleBotoes(funcaoGeral);
end;

procedure TFAnimais.BtNovoClick(Sender: TObject);
begin
  funcaoGeral := 0;
  controleBotoes(funcaoGeral);
end;

procedure TFAnimais.BtPesquisaClick(Sender: TObject);
var pesquisar, pesquisaResul : String;
begin
    pesquisar:= STBAnimal;
    pesquisaResul:= Trim(EdtPesq.Text);
if pesquisaResul <> '' then
   begin
     case CBPregra.ItemIndex of
      1:pesquisaResul:= ' where pkanimal='+pesquisaResul;
      2:pesquisaResul:= ' where upper(nomeanimal) like upper('+QuotedStr(pesquisaResul+'%')+')';

     end;
     end;

     pesquisar:= pesquisar+pesquisaResul;
     dm.executaSQl(pesquisar,dm.SqlAnimais);

end;

procedure TFAnimais.BtRemoverClick(Sender: TObject);
var x : String;
begin

    try

     if Dm.FBTransactionaltera.TransactionIntf.Active then
         DM.FBTransactionaltera.Rollback;
         DM.FBTransactionaltera.StartTransaction;

             X :='delete from TBANIMAL'
              +' WHERE PKANIMAL ='+ EdtCodAnimal.Text;


      DM.executaSQl(x,dm.SQLModifica);
      DM.FBTransactionaltera.Commit;
      BtPesquisaClick(nil);

      funcaoGeral := 3;
      controleBotoes(funcaoGeral);

  except
      DM.FBTransactionaltera.Rollback;
      showmessage('erro ao salvar dados');
  end;

end;

procedure TFAnimais.BtSairClick(Sender: TObject);
begin
  close;
end;

procedure TFAnimais.BtSalvarClick(Sender: TObject);
var
  x:string;
begin
    try

     if Dm.FBTransactionaltera.TransactionIntf.Active then
         DM.FBTransactionaltera.Rollback;
         DM.FBTransactionaltera.StartTransaction;


        case funcaoGeral of
        0:begin //pressionou botão de incluir
            x:='INSERT INTO TBANIMAL (NOMEANIMAL, DATANASCIMENTO, FKRACA, PESO, FKPROPRIETARIO) VALUES ('
              + QuotedStr(EdtNome.Text)+','
              + DM.salvaData(EdtDataNasc.Text)+ ','
              + DM.salvaChave(DBRaca.keyValue)+','
              + StringReplace(EdtPeso.Text, ',', '.', []) + ','
              + DM.salvaChave(DBProprietario.keyValue)
              +')';
        end;
        1:begin //pressionou botão de incluir
            X:='UPDATE TBANIMAL SET '
            +'  NOMEANIMAL = '+QuotedStr(EdtNome.Text)
            +' ,DATANASCIMENTO ='+ DM.salvaData(EdtDataNasc.Text)
            +' ,FKRACA ='+ DM.salvaChave(DBRaca.keyValue)
            +' ,PESO ='+  StringReplace(EdtPeso.Text, ',', '.', [])
            +' ,FKPROPRIETARIO ='+ DM.salvaChave(DBProprietario.keyValue)
            +' WHERE PKANIMAL ='+ EdtCodAnimal.Text;
        end;



      end;

      DM.executaSQl(x,dm.SQLModifica);
      BtPesquisaClick(nil);
      funcaoGeral:=3;
      controleBotoes(3);

  except
      DM.FBTransactionaltera.Rollback;
      showmessage('erro ao salvar dados');
  end;

end;


procedure TFAnimais.controleBotoes(funcaoBotao: integer);
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
          if DM.SqlAnimais.FieldByName('PKANIMAL').asstring <> '' then
          begin
                BtEditar.Enabled := true;
                BtRemover.Enabled := true;
          end;

         end;
 end;

end;

procedure TFAnimais.DBEdit1Change(Sender: TObject);
begin
if (funcaoGeral in [0,1]) then
exit;
mostrar;
end;


procedure TFAnimais.FormActivate(Sender: TObject);
begin
  dm.SqlProprietario.Open();
  dm.SqlRaca.Open();
  dm.SqlAnimais.Open();
  mostrar;
end;

procedure TFAnimais.limpar;
var i : Integer;

begin
 for i := 0 to ComponentCount - 1 do
 begin
  if Components[i] is TEdit  then TEdit (Components[i]).text:= '';
  if Components[I] is TMaskEdit then TMaskEdit(Components[I]).Text:= '';

 end;

end;

procedure TFAnimais.mostrar;
begin
  if (dm.SqlAnimais.Active=false) or (DM.SqlAnimais.FieldByName('pkanimal').asstring = '') then
       begin
         limpar;
         exit;
       end;

  EdtCodAnimal.Text:=inttostr(DM.SqlAnimais.FieldByName('pkanimal').AsInteger);
  EdtDataNasc.Text := FormatDateTime('dd/mm/yyyy', DM.SqlAnimais.FieldByName('datanascimento').AsDateTime);
  EdtNome.Text:=DM.SqlAnimais.FieldByName('nomeanimal').AsString;
  EdtPeso.Text:=DM.SqlAnimais.FieldByName('peso').AsString;




end;

end.
