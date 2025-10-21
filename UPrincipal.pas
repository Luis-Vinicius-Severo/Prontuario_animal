unit UPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus;

type
  TFPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    cadastro1: TMenuItem;
    Animais1: TMenuItem;
    raca1: TMenuItem;
    pro1: TMenuItem;
    Prontuario1: TMenuItem;
    N1: TMenuItem;
    Sair1: TMenuItem;
    procedure Sair1Click(Sender: TObject);
    procedure Animais1Click(Sender: TObject);
    procedure raca1Click(Sender: TObject);
    procedure pro1Click(Sender: TObject);
    procedure Prontuario1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPrincipal: TFPrincipal;

implementation

uses
  UAnimais, URaca, UProprietario, UPronturario;

{$R *.dfm}

procedure TFPrincipal.Animais1Click(Sender: TObject);
begin
     if FAnimais=nil then
     Application.CreateForm(TFAnimais, FAnimais) ;
     FAnimais.ShowModal;
end;

procedure TFPrincipal.pro1Click(Sender: TObject);
begin
  if FProprietario=nil then
  Application.CreateForm(TFProprietario, FProprietario);
  FProprietario.ShowModal;  
end;

procedure TFPrincipal.Prontuario1Click(Sender: TObject);
begin
  if FPronturario=nil then
  Application.CreateForm(TFPronturario, FPronturario);
  FPronturario.ShowModal;  
end;

procedure TFPrincipal.raca1Click(Sender: TObject);
begin
  if FRaca=nil then
  Application.CreateForm(TFRaca, FRaca);
  FRaca.ShowModal;  
end;

procedure TFPrincipal.Sair1Click(Sender: TObject);
begin
 close;
end;

end.
