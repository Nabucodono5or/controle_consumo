# encoding: UTF-8
# Gerencia o acesso as contas e seu armazenamento
# versao 1.1 armazena somente contas de luz

require 'conta_luz'

class GerenteContas

attr_reader :qtd_kw_gasto

# inicializa o array de contas
  def initialize()
    listaContas = []
    conta = ContaLuz.new
  end

# principal entrada de dados das contas
  def entrada_de_dados(qtd)
    @qtd_kw_gasto = qtd
  end

end
