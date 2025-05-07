unit Rp.View.Principal;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  dxBarBuiltInMenu,
  cxGraphics,
  cxControls,
  cxLookAndFeels,
  cxLookAndFeelPainters,
  dxSkinsCore,
  dxSkinBlack,
  cxPC,
  uMPanel,
  Vcl.ExtCtrls,
  Vcl.StdCtrls,
  Vcl.Imaging.pngimage,

  Rp.Model.Rest,
  Rp.View.Pesquisa.Cidade,
  Rp.View.Pesquisa.Funcionario,
  Rp.View.Pesquisa.Bairro,
  Rp.View.Pesquisa.Cliente,
  Rp.View.Pesquisa.Servico,
  Rp.View.Pesquisa.TipoServico,
  Rp.View.Pesquisa.FormaPagamento,
  Rp.View.Pesquisa.Venda;

type
  TFrmPrincipal = class(TForm)
    PnlTop: TPanel;
    lblHora: TLabel;
    lblData: TLabel;
    imgFechar: TImage;
    lblUsuario: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Bevel1: TBevel;
    pnlMenu: TPanel;
    pnlMenus: TmPanelButton;
    imgMenu: TImage;
    pnlMenuCadastros: TmPanelButton;
    imgCadastros: TImage;
    pnlMenuMovimentos: TmPanelButton;
    imgMovimentos: TImage;
    PnlBackgroun: TPanel;
    pcPrincipal: TcxPageControl;
    tbInicial: TcxTabSheet;
    pnlCadastros: TPanel;
    pnlBairros: TmPanelButton;
    imgBairros: TImage;
    pnlCadastrosHome: TPanel;
    pnlFormaPagto: TmPanelButton;
    imgFormaPagto: TImage;
    pnlFuncionario: TmPanelButton;
    imgFuncionario: TImage;
    pnlTipoServicos: TmPanelButton;
    imgTipoServico: TImage;
    pnlUsuarios: TmPanelButton;
    imgUsuarios: TImage;
    pnlServicos: TmPanelButton;
    imgServicos: TImage;
    pnlClientes: TmPanelButton;
    imgClientes: TImage;
    PnlMovimentos: TPanel;
    Panel2: TPanel;
    TmrSubMenu: TTimer;
    TmrHour: TTimer;
    pnlCidades: TmPanelButton;
    Image1: TImage;
    PnlVendas: TmPanelButton;
    Image2: TImage;
    procedure imgFecharClick(Sender: TObject);
    procedure pnlMenuCadastrosClick(Sender: TObject);
    procedure TmrSubMenuTimer(Sender: TObject);
    procedure pnlMenuMovimentosClick(Sender: TObject);
    procedure TmrHourTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure pnlCidadesClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure pnlBairrosClick(Sender: TObject);
    procedure pnlClientesClick(Sender: TObject);
    procedure pnlFuncionarioClick(Sender: TObject);
    procedure pnlFormaPagtoClick(Sender: TObject);
    procedure pnlServicosClick(Sender: TObject);
    procedure pnlTipoServicosClick(Sender: TObject);
    procedure PnlVendasClick(Sender: TObject);
  private
    FActiveForm: TForm;

    procedure DesabilitarMenus;
    procedure DesabilitarMenu;
    procedure DesabilitarSubMenu;
    procedure HabilitaSubMenu(pPanelMenu, pPanelSub:TPanel);
    procedure ShowForm(const AFormClass: TComponentClass; var AForm);
  public

  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

{$R *.dfm}

procedure TFrmPrincipal.DesabilitarMenu;
begin
  pnlMenuCadastros.Caption    := '           Cadastros';
  pnlMenuMovimentos.Caption   := '           Movimentos';
end;

procedure TFrmPrincipal.DesabilitarMenus;
begin
  TmrSubMenu.Enabled := False;
  DesabilitarMenu;
  DesabilitarSubMenu;
