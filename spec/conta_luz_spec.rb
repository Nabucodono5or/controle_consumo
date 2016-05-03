# encoding: UTF-8

require 'conta_luz'
require 'spec_helper'

describe ContaLuz do
   # aqui implementaremos os testes dos métodos
    subject(:conta_luz) { ContaLuz.new() }


    describe "#qtdKwGasto" do
        it "devolve a quantidade de kw gasto" do
            qtdKwGasto = 460
            conta_luz.qtdKwGasto= qtdKwGasto

            expect(conta_luz.qtdKwGasto).to eq(qtdKwGasto)

            conta_luz.qtdKwGasto
        end

        it "armazena a quantidade de kw gasto" do
            qtdkwGasto = 460            

            expect(conta_luz).to receive(:qtdKwGasto=).with(460)

            conta_luz.qtdKwGasto= 460
        end        
    end# fim do describe #qtdKwGasto

    describe "#valorPagar" do
        it "armazena o valor a pagar" do
            valorPagar = 206,43

            expect(conta_luz).to receive(:valorPagar=).with(valorPagar)

            conta_luz.valorPagar= 206,43
        end

        it "retorna o valor a ser pago" do
            valorPagar = 206,43
            conta_luz.valorPagar= valorPagar

            expect(conta_luz.valorPagar).to eq(valorPagar)

            conta_luz.valorPagar
        end

    end#fim do describe #valorPagar


end# fim do teste da classe ContaLuz
