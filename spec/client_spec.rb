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
    describe '#pergunta_um' do
      it 'será exibido uma pergunta' do
        num = 1
        pergunta = "uma pergunta\n"

        expect{ client.responde_menu(num) }.to output(include(pergunta)).to_stdout
      end

      xit 'armazenará uma entrada como resposta' do

      end
    end

    describe '#pergunta_dois' do
      it 'será exibido uma pergunta' do
        num = 1
        pergunta = "segunda pergunta\n"

        expect{ client.responde_menu(num) }.to output(include(pergunta)).to_stdout
      end

      it 'armazenará uma entrada como resposta'
    end

    describe '#pergunta_tres' do
      it 'será exibido uma pergunta' do
        num = 1
        pergunta = "terceira pergunta\n"

        expect{ client.responde_menu(num) }.to output(include(pergunta)).to_stdout
      end
      it 'armazenará uma entrada como resposta'
    end

    describe '#pergunta_quatro' do
      it 'será exibido uma pergunta' do
        num = 1
        pergunta = "quarta pergunta\n"

        expect{ client.responde_menu(num) }.to output(include(pergunta)).to_stdout
      end
      it 'armazenará uma entrada como resposta'
    end

    describe '#pergunta_cinco' do
      it 'será exibido uma pergunta' do
        num = 1
        pergunta = "quinta pergunta\n"

        expect{ client.responde_menu(num) }.to output(include(pergunta)).to_stdout
      end
      it 'armazenará uma entrada como resposta'
    end

    describe '#pergunta_seis' do
      it 'será exibido uma pergunta' do
        num = 1
        pergunta = "sexta pergunta\n"

        expect{ client.responde_menu(num) }.to output(include(pergunta)).to_stdout
      end
      it 'armazenará uma entrada como resposta'
    end

    describe '#pergunta_sete' do
      it 'será exibido uma pergunta' do
        num = 1
        pergunta = "setima pergunta\n"

        expect{ client.responde_menu(num) }.to output(include(pergunta)).to_stdout
      end
      it 'armazenará uma entrada como resposta'
    end
  end
end