end;

procedure TFrmPrincipal.DesabilitarSubMenu;
begin
  pnlCadastros.Visible := False;
  pnlMovimentos.Visible := False;
end;

procedure TFrmPrincipal.FormCreate(Sender: TObject);
begin
  DefinePortas;
end;

procedure TFrmPrincipal.FormShow(Sender: TObject);
begin
  lblData.Caption := FormatDateTime('DD/MM/YYYY',Now);
  lblHora.Caption := FormatDateTime('hh:mm',Now);
end;

procedure TFrmPrincipal.HabilitaSubMenu(pPanelMenu, pPanelSub: TPanel);
begin
  DesabilitarMenus;
  pPanelMenu.Caption := pPanelMenu.Caption + ' >> ';
  pPanelSub.Visible := True;
  TmrSubMenu.Enabled := True;
end;

procedure TFrmPrincipal.imgFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmPrincipal.pnlBairrosClick(Sender: TObject);
var
  LForm: TFrmPesquisaBairro;
begin
  ShowForm(TFrmPesquisaBairro, LForm);
end;

procedure TFrmPrincipal.pnlCidadesClick(Sender: TObject);
var
  LForm: TFrmPesquisaCidade;
begin
  ShowForm(TFrmPesquisaCidade, LForm);
end;

procedure TFrmPrincipal.pnlClientesClick(Sender: TObject);
var
  LForm: TFrmPesquisaCliente;
begin
  ShowForm(TFrmPesquisaCliente, LForm);
end;

procedure TFrmPrincipal.pnlFormaPagtoClick(Sender: TObject);
var
  LForm: TFrmPesquisaFormaPagamento;
begin
  ShowForm(TFrmPesquisaFormaPagamento, LForm);
end;

procedure TFrmPrincipal.pnlFuncionarioClick(Sender: TObject);
var
  LForm: TFrmPesquisaFuncionario;
begin
  ShowForm(TFrmPesquisaFuncionario, LForm);
end;

procedure TFrmPrincipal.pnlMenuCadastrosClick(Sender: TObject);
begin
  HabilitaSubMenu(pnlMenuCadastros, pnlCadastros)
end;

procedure TFrmPrincipal.pnlMenuMovimentosClick(Sender: TObject);
begin
  HabilitaSubMenu(pnlMenuMovimentos, PnlMovimentos)
end;

procedure TFrmPrincipal.pnlServicosClick(Sender: TObject);
var
  LForm: TFrmPesquisaServico;
begin
  ShowForm(TFrmPesquisaServico, LForm);
end;

procedure TFrmPrincipal.pnlTipoServicosClick(Sender: TObject);
var
  LForm: TFrmPesquisaTipoServico;
begin
  ShowForm(TFrmPesquisaTipoServico, LForm);
end;

procedure TFrmPrincipal.PnlVendasClick(Sender: TObject);
var
  LForm: TFrmPesquisaVenda;
begin
  ShowForm(TFrmPesquisaVenda, LForm);
end;

procedure TFrmPrincipal.ShowForm(const AFormClass: TComponentClass; var AForm);
begin
  if Assigned(FActiveForm) then
    FActiveForm.Close;

  Application.CreateForm(AFormClass, AForm);
  TForm(AForm).Parent := tbInicial;
  TForm(AForm).Align := TAlign.alClient;
  TForm(AForm).WindowState := TWindowState.wsMaximized;
  TForm(AForm).Show;
  FActiveForm := TForm(AForm);

  DesabilitarMenus;
end;

procedure TFrmPrincipal.TmrHourTimer(Sender: TObject);
begin
  lblHora.Caption := FormatDateTime('hh:mm',Now);
end;

procedure TFrmPrincipal.TmrSubMenuTimer(Sender: TObject);
begin
  TmrSubMenu.Enabled := False;
  DesabilitarMenu;
  DesabilitarSubMenu;
end;

end.
