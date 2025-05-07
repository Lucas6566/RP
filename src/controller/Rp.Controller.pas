unit Rp.Controller;

interface

uses
  Rp.Controller.Cidade,
  Rp.Controller.Funcionario,
  Rp.Controller.Bairro,
  Rp.Controller.Cliente,
  Rp.Controller.TipoServico,
  Rp.Controller.Servico,
  Rp.Controller.FormaPagamento,
  Rp.Controller.Venda,
  Rp.Controller.VendaParcela,
  Rp.Controller.VendaServico;

type
  iController = interface
    ['{897A06ED-8794-4777-A450-533DF07E70B5}']
    function Cidade: iControllerCidade;
    function Funcionario: iControllerFuncionario;
    function Bairro: iControllerBairro;
    function Cliente: iControllerCliente;
    function TipoServico: iControllerTipoServico;
    function Servico: iControllerServico;
    function FormaPagamento: iControllerFormaPagamento;
    function Venda: iControllerVenda;
    function VendaParcela: iControllerVendaParcela;
    function VendaServico: iControllerVendaServico;
  end;

  TController = class(TInterfacedObject, iController)
  private

  public
    constructor Create;
    destructor Destroy; override;
    class function New: iController;

    function Cidade: iControllerCidade;
    function Funcionario: iControllerFuncionario;
    function Bairro: iControllerBairro;
    function Cliente: iControllerCliente;
    function TipoServico: iControllerTipoServico;
    function Servico: iControllerServico;
    function FormaPagamento: iControllerFormaPagamento;
    function Venda: iControllerVenda;
    function VendaParcela: iControllerVendaParcela;
    function VendaServico: iControllerVendaServico;
  end;

implementation

{ TController }

function TController.Cidade: iControllerCidade;
begin
  Result := TControllerCidade.New;
end;

function TController.Cliente: iControllerCliente;
begin
  Result := TControllerCliente.New;
end;

function TController.Bairro: iControllerBairro;
begin
  Result := TControllerBairro.New;
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
  Result := TControllerFormaPagamento.New;
end;

function TController.Funcionario: iControllerFuncionario;
begin
  Result := TControllerFuncionario.New;
end;

class function TController.New: iController;
begin
  Result := Self.Create;
end;

function TController.Servico: iControllerServico;
begin
  Result := TControllerServico.New;
end;

function TController.TipoServico: iControllerTipoServico;
begin
  Result := TControllerTipoServico.New;
end;

function TController.Venda: iControllerVenda;
begin
  Result := TControllerVenda.New;
end;

function TController.VendaParcela: iControllerVendaParcela;
begin
  Result := TControllerVendaParcela.New;
end;

function TController.VendaServico: iControllerVendaServico;
begin
  Result := TControllerVendaServico.New;
end;

end.
