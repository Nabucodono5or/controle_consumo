# encoding: UTF-8

require 'client'
require 'spec_helper'

describe Client do
  subject(:client) { Client.new }

  describe '#initialize' do
    it 'exibe uma mensagem inicial' do
      texto = "mensagem inicial\n"

      expect{ client.mensagem_inicial }.to output(texto).to_stdout
    end
  end

  describe '#menu' do
    it 'exibe o menu de informação' do
      texto = "será exibido um menu aqui\n"

      expect{ client.menu }.to output(texto).to_stdout
    end
  end

  describe '#responde_menu' do
    it 'se eu insiro o valor 1 chamo o método cadeia_de_perguntas responsável pela entrada_de_dados' do
      num = 1

      expect(client).to receive(:cadeia_de_perguntas)

      client.responde_menu(num)
    end

    xit 'se eu insiro o valor 2 obtenho a saída do mes de menor consumo' do
      texto = "Mes Julho, consumo de 460 kw/h\n"
      num = 2

      # preciso de um before com um cadastro de conta ou um mock para fazer o teste funcionar
      expect{ client.responde_menu(num) }.to output(texto).to_stdout
    end

    xit 'se eu insiro o valor 3 obtenho a saída do mes de maior consumo' do
      texto = "Mes Julho, consumo de 460 kw/h\n"
      num = 3

      expect{ client.responde_menu(num) }.to output(texto).to_stdout
    end

    context 'se eu insiro o valor 4' do
      it 'e não obtenho contas cadstradas uma mensagem é levantada'

      xit ' obtenho todas as contas cadastradas' do
        num = 4

        expect(client.responde_menu(num)).to respond_to(:listar_contas)

        client.responde_menu(4)
      end
    end
  end

  # teste do método cadeia_de_perguntas que leva a uma sequência de perguntas e respostas
  context '#cadeia_de_perguntas' do
    before do
      expect(client).to receive(:gets).and_return("uma resposta").exactly(7).times
      lista = [460, 206.43, 4166, 6, 2005, "4/7/2005", "15/07/2005"]
      allow(client).to receive(:gerente_contas)
      allow(client).to receive(:valida_conta?).and_return(true)
    end

    describe '#pergunta_um' do
      it 'será exibido uma pergunta' do
        num = 1
        pergunta = "uma pergunta\n"

        expect{ client.responde_menu(num) }.to output(include(pergunta)).to_stdout
      end
    end

    describe '#pergunta_dois' do
      it 'será exibido uma pergunta' do
        num = 1
        pergunta = "segunda pergunta\n"

        expect{ client.responde_menu(num) }.to output(include(pergunta)).to_stdout
      end
    end

    describe '#pergunta_tres' do
      it 'será exibido uma pergunta' do
        num = 1
        pergunta = "terceira pergunta\n"

        expect{ client.responde_menu(num) }.to output(include(pergunta)).to_stdout
      end
    end

    describe '#pergunta_quatro' do
      it 'será exibido uma pergunta' do
        num = 1
        pergunta = "quarta pergunta\n"

        expect{ client.responde_menu(num) }.to output(include(pergunta)).to_stdout
      end
    end

    describe '#pergunta_cinco' do
      it 'será exibido uma pergunta' do
        num = 1
        pergunta = "quinta pergunta\n"

        expect{ client.responde_menu(num) }.to output(include(pergunta)).to_stdout
      end
    end

    describe '#pergunta_seis' do
      it 'será exibido uma pergunta' do
        num = 1
        pergunta = "sexta pergunta\n"

        expect{ client.responde_menu(num) }.to output(include(pergunta)).to_stdout
      end
    end

    describe '#pergunta_sete' do
      it 'será exibido uma pergunta' do
        num = 1
        pergunta = "setima pergunta\n"

        expect{ client.responde_menu(num) }.to output(include(pergunta)).to_stdout
      end
    end

    describe '#@lista_resposta' do
      it 'armazenará uma entrada como resposta' do
        client.responde_menu(1)

        expect(client.instance_variable_get(:@lista_resposta)).not_to eql(nil)
      end

      it 'armazenará mais de uma resposta' do
        client.responde_menu(1)
        numero = client.instance_variable_get(:@lista_resposta)

        expect(numero.length).to be > 1
      end
    end
  end

  describe '#gerente_contas' do
    before do
      # 460, 206.43, 4166, 6, 2005, "4/7/2005", "15/07/2005"
#      expect(client).to receive(:gets).and_return(460)#qtd_kw_gasto
#      expect(client).to receive(:gets).and_return(206.43) #valor_pagar
#      expect(client).to receive(:gets).and_return(4166) #numero_leitura
#      expect(client).to receive(:gets).and_return(6) #mes
#      expect(client).to receive(:gets).and_return(2005) #ano
#      expect(client).to receive(:gets).and_return('4/07/2005') #emissao
#      expect(client).to receive(:gets).and_return('15/07/2005') #vencimento
    end

    it 'lista  todas as contas' do
      conta1 = double("conta", :mes => 6, :ano => 2005, :qtd_kw_gasto => 460)
      conta2 = double("conta", :mes => 7, :ano => 2005, :qtd_kw_gasto => 320)
      listinha = [conta1, conta2]
      allow(client.instance_variable_get(:@gerente_contas)).to receive(:lista_contas).and_return(listinha)

      expect(client.responde_menu(4)).to eq("6/2005 consumo: 460")

      client.responde_menu(4)
    end
  end

  describe '#valida_conta?' do
    before do
      expect(client).to receive(:gets).and_return(460)#qtd_kw_gasto
      expect(client).to receive(:gets).and_return(206.43) #valor_pagar
      expect(client).to receive(:gets).and_return(4166) #numero_leitura
      expect(client).to receive(:gets).and_return(6) #mes
      expect(client).to receive(:gets).and_return(2005) #ano
      expect(client).to receive(:gets).and_return('4/07/2005') #emissao
      expect(client).to receive(:gets).and_return('15/07/2005') #vencimento

    end

    it 'recebe os dados de uma conta para validar' do
      lista = [460, 206.43, 4166, 6, 2005, "4/07/2005", "15/07/2005"]
      allow(client).to receive(:gerente_contas)
      allow(client).to receive(:valida_conta?).and_return(true)

      expect(client).to receive(:valida_conta?).with(lista)

      client.responde_menu(1)
    end

    it 'recusa os dados de uma conta lançando uma mensagem e retorna cadeia_de_perguntas com opção 1' do
      lista = [460, 206.43, 4166, 6, "2005", "4/07/2005", "15/07/2005"]
      gerente = double("GerenteContas")
      allow(client).to receive(:gerente_contas).and_return(gerente)
      allow(client).to receive(:valida_conta?).and_return(false)

      expect{ client.responde_menu(1) }.to raise_error(StandardError)
    end

    it 'retorna true para os dados' do
      gerente = double("GerenteContas")
      allow(client).to receive(:gerente_contas).and_return(gerente)

      expect{ client.responde_menu(1) }.not_to raise_error
    end
  end
end
