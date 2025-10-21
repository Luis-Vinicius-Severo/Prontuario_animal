unit UPronturario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.Mask, Vcl.DBCtrls;

type
  TFPronturario = class(TForm)
    DBFormPront: TDBGrid;
    PConsulta: TPanel;
    CBPregra: TComboBox;
    EdtPesq: TEdit;
    BtPesquisar: TBitBtn;
    PBotoes: TPanel;
    PDados: TPanel;
    LProprietario: TLabel;
    LAnimal: TLabel;
    DBAnimal: TDBLookupComboBox;
    EdtDataEntr: TMaskEdit;
    LDataEntr: TLabel;
    LSaida: TLabel;
    EdtDataSaida: TMaskEdit;
    LProntuario: TLabel;
    EdtCodProntu: TEdit;
    BtSair: TBitBtn;
    BtCancelar: TBitBtn;
    BtSalvar: TBitBtn;
    BtRemover: TBitBtn;
    BitEditDesp: TBitBtn;
    BtNovo: TBitBtn;
    BtEditar: TBitBtn;
    DBEdit1: TDBEdit;
    DBProprietario: TDBLookupComboBox;
    procedure BtPesquisarClick(Sender: TObject);
    procedure BtSairClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BtRemoverClick(Sender: TObject);
    procedure BitEditDespClick(Sender: TObject);
    procedure BtEditarClick(Sender: TObject);
    procedure BtSalvarClick(Sender: TObject);
    procedure BtCancelarClick(Sender: TObject);
    procedure BtNovoClick(Sender: TObject);
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
  FPronturario: TFPronturario;
  funcaoGeral: integer = 3;

implementation

{$R *.dfm}

uses UDM, UDespesas;

procedure TFPronturario.BitEditDespClick(Sender: TObject);
begin
  if (DM.SqlProntuario.Active = false) or  (DM.SqlProntuario.FieldByName('pkprontuario').AsString = '') then
  Exit;
  UDespesas.funcaoGeral := 0;
  UDespesas.PkProntuario := DM.SqlProntuario.FieldByName('PkProntuario').AsString;

  if FDespesas = nil then
     UDespesas.PkProntuario := DM.SqlProntuario.FieldByName('pkprontuario').AsString;
    Application.CreateForm(TFDespesas, FDespesas);

    try
      FDespesas.ShowModal;
    finally
      FreeAndNil(FDespesas);
    end;
    
    dm.SqlDespesas.Refresh;
    mostrar;


end;

procedure TFPronturario.BtCancelarClick(Sender: TObject);
begin
  funcaoGeral := 3;
    mostrar;
   controleBotoes(3);
end;

procedure TFPronturario.BtEditarClick(Sender: TObject);
begin
  funcaoGeral := 1;
  controleBotoes(funcaoGeral);
end;

procedure TFPronturario.BtNovoClick(Sender: TObject);
begin
  funcaoGeral := 0;
  controleBotoes(funcaoGeral);
end;

procedure TFPronturario.BtPesquisarClick(Sender: TObject);
var pesquisar, pesquisaResul : String;
begin
    pesquisar:= STBProntuario;
    pesquisaResul:= Trim(EdtPesq.Text);
if pesquisaResul <> '' then
   begin
     case CBPregra.ItemIndex of
      1:pesquisaResul:= ' where PKPRONTUARIO ='+pesquisaResul;
      2:pesquisaResul:= ' where upper(nomepropri) like upper('+QuotedStr(pesquisaResul+'%')+')';

     end;
     end;

     pesquisar:= pesquisar+pesquisaResul;
     dm.executaSQl(pesquisar,dm.SqlProntuario);

end;

procedure TFPronturario.BtRemoverClick(Sender: TObject);
var x : String;
begin

    try

     if Dm.FBTransactionaltera.TransactionIntf.Active then
         DM.FBTransactionaltera.Rollback;
         DM.FBTransactionaltera.StartTransaction;

             X :='delete from TBPRONTURARIO'
              +' WHERE PKPRONTUARIO ='+ EdtCodProntu.Text;


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

