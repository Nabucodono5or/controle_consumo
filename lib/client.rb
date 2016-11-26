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
      mes_menor
    when 3
      mes_maior
    when 4
      listar_contas
    end
  end

  # responsável por setar a classe gerente

  def gerente_contas(args)
    @gerente_contas.entrada_de_dados(args)
  end

  def listar_contas
    li = @gerente_contas.lista_contas

    if !vazio?(li)
      li.each do |c|
        puts "#{c.mes}/#{c.ano} consumo: #{c.qtd_kw_gasto} "
      end
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

    if valida_conta?(@lista_resposta)
      gerente_contas(@lista_resposta)
    else
      raise 'Nenhuma conta cadastrada'
      # lança uma valor false para controlar o menu usando rescue
      # Caso dẽ errado refatorar todo o código para eliminar valida dados por um rescue gerente_contas
    end
  end

  def mes_menor
    @gerente_contas.mes_menor_consumo
  end

  def mes_maior
    @gerente_contas.mes_maior_consumo
  end

  def vazio?(x)
    if x.empty?
      raise 'Nenhuma conta cadastrada'
    end
  end

  # integer 0,2,3,4
  # float 1
  # date 5,6
  def valida_conta?(lista)
    valida = true

    for x in [lista[0], lista[2], lista[3], lista[4]]
      valida = false if x.class != Fixnum
    end

    if valida
      valida = false if lista[1].class != Float
      valida = false if lista[5].class != String
      valida = false if lista[6].class != String
    end
    return valida
  end
end
