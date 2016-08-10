# encoding: UTF-8
# Gerencia o acesso as contas e seu armazenamento
# versao 1.1 armazena somente contas de luz

require 'conta_luz'

class GerenteContas

# inicializa o array de contas
  def initialize()
    listaContas = []
    @conta = ContaLuz.new
  end

# principal entrada de dados das contas
  def entrada_de_dados(qtd, valorPagar, numeroLeitura, mes, ano, emissao, vencimento)
    @conta.qtd_kw_gasto = qtd
    @conta.valor_pagar = valorPagar
    @conta.numero_leitura = numeroLeitura
    @conta.mes = mes
    @conta.ano = ano
    @conta.emissao = emissao
    @conta.vencimento = vencimento
  end

end
