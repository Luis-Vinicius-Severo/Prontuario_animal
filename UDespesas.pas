unit UDespesas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, Vcl.ExtCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.Buttons, Vcl.Mask, Vcl.DBCtrls, Datasnap.DBClient;

type
  TFDespesas = class(TForm)
    DBGrid1: TDBGrid;
    PDadosProntu: TPanel;
    PBotoes: TPanel;
    BtSalvar: TBitBtn;
    LCodAnimal: TLabel;
    LProprietario: TLabel;
    EdtProprietario: TEdit;
    LBNomeAnimal: TLabel;
    LBNomePropri: TLabel;
    PDados: TPanel;
    LDescricao: TLabel;
    LQuantidade: TLabel;
    LValorUnit: TLabel;
    EdtQuantidade: TEdit;
    EdtValorUnit: TEdit;
    EdtDescricao: TEdit;
    Label1: TLabel;
    EdtValorTotal: TEdit;
    EdtAnimal: TEdit;
    EdtProntuario: TEdit;
    BtEditar: TBitBtn;
    DBEdit1: TDBEdit;
    EdtCodDespesas: TEdit;
    LProntuario: TLabel;
    LDespesas: TLabel;
    BtPesquisar: TBitBtn;
    BtRemover: TBitBtn;
    BtCancelar: TBitBtn;
    BtSair: TBitBtn;
    procedure BtCancelarClick(Sender: TObject);
    procedure EdtAnimalExit(Sender: TObject);
    procedure limpa;
    procedure mostrar(pk:string);
    procedure Calculartotal;
    procedure FormActivate(Sender: TObject);
    procedure EdtProprietarioExit(Sender: TObject);
    procedure BtSalvarClick(Sender: TObject);
    procedure controleBotoes(funcaoBotao:integer=0);
    procedure BtEditarClick(Sender: TObject);
    procedure DBEdit1Change(Sender: TObject);
    procedure EdtCodDespesasExit(Sender: TObject);
    procedure EdtValorUnitExit(Sender: TObject);
    procedure EdtQuantidadeExit(Sender: TObject);
    procedure BtPesquisarClick(Sender: TObject);
    procedure BtRemoverClick(Sender: TObject);
    procedure BtSairClick(Sender: TObject);
  private
    { Private declarations }
  public
    ProntuarioID: Integer;

    { Public declarations }
  end;

var
  FDespesas: TFDespesas;
  funcaoGeral: integer = 3;
  PkProntuario: string;

implementation

{$R *.dfm}

uses UDM, UPronturario;


procedure TFDespesas.BtCancelarClick(Sender: TObject);
begin
  funcaoGeral := 3;
   controleBotoes(3);
end;


procedure TFDespesas.BtEditarClick(Sender: TObject);
  begin
  if not DBGrid1.DataSource.DataSet.IsEmpty then
  begin
    DBGrid1.DataSource.DataSet.Edit;

  EdtValorTotal.Text := DM.SqlDespesas.FieldByName('valortotal').AsString ;
  EdtDescricao.Text:=DM.SqlDespesas.FieldByName('descricao').AsString;
  EdtQuantidade.Text:=DM.SqlDespesas.FieldByName('quantidade').AsString;
  EdtValorUnit.Text:=DM.SqlDespesas.FieldByName('valorunit').AsString;

  funcaoGeral := 1;
  controleBotoes(funcaoGeral);
  end;
end;

procedure TFDespesas.BtPesquisarClick(Sender: TObject);
var pesquisar : string;
begin
  pesquisar := STBDespesas;
  dm.executaSQl(pesquisar,dm.SqlDespesas);
end;

procedure TFDespesas.BtRemoverClick(Sender: TObject);
var x : String;
begin

    try

     if Dm.FBTransactionaltera.TransactionIntf.Active then
         DM.FBTransactionaltera.Rollback;
         DM.FBTransactionaltera.StartTransaction;

             X :='delete from TBITEMDESPESA'
              +' WHERE PKITEMDESP ='+ EdtCodDespesas.Text;


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

procedure TFDespesas.BtSairClick(Sender: TObject);
begin
close;
end;

procedure TFDespesas.BtSalvarClick(Sender: TObject);
var
  x:string;
begin
    try

     if Dm.FBTransactionaltera.TransactionIntf.Active then
         DM.FBTransactionaltera.Rollback;
         DM.FBTransactionaltera.StartTransaction;

        Calculartotal;

      case funcaoGeral of
        0:begin //pressionou botão de incluir
            x:='INSERT INTO TBITEMDESPESA (FKPRONTUARIO, DESCRICAO, QUANTIDADE, VALORUNIT, VALORTOTAL) VALUES ('
              + DM.salvaChave(EdtProntuario.Text)+','
              + QuotedStr(EdtDescricao.Text)+','
              +  StringReplace(EdtQuantidade.Text, ',', '.', []) + ','
              + StringReplace(EdtValorUnit.Text, ',', '.', []) + ','
              + EdtValorTotal.Text
              +')';

        end;
        1:begin //pressionou botão de incluir
           x := 'UPDATE TBITEMDESPESA SET ' +
               ' DESCRICAO = ' + QuotedStr(EdtDescricao.Text) + ',' +
               ' QUANTIDADE = ' + StringReplace(EdtQuantidade.Text, ',', '.', []) + ',' +
               ' VALORUNIT = ' + StringReplace(EdtValorUnit.Text, ',', '.', []) + ',' +
               ' VALORTOTAL =' + EdtValorTotal.Text +
               ' WHERE PKITEMDESP = ' + EdtCodDespesas.Text;
        end;

      end;

      DM.executaSQl(x, dm.SQLModifica);


    DM.executaSQL(
      'UPDATE TBPRONTURARIO SET VALORTOTAL = ' +
      '(SELECT SUM(VALORTOTAL) FROM TBITEMDESPESA WHERE FKPRONTUARIO = ' + EdtProntuario.Text + ')' +
      ' WHERE PKPRONTUARIO = ' + EdtProntuario.Text,
      DM.SQLModifica
    );

    funcaoGeral := 3;
    controleBotoes(3);
    DM.FBTransactionaltera.Commit;



  except
      DM.FBTransactionaltera.Rollback;
      showmessage('erro ao salvar dados');
  end;

