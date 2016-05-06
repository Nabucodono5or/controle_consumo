# encoding: UTF-8
# informações de uma conta de luz qualquer

class ContaLuz
 # codigo para implementar

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
        @vencimento = string
    end
end#fim da classe ContaLuz
