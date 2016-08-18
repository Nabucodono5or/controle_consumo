# encoding: UTF-8

require 'client'
require 'spec_helper'

describe Client do
  subject(:client) { Client.new }

  describe '#menu' do
    it 'exibe uma mensagem inicial' do
      texto = "mensagem inicial\n"

      expect{ client.mensagem_inicial }.to output(texto).to_stdout
    end

    it 'exibe o menu de informação' do
      texto = "será exibido um menu aqui\n"

      expect{ client.menu }.to output(texto).to_stdout
    end
  end

  describe '#responde_menu' do
    it 'se eu insiro o valor 1 chamo o método entrada_de_dados da classe gerente_contas'
    it 'se eu insiro o valor 2 obtenho a saída do mes de menor consumo' do
      texto = "Mes Julho, consumo de 460 kw/h\n"

      # preciso de um before com um cadastro de conta ou um mock para fazer o teste funcionar
      expect{ client.responde_menu(2) }.to output(texto).to_stdout
    end

    it 'se eu insiro o valor 3 obtenho a saída do mes de maior consumo'
    it 'se eu insiro o valor 4 chamo obtenho todas as contas cadastradas'
  end

end
