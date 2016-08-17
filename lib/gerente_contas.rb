# encoding: UTF-8
# versao 1.1 armazena somente contas de luz

require 'conta_luz'

# Gerencia o acesso as contas e seu armazenamento
class GerenteContas
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
    calculo_mes_menor unless testando_lista_de_contas
  end # end method mes_menor_consumo

  def mes_maior_consumo
    calculo_mes_maior unless testando_lista_de_contas
  end

  private

  # calculo_mes_menor e  calculo_mes_maior ambos repetem a mesma linha de calculo
  # isso pode ser melhorado com a criação de um novo método privado que trata o calculo de
  # maior ou menor consumo diferenciando apenas nas variáveis/ porém isso trata de
  # ter acumular vairáveis de instacia

  def calculo
    @menor ||= @maior ||= @lista_contas[0]

    @lista_contas.each do |conta|
      if conta.qtd_kw_gasto < @menor.qtd_kw_gasto
        @menor = conta
      end

      if conta.qtd_kw_gasto > @maior.qtd_kw_gasto
        @maior = conta
      end
    end
  end

  def calculo_mes_menor
    calculo
    puts "Mes #{@menor.nominal}, consumo de #{@menor.qtd_kw_gasto} kw/h"
  end

  def calculo_mes_maior
    calculo
    puts "Mes #{@maior.nominal}, consumo de #{@maior.qtd_kw_gasto} kw/h"
  end

  def testando_lista_de_contas
    if @lista_contas == []
      raise RuntimeError, "Nenhuma conta cadastrada"
    end
  end
end
