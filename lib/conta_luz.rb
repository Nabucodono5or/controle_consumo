# encoding: UTF-8
require 'data_nominal'

# informations of an electric bill
class ContaLuz
  attr_accessor :formato_europeu
  attr_accessor :qtd_kw_gasto
  attr_accessor :valor_pagar
  attr_accessor :numero_leitura
  attr_reader :mes
  attr_accessor :ano
  attr_reader :vencimento
  attr_reader :emissao

  # metodo incializador
  def initialize
    @formato_europeu = '%d/%m/%Y'
  end

  # metodos que modificam dados
  def vencimento=(string)
    @vencimento = Date.strptime(string, formato_europeu)
  end

  def formatar_data(data_p)
    data_p.day.to_s << '/' << data_p.month.to_s << '/' << data_p.year.to_s
  end

  def emissao=(string)
    @emissao = Date.strptime(string, formato_europeu)
  end

  def mes=(mes)
    @mes = mes.to_i
  end

  def nominal
    @nominal = DataNominal.new mes if mes
    @nominal.nominal
  end
end # fim da classe ContaLuz
