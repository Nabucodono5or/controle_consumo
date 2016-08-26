# encoding: UTF-8

require 'cli_ui'
require 'gerente_contas'

class Client
  def initialize
    @cli_ui = CLiUi.new
  end

  def mensagem_inicial
    texto = 'mensagem inicial'

    @cli_ui.write(texto)
  end

  def menu
    texto = 'será exibido um menu aqui'

    @cli_ui.write(texto)
  end

  def responde_menu(op)
    gerente_contas

    case op
    when 1
      cadeia_de_perguntas
    when 2
    #  @gerente_contas.mes_menor_consumo
    when 3
    #  @gerente_contas.mes_maior_consumo
    when 4
    #  listar_contas
    end
  end

  # responsável por setar a classe gerente

  def gerente_contas(*args)
    @gerente_contas = GerenteContas.new
    # @gerente_contas.entrada_de_dados(args)
  end

  private

  def cadeia_de_perguntas
    controle = true

    while controle
      return pergunta_um
      # dois = pergunta_dois
      # tres = pergunta_tres
      # quatro = pergunta_quatro
      # cinco = pergunta_cinco
      # seis = pergunta_seis
      # sete = pergunta_sete

      # lista_resposta[um, dois, tres, quatro, cinco, seis, sete]
      controle = false
    end
  end

  def listar_contas
    @gerente_contas.lista_contas.each do |conta|
      puts "#{conta.mes}/#{conta.ano} consumo: #{conta.qtd_kw_gasto} "
    end
  end

  def pergunta_um
    'uma pergunta'
  end
end
