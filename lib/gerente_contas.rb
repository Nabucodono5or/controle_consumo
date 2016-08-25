# encoding: UTF-8
# versao 1.1 armazena somente contas de luz

require 'conta_luz'

# Gerencia o acesso as contas e seu armazenamento
class GerenteContas
  attr_reader :lista_contas

  # inicializa o array de contas
  def initialize
    @lista_contas = []
  end

  # principal entrada de dados das contas
  def entrada_de_dados(*args)
    @conta = ContaLuz.new

    @conta.qtd_kw_gasto = args[0]
    @conta.valor_pagar = args[1]
    @conta.numero_leitura = args[2]
    @conta.mes = args[3]
    @conta.ano = args[4]
    @conta.emissao = args[5]
    @conta.vencimento = args[6]

    @lista_contas << @conta
  end

  def mes_menor_consumo
    if calculo
      puts "Mes #{@menor.nominal}, consumo de #{@menor.qtd_kw_gasto} kw/h"
    end
  end # end method mes_menor_consumo

  def mes_maior_consumo
    if calculo
      puts "Mes #{@maior.nominal}, consumo de #{@maior.qtd_kw_gasto} kw/h"
    end
  end

  private

  def calculo
    if @lista_contas != []
      @menor ||= @maior ||= @lista_contas[0]

      @lista_contas.each do |conta|
        if conta.qtd_kw_gasto < @menor.qtd_kw_gasto
          @menor = conta
        end

        if conta.qtd_kw_gasto > @maior.qtd_kw_gasto
          @maior = conta
        end
      end

    else
      raise 'Nenhuma conta cadastrada'
    end
  end
end
