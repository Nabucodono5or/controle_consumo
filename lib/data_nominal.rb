# encoding: UTF-8

#Classe que converte um mes numérico em sua representação nominal

class DataNominal
    
    def initialize(mes)
        @mes = mes
        @mes += 1    
    end

    def nominal
        @nome_mes = converte
    end

    def converte
      array_mes = ["Janeiro", "Fevereiro", "Março", "Maio", "Abril", "Maio", "Junho", "Julho", "Agosto", "Setembro", "Outubro", "Novembro", "Dezembro"]
      array_mes[@mes]
    end
    
end#fim da classe DataNominal