end;


procedure TFDespesas.CalcularTotal;
var
  total,quantidade, unitario : double;
begin

  quantidade := StrToFloatDef(EdtQuantidade.Text,0);
  unitario :=  StrToFloatDef(EdtValorUnit.Text,0);
  total := quantidade * unitario;

  EdtValorTotal.Text := StringReplace(FormatFloat('#0.00', total),',','.',[]);
end;

procedure TFDespesas.controleBotoes(funcaoBotao: integer);
begin
  BtSalvar.Enabled := false;
  BtSalvar.Enabled := false;
  BtRemover.Enabled := false;
  BtEditar.Enabled := false;

  case funcaoBotao of
    0:begin
      limpa ;
      BtSalvar.Enabled:= true;
      BtCancelar.Enabled:= true;
    end;

    1:begin
      BtSalvar.Enabled:= true;
      BtCancelar.Enabled:= true;
    end;

  else;
         begin
          if DM.SqlAnimais.FieldByName('PKANIMAL').asstring <> '' then
          begin
                BtEditar.Enabled := true;
                BtRemover.Enabled := true;
          end;

         end;
 end;

end;



procedure TFDespesas.DBEdit1Change(Sender: TObject);
begin
   if (funcaoGeral in [0,1]) then
  exit;

end;

procedure TFDespesas.EdtAnimalExit(Sender: TObject);
var x: string;
begin
    x:= Trim(EdtAnimal.Text);
    if x='' then
    begin
      LBNomeAnimal.Caption := '';
      exit;
    end;

    x := 'select * from TBPRONTURARIO where pkprontuario ='+x;
    dm.executaSQl(x, DM.SqlProntuario);
    if dm.SqlProntuario.FieldByName('PKPRONTUARIO').AsString='' then
    begin
      ShowMessage('Animal com esse código não encotrando !!');
      if EdtAnimal.CanFocus then
          EdtAnimal.SetFocus;
    end;

    LBNomeAnimal.Caption := dm.SqlProntuario.FieldByName('NOMEANIMAL').AsString;

end;

procedure TFDespesas.EdtCodDespesasExit(Sender: TObject);
var x: string;
begin
    x:= Trim(EdtCodDespesas.Text);
    x := 'select * from TBITEMDESPESA where PKITEMDESP ='+x;
    dm.executaSQl(x, DM.SqlProntuario);
    if dm.SqlProntuario.FieldByName('PKITEMDESP').AsString='' then
    begin
      ShowMessage('Despesa com esse código não encotrando !!');
      if EdtCodDespesas.CanFocus then
          EdtCodDespesas.SetFocus;
    end;
end;

procedure TFDespesas.EdtProprietarioExit(Sender: TObject);
var x: string;
begin
    x:= Trim(EdtProntuario.Text);
    x := 'select * from TBPRONTURARIO where pkprontuario ='+x;
    dm.executaSQl(x, DM.SqlProntuario);
    if dm.SqlProntuario.FieldByName('PKPRONTUARIO').AsString='' then
    begin
      ShowMessage('Prontuario com esse código não encotrando !!');
      if EdtProprietario.CanFocus then
          EdtProprietario.SetFocus;
    end;


end;

procedure TFDespesas.EdtQuantidadeExit(Sender: TObject);
begin
  Calculartotal;
end;

procedure TFDespesas.EdtValorUnitExit(Sender: TObject);
begin
  Calculartotal;
end;

procedure TFDespesas.FormActivate(Sender: TObject);
begin
 DM.SqlProntuario.Open();
 dm.SqlDespesas.open();
 mostrar(PkProntuario) ;

end;

procedure TFDespesas.limpa;
var i : Integer;

begin
  if funcaoGeral = 0 then
  begin
   EdtDescricao.Text := '';
   EdtQuantidade.Text := '';
   EdtValorUnit.Text := '';
  end
  else
  begin

  end;

 for i := 0 to ComponentCount - 1 do
 begin
  if Components[i] is TEdit  then TEdit (Components[i]).text:= '';

 end;

end;

procedure TFDespesas.mostrar;
var x: string;
begin
  if (dm.SqlProntuario.Active=false) or (DM.SqlProntuario.FieldByName('pkprontuario').asstring = '') then
       begin
         limpa;
         exit;
       end;

x := STBProntuario+' where pkprontuario=' +pk;
    DM.executaSQl(x, DM.SqlProntuario);
    EdtProprietario.Text := DM.SqlProntuario.FieldByName('fkproprietario').AsString;
    EdtAnimal.Text := DM.SqlProntuario.FieldByName('fkanimal').AsString;
    LBNomeAnimal.Caption := dm.SqlProntuario.FieldByName('NOMEANIMAL').AsString;
    LBNomePropri.Caption := dm.SqlProntuario.FieldByName('nomepropri').AsString;
    EdtProntuario.Text := dm.SqlProntuario.FieldByName('pkprontuario').AsString;
    EdtCodDespesas.Text := dm.SqlDespesas.FieldByName('PKITEMDESP').AsString;

end;


end.
