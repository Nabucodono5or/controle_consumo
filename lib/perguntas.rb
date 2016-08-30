# encoding: UTF-8

# classe que gera todas as actions da cadeia de perguntas
class Perguntas
  attr_reader :lista_acoes

  def initialize
    @lista_acoes = [
      pergunta_um, pergunta_dois, pergunta_tres, pergunta_quatro,
      pergunta_cinco, pergunta_seis, pergunta_sete
    ]
  end

  def pergunta_um
    'uma pergunta'
  end

  def pergunta_dois
    'segunda pergunta'
  end

  def pergunta_tres
    'terceira pergunta'
  end

  def pergunta_quatro
    'quarta pergunta'
  end

  def pergunta_cinco
    'quinta pergunta'
  end

  def pergunta_seis
    'sexta pergunta'
  end

  def pergunta_sete
    'setima pergunta'
  end
end
