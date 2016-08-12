# encoding: UTF-8
# Gerencia o acesso as contas e seu armazenamento
# versao 1.1 armazena somente contas de luz

require 'conta_luz'

class GerenteContas
  # inicializa o array de contas
  def initialize()
    @listaContas = []
  end

  # principal entrada de dados das contas
  def entrada_de_dados(qtd, valorPagar, numeroLeitura, mes, ano, emissao, vencimento)
    @conta = ContaLuz.new

    @conta.qtd_kw_gasto = qtd
    @conta.valor_pagar = valorPagar
    @conta.numero_leitura = numeroLeitura
    @conta.mes = mes
    @conta.ano = ano
    @conta.emissao = emissao
    @conta.vencimento = vencimento

    @listaContas << @conta
  end

  def mes_menor_consumo
    calculo_mes_menor unless testando_lista_de_contas
  end#fim do método mes_menor_consumo

  def mes_maior_consumo
    calculo_mes_maior unless testando_lista_de_contas
  end

  private

  def calculo_mes_menor
    total ||= @listaContas[0].qtd_kw_gasto

    @listaContas.each do |conta|
      if conta.qtd_kw_gasto < total
        total = conta.qtd_kw_gasto
      end
    end

    total
  end

  def calculo_mes_maior
    total ||= @listaContas[0].qtd_kw_gasto

    @listaContas.each do |conta|
      if conta.qtd_kw_gasto > total
        total = conta.qtd_kw_gasto
      end
    end

    total
  end

  def testando_lista_de_contas
    if @listaContas == []
      raise RuntimeError, "Nenhuma conta cadastrada"
    end
  end
end
