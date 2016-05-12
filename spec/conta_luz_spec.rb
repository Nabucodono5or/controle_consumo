# encoding: UTF-8

require 'conta_luz'
require 'spec_helper'

describe ContaLuz do
   # aqui implementaremos os testes dos métodos
    subject(:conta_luz) { ContaLuz.new() }


    describe "#qtdKwGasto" do
        it "devolve a quantidade de kw gasto" do
            qtd_kw_gasto = 460
            conta_luz.qtd_kw_gasto= qtd_kw_gasto

            expect(conta_luz.qtd_kw_gasto).to eq(qtd_kw_gasto)

            conta_luz.qtd_kw_gasto
        end

        it "armazena a quantidade de kw gasto" do
            qtd_kw_gasto = 460            

            expect(conta_luz).to receive(:qtd_kw_gasto=).with(460)

            conta_luz.qtd_kw_gasto= 460
        end        
    end# fim do describe #qtdKwGasto

    describe "#valorPagar" do
        it "armazena o valor a pagar" do
            valor_pagar = 206,43

            expect(conta_luz).to receive(:valor_pagar=).with(valor_pagar)

            conta_luz.valor_pagar= 206,43
        end

        it "retorna o valor a ser pago" do
            valor_pagar = 206,43
            conta_luz.valor_pagar= valor_pagar

            expect(conta_luz.valor_pagar).to eq(valor_pagar)

            conta_luz.valor_pagar
        end

    end#fim do describe #valorPagar

    describe "#numeroLeitura" do
        it "armazena numero de leitura" do
            numero_leitura = 4166

            expect(conta_luz).to receive(:numero_leitura=).with(numero_leitura)

            conta_luz.numero_leitura= 4166
        end

        it "recupera numero de leitura" do
            numero_leitura = 4166
            conta_luz.numero_leitura= numero_leitura

            expect(conta_luz.numero_leitura).to eq(numero_leitura)

            conta_luz.numero_leitura
        end
    end# fim do describe numero_leitura

    describe "#vencimento" do
        it "armazena a data de vencimento" do
            date = "15/07/2005"

            expect(conta_luz).to receive(:vencimento=).with(date)

            conta_luz.vencimento= "15/07/2005"
        end

        it "retorna a data de vencimento" do
            date = "15/7/2005"
            conta_luz.vencimento= "15/07/2005"

            expect(conta_luz.vencimento).to eq(date)

            conta_luz.vencimento
        end
        
    end#fim do describe #vencimento

end# fim do teste da classe ContaLuz
