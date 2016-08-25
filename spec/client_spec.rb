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

      expect(client.responde_menu(1)).to respond_to(:cadeia_de_perguntas)

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

end
