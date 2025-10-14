unit Rp.Controller;

interface

uses
  Rp.Controller.Funcionario,
  Rp.Controller.Bairro,
  Rp.Controller.Cliente,
  Rp.Controller.Servico,
  Rp.Controller.FormaPagamento,
  Rp.Controller.Venda,
  Rp.Controller.VendaParcela,
  Rp.Controller.VendaServico,
  Rp.Controller.Movimento,
  Rp.Controller.MovimentoServico,
  Rp.Model.Entity.Cidade,
  Rp.Controller.Generic,
  Rp.Util.Types,
  System.Classes,
  System.SysUtils;

type
  iController = interface
    ['{897A06ED-8794-4777-A450-533DF07E70B5}']
    function Cidade: iControllerGeneric<TCidade>;
    function Funcionario: iControllerFuncionario;
    function Bairro: iControllerBairro;
    function Cliente: iControllerCliente;
    function Servico: iControllerServico;
    function FormaPagamento: iControllerFormaPagamento;
    function Venda: iControllerVenda;
    function VendaParcela: iControllerVendaParcela;
    function VendaServico: iControllerVendaServico;
    function Movimento: iControllerMovimento;
    function MovimentoServico: iControllerMovimentoServico;

    function Formulario: TProc; overload;
    function Formulario(Formulario: TFormulario): iController; overload;
  end;

  TController = class(TInterfacedObject, iController)
  private
    FCidade: iControllerGeneric<TCidade>;
    FFuncionario: iControllerFuncionario;
    FBairro: iControllerBairro;
    FCliente: iControllerCliente;
    FServico: iControllerServico;
    FFormaPagamento: iControllerFormaPagamento;
    FVenda: iControllerVenda;
    FVendaParcela: iControllerVendaParcela;
    FVendaServico: iControllerVendaServico;
    FMovimento: iControllerMovimento;
    FMovimentoServico: iControllerMovimentoServico;

    FFormulario: TFormulario;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iController;

    function Cidade: iControllerGeneric<TCidade>;
    function Funcionario: iControllerFuncionario;
    function Bairro: iControllerBairro;
    function Cliente: iControllerCliente;
    function Servico: iControllerServico;
    function FormaPagamento: iControllerFormaPagamento;
    function Venda: iControllerVenda;
    function VendaParcela: iControllerVendaParcela;
    function VendaServico: iControllerVendaServico;
    function Movimento: iControllerMovimento;
    function MovimentoServico: iControllerMovimentoServico;

    function Formulario: TProc; overload;
    function Formulario(Formulario: TFormulario): iController; overload;
  end;

implementation

{ TController }

function TController.Cidade: iControllerGeneric<TCidade>;
begin
  if not Assigned(FCidade) then
    FCidade := TControllerCidade.New;
  Result := FCidade;
end;

function TController.Cliente: iControllerCliente;
begin
  if not Assigned(FCliente) then
    FCliente := TControllerCliente.New;
  Result := FCliente;
end;

function TController.Bairro: iControllerBairro;
begin
  if not Assigned(FBairro) then
    FBairro := TControllerBairro.New;
  Result := FBairro;
end;

constructor TController.Create;
begin

end;

destructor TController.Destroy;
begin

  inherited;
end;

function TController.FormaPagamento: iControllerFormaPagamento;
begin
  if not Assigned(FFormaPagamento) then
    FFormaPagamento := TControllerFormaPagamento.New;
  Result := FFormaPagamento;
end;

function TController.Funcionario: iControllerFuncionario;
begin
  if not Assigned(FFuncionario) then
    FFuncionario := TControllerFuncionario.New;
  Result := FFuncionario;
end;

function TController.Formulario: TProc;
begin
  case FFormulario of
    tfCidade          : Result := MovimentoServico;
    tfFuncionario     : Movimento;
    tfBairro          : VendaServico;
    tfCliente         : VendaParcela;
    tfServico         : Venda;
    tfFormaPagamento  : FormaPagamento;
    tfVenda           : Servico;
    tfVendaParcela    : Cliente;
    tfVendaServico    : Bairro;
    tfMovimento       : Funcionario;
    tfMovimentoServico: Cidade;
  end;
end;

function TController.Formulario(Formulario: TFormulario): iController;
begin
  FFormulario := Formulario;
end;

function TController.Movimento: iControllerMovimento;
begin
  if not Assigned(FMovimento) then
    FMovimento := TControllerMovimento.New;
  Result := FMovimento;
end;

function TController.MovimentoServico: iControllerMovimentoServico;
begin
  if not Assigned(FMovimentoServico) then
    FMovimentoServico := TControllerMovimentoServico.New;
  Result := FMovimentoServico;
end;

class function TController.New: iController;
begin
  Result := Self.Create;
end;

function TController.Servico: iControllerServico;
begin
  if not Assigned(FServico) then
    FServico := TControllerServico.New;
  Result := FServico;
end;

function TController.Venda: iControllerVenda;
begin
  if not Assigned(FVenda) then
    FVenda := TControllerVenda.New;
  Result := FVenda;
end;

function TController.VendaParcela: iControllerVendaParcela;
begin
  if not Assigned(FVendaParcela) then
    FVendaParcela := TControllerVendaParcela.New;
  Result := FVendaParcela;
end;

function TController.VendaServico: iControllerVendaServico;
begin
  if not Assigned(FVendaServico) then
    FVendaServico := TControllerVendaServico.New;
  Result := FVendaServico;
end;

end.
