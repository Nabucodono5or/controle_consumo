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
    if @listaContas.length == 1
      @listaContas[0].qtd_kw_gasto
    elsif @listaContas == []
      raise RuntimeError, "Nenhuma conta cadastrada"
    else
      total ||= @listaContas[0].qtd_kw_gasto

      @listaContas.each do |x|
        if x.qtd_kw_gasto < total
          total = x.qtd_kw_gasto
        end
      end
      total
    end
  end#fim do método mes_menor_consumo
end
