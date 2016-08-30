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
    puts 'uma pergunta'
    @um = gets.chomp
  end

  def pergunta_dois
    puts 'segunda pergunta'
  end

  def pergunta_tres
    puts 'terceira pergunta'
  end

  def pergunta_quatro
    puts 'quarta pergunta'
  end

  def pergunta_cinco
    puts 'quinta pergunta'
  end

  def pergunta_seis
    puts 'sexta pergunta'
  end

  def pergunta_sete
    puts 'setima pergunta'
  end
end
