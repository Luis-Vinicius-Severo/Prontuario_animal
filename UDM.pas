unit UDM;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TDM = class(TDataModule)
    FDConnection: TFDConnection;
    FDTransaction: TFDTransaction;
    SqlProprietario: TFDQuery;
    DSSqlProprietario: TDataSource;
    SqlProprietarioPKPROPRIETARIO: TLargeintField;
    SqlProprietarioENDERECO: TStringField;
    SqlProprietarioNUMERO: TBCDField;
    SqlProprietarioBAIRRO: TStringField;
    SqlProprietarioCIDADE: TStringField;
    SqlProprietarioESTADO: TStringField;
    SqlProprietarioCEP: TStringField;
    FBTransactionaltera: TFDTransaction;
    SQLModifica: TFDQuery;
    SqlAnimais: TFDQuery;
    DSSQLAnimais: TDataSource;
    SqlAnimaisPKANIMAL: TLargeintField;
    SqlAnimaisDATANASCIMENTO: TDateField;
    SqlAnimaisFKRACA: TLargeintField;
    SqlAnimaisPESO: TSingleField;
    SqlAnimaisFKPROPRIETARIO: TLargeintField;
    SqlRaca: TFDQuery;
    SqlRacaPKRACA: TLargeintField;
    SqlRacaDESCRICAORACA: TStringField;
    DSSqlRaca: TDataSource;
    SqlRacaNOMERACA: TStringField;
    SqlAnimaisNOMEANIMAL: TStringField;
    SqlProprietarioNOMEPROPRI: TStringField;
    SqlProntuario: TFDQuery;
    DSSqlProntuario: TDataSource;
    SqlDespesas: TFDQuery;
    DSSqlDespesas: TDataSource;
    SqlDespesasPKITEMDESP: TLargeintField;
    SqlDespesasFKPRONTUARIO: TLargeintField;
    SqlDespesasDESCRICAO: TStringField;
    SqlDespesasQUANTIDADE: TIntegerField;
    SqlDespesasVALORUNIT: TBCDField;
    SqlDespesasVALORTOTAL: TBCDField;
    SqlProntuarioPKPRONTUARIO: TLargeintField;
    SqlProntuarioFKPROPRIETARIO: TLargeintField;
    SqlProntuarioFKANIMAL: TLargeintField;
    SqlProntuarioDATAENTRADA: TDateField;
    SqlProntuarioDATASAIDA: TDateField;
    SqlProntuarioVALORTOTAL: TBCDField;
    SqlProntuarioNOMEPROPRI: TStringField;
    SqlProntuarioNOMEANIMAL: TStringField;
  private
    { Private declarations }
  public
  procedure executaSQl(sqle:string;Q:TFDQuery);
  function salvaData(data: string): string;
   function salvaChave(chave:String):string;
   function limpaVir(num: String):String;
    { Public declarations }
  end;

var
  DM: TDM;

 const
  STBProprietario = 'select * from tbproprietario ';
  //STBAnimalGeral = 'select a.*, p.nome, r.pkraca from tbanimal a inner join tbproprietario p on p.pkproprietario = a.fkproprietario inner join tbraca r on r.pkraca = a.fkraca ';
  STBAnimal = 'select * from tbanimal';
  STBRaca = 'select * from tbraca';
  STBProntuario = 'select pr.*, p.nomepropri, a.nomeanimal from TBPRONTURARIO  pr inner join tbproprietario p on p.pkproprietario = pr.fkproprietario inner join tbanimal a on a.pkanimal = pr.fkanimal';
  STBDespesas = 'select * from TBITEMDESPESA';


implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDM }

procedure TDM.executaSQl(sqle: string; Q: TFDQuery);
begin
  sqle:=Trim(sqle);
  WITH q do
  begin
    Close;
    SQL.Clear;
    SQL.Add(sqle);
    if UpperCase(Copy(sqle,1,6))='SELECT' then
      OPEN
    ELSE
      EXECSQL;
  end;
end;

function TDM.limpaVir(num: String): String;
var
i: Integer;
begin
  num:= Trim(num);

  if num='' then
     num := '0';

  for I := 1 to Length(num) do
    if num[i]=',' then
       num[i]:= '.' ;

   limpaVir:= num;

end;

function TDM.salvaChave(chave: String): string;
begin
chave := Trim(chave);
   if chave= '' then
   chave := 'NULL';
   salvaChave := chave
end;

function TDM.salvaData(data: string): string;
var x : string;
begin
   if trim(data)='/  /' then
   x:= 'NULL'
   else
   x:= QuotedStr(FormatDateTime('dd.mm.yyyy', StrToDate(data)));
   salvaData := x;
end;

end.
