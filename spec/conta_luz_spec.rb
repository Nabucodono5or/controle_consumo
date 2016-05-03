# encoding: UTF-8

require 'conta_luz'
require 'spec_helper'

describe ContaLuz do
   # aqui implementaremos os testes dos métodos
    subject(:conta_luz) { ContaLuz.new() }


    describe "#qtdKwGasto" do
        it "devolve a quantidade de kw gasto" do
            qtdKwGasto = 460

            expect(conta_luz.qtdKwGasto).to eq(qtdKwGasto)

            conta_luz.qtdKwGasto
        end

        it "armazena a quantidade de kw gasto" do
            qtdkwGasto = 460            

            expect(conta_luz).to receive(:qtdKwGasto=).with(460)

            conta_luz.qtdKwGasto= 460
        end        
    end

end
