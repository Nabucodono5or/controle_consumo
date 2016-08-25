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
    when op == 2
      @gerente_contas.mes_menor_consumo
    when op == 3
      @gerente_contas.mes_maior_consumo
    end
  end

  def gerente_contas(*args)
    @gerente_contas = GerenteContas.new
  end
end
