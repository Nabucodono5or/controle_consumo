# encoding: UTF-8
# informações de uma conta de luz qualquer

class ContaLuz
 # codigo para implementar
    attr_accessor :formato_europeu

    def initialize
        @formato_europeu = '%d/%m/%Y'
    end

    def qtd_kw_gasto
       @qtd_kw_gasto
    end

    def qtd_kw_gasto=(qtd_gasto)
       @qtd_kw_gasto = qtd_gasto
    end

    def valor_pagar=(valor)
        @valor_pagar = valor
    end
    
    def valor_pagar
        @valor_pagar
    end

    def numero_leitura=(numero)
        @numero_leitura = numero
    end

    def numero_leitura
        @numero_leitura
    end

    def vencimento=(string)        
        @vencimento = Date.strptime(string, formato_europeu)
    end

    def vencimento
        @vencimento.day.to_s << "/" << @vencimento.month.to_s << "/" << @vencimento.year.to_s
    end

    def emissao=(string)
        @emissao = Date.strptime(string, formato_europeu)        
    end

    def emissao
        @emissao.day.to_s << "/" << @emissao.month.to_s << "/" << @emissao.year.to_s
    end

    def mes=(mes)
        @mes = mes.to_i
    end

    def mes
        @mes
    end
    
    
end#fim da classe ContaLuz
