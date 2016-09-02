# encoding: UTF-8

require 'cli_ui'
require 'gerente_contas'
require 'perguntas'

# cli_ui vai sair para perguntas

# responsável por todos os comportamentos do menu
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

  def listar_contas
    @gerente_contas.lista_contas.each do |conta|
      puts "#{conta.mes}/#{conta.ano} consumo: #{conta.qtd_kw_gasto} "
    end
  end

  private

  def cadeia_de_perguntas
    perguntas = Perguntas.new
    @lista_resposta = []

    perguntas.lista_acoes.each do |e|
      e
      input = gets
      @lista_resposta << input
    end
  end
end
