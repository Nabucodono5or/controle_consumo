# encoding: UTF-8

require 'cli_ui'
require 'gerente_contas'
require 'perguntas'

# cli_ui vai sair para perguntas

# responsável por todos os comportamentos do menu
class Client
  attr_reader :lista_resposta

  def initialize
    @cli_ui = CLiUi.new

    @gerente_contas = GerenteContas.new
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
    case op
    when 1
      cadeia_de_perguntas
    when 2
    #  @gerente_contas.mes_menor_consumo
    when 3
    #  @gerente_contas.mes_maior_consumo
    when 4
      listar_contas
    end
  end

  # responsável por setar a classe gerente

  def gerente_contas(args)
    @gerente_contas.entrada_de_dados(args)
  end

  def listar_contas
    @gerente_contas.lista_contas.each do
      puts "#{conta.mes}/#{conta.ano} consumo: #{conta.qtd_kw_gasto} "
    end
  end

  private

  def cadeia_de_perguntas
    @lista_resposta = []
    perguntas = Perguntas.new

    perguntas.lista_acoes.each do |e|
      e
      input = gets
      @lista_resposta << input
    end

#    if valida_conta?(@lista_resposta)
      gerente_contas(lista_resposta)
#    else
#      raise 'Nenhuma conta cadastrada'
#    end
  end

  # integer 0,2,3,4
  # float 1
  # date 5,6
  def valida_conta?(lista)
    valida = true
    if lista[0,2].class && lista[3,4] != Fixnum
      valida = false
    elsif lista[1].class != Float
      valida = false
    elsif lista[5,6].class != String
      valida = false
    end

    return valida
  end
end
