program ProjAnimal;

uses
  Vcl.Forms,
  UPrincipal in 'UPrincipal.pas' {FPrincipal},
  UAnimais in 'UAnimais.pas' {FAnimais},
  URaca in 'URaca.pas' {FRaca},
  UProprietario in 'UProprietario.pas' {FProprietario},
  UPronturario in 'UPronturario.pas' {FPronturario},
  UDM in 'UDM.pas' {DM: TDataModule},
  UDespesas in 'UDespesas.pas' {FDespesas};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFPrincipal, FPrincipal);
  Application.CreateForm(TFAnimais, FAnimais);
  Application.CreateForm(TFRaca, FRaca);
  Application.CreateForm(TFProprietario, FProprietario);
  Application.CreateForm(TFPronturario, FPronturario);
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFDespesas, FDespesas);
  Application.Run;
end.