procedure TFPronturario.BtSairClick(Sender: TObject);
begin
  close;
end;

procedure TFPronturario.BtSalvarClick(Sender: TObject);
var
  x:string;
begin

    try

     if Dm.FBTransactionaltera.TransactionIntf.Active then
         DM.FBTransactionaltera.Rollback;
         DM.FBTransactionaltera.StartTransaction;

      case funcaoGeral of
        0:begin //pressionou botão de incluir
            x:='INSERT INTO TBPRONTURARIO (FKPROPRIETARIO, FKANIMAL, DATAENTRADA, DATASAIDA, VALORTOTAL) VALUES ('
              + DM.salvaChave(DBProprietario.keyValue)+','
              + DM.salvaChave(DBAnimal.keyValue)+','
              + QuotedStr(FormatDateTime('yyyy-mm-dd', StrToDate(EdtDataEntr.Text)))+ ','
              + QuotedStr(FormatDateTime('yyyy-mm-dd', StrToDate(EdtDataSaida.Text)))+ ','
              + '0)';
        end;
        1:begin //pressionou botão de incluir
            X:='UPDATE TBPRONTURARIO SET '
            +'  FKPROPRIETARIO ='+ DM.salvaChave(DBProprietario.keyValue)
            +' ,FKANIMAL ='+ DM.salvaChave(DBAnimal.keyValue)
            +' ,DATAENTRADA ='+ QuotedStr(FormatDateTime('yyyy-mm-dd', StrToDate(EdtDataEntr.Text)))
            +' ,DATASAIDA ='+ QuotedStr(FormatDateTime('yyyy-mm-dd', StrToDate(EdtDataSaida.Text)))
            +' ,VALORTOTAL ='+ '0'
            +' WHERE PKPRONTUARIO ='+ EdtCodProntu.Text;
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

procedure TFPronturario.controleBotoes(funcaoBotao: integer);
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
      if DBProprietario.CanFocus then
        DBProprietario.SetFocus;
    end;

    1:begin
      BtSalvar.Enabled:= true;
      BtCancelar.Enabled:= true;
      if DBProprietario.CanFocus then
        DBProprietario.SetFocus;
    end;

  else;
         begin
          BtNovo.Enabled := true;
          if DM.SqlProntuario.FieldByName('PKPRONTUARIO').asstring <> '' then
          begin
                BtEditar.Enabled := true;
                BtRemover.Enabled := true;
          end;

         end;
 end;
end;

procedure TFPronturario.DBEdit1Change(Sender: TObject);
begin
if (funcaoGeral in [0,1]) then
exit;
mostrar;
end;

procedure TFPronturario.FormActivate(Sender: TObject);
begin

    dm.SqlProprietario.Open();
    dm.SqlAnimais.Open();
    dm.SqlProntuario.Open();
    

end;

procedure TFPronturario.limpar;
var i : Integer;

begin
 for i := 0 to ComponentCount - 1 do
 begin
  if Components[i] is TEdit  then TEdit (Components[i]).text:= '';
  if Components[I] is TMaskEdit then TMaskEdit(Components[I]).Text:= '';

 end;


end;

procedure TFPronturario.mostrar;
begin
  if (dm.SqlProntuario.Active=false) or (DM.SqlProntuario.FieldByName('pkprontuario').asstring = '') then
       begin
         limpar;
         exit;
       end;

    EdtCodProntu.Text:=inttostr(DM.SqlProntuario.FieldByName('pkprontuario').AsInteger);
    EdtDataSaida.Text := FormatDateTime('dd/mm/yyyy', DM.SqlProntuario.FieldByName('datasaida').AsDateTime);
    EdtDataEntr.Text := FormatDateTime('dd/mm/yyyy', DM.SqlProntuario.FieldByName('dataentrada').AsDateTime);

 
end;


end.
