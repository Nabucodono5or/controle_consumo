# encoding: UTF-8

require 'conta_luz'
require 'spec_helper'

describe ContaLuz do
   # aqui implementaremos os testes dos métodos
    subject(:conta_luz) { ContaLuz.new() }
	let(:data_nominal) { double("nominal").as_null_object }

 
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
          date = Date.strptime("15/07/2005",'%d/%m/%Y')
          conta_luz.vencimento= "15/07/2005"

          expect(conta_luz.vencimento).to eq(date)

          conta_luz.vencimento
        end
        
    end#fim do describe #vencimento


    describe "#formatar_data" do
        it "retorna o vencimento no formato string" do
          date = "15/7/2005"
          conta_luz.vencimento = "15/07/2005"

          expect(conta_luz.formatar_data(conta_luz.vencimento)).to eq(date)

          conta_luz.formatar_data(conta_luz.vencimento)
        end

        it "retorna a data da emissão no formato string" do
          date = "4/7/2005"
          conta_luz.emissao = "04/07/2005"

          expect(conta_luz.formatar_data(conta_luz.emissao)).to eq(date)

          conta_luz.formatar_data(conta_luz.emissao)
        end

    end#fim do describe #formatar_data


    describe "#data_emissao" do
        it "armazena data de emissão" do
          date = "04/07/2005"

          expect(conta_luz).to receive(:emissao=).with(date)

          conta_luz.emissao= "04/07/2005"
        end

        it "retorna data de emissao" do
          date = Date.strptime("4/7/2005", '%d/%m/%Y')
          conta_luz.emissao= "04/07/2005"

          expect(conta_luz.emissao).to eq(date)

          conta_luz.emissao
        end

    end# fim do describe data_vencimento


    describe "#mes" do
        it "armazena o mes da conta" do
          mes = 6

          expect(conta_luz).to receive(:mes=).with(mes) 

          conta_luz.mes= mes         
        end

        it "o valor do mes é um inteiro" do
          mes = 6
          conta_luz.mes= mes

          expect(conta_luz.mes).to be_a_kind_of(Fixnum)

          conta_luz.mes
        end

        it "retorna o mes da conta" do
          mes = 6
          conta_luz.mes= 6

          expect(conta_luz.mes).to eq(mes)

          conta_luz.mes
        end
        
    end#fim do describe mes


    describe "#ano" do
        it "armazena o ano da conta" do
          ano = 2005
            
          expect(conta_luz).to receive(:ano=).with(ano)

          conta_luz.ano= 2005
        end
        it "retorna o ano da conta" do
          ano = 2005
          conta_luz.ano= 2005

          expect(conta_luz.ano).to eq(ano)

          conta_luz.ano
        end
    end#fim do describe ano


    describe "#nominal"  do
        it "retorna o mes nominal" do
          conta_luz.mes= 6

          expect(conta_luz.nominal).to eq("Julho")

          conta_luz.nominal
        end

        it "armazena o mes nominal" do
          conta_luz.mes= 6

          expect(conta_luz).to receive(:nominal)

          conta_luz.nominal
        end
    end#fim do describe nominal

    

end# fim do teste da classe ContaLuz
