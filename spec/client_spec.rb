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
    before do
      texto = "Mes Julho, consumo de 460 kw/h\n"

      allow(client.responde_menu(2)).to receive(:mes_menor_consumo).and_return(puts("Mes Julho, consumo de 460 kw/h"))
    end

    it 'se eu insiro o valor 1 chamo o método entrada_de_dados da classe gerente_contas'
    it 'se eu insiro o valor 2 obtenho a saída do mes de menor consumo' do
      texto = "Mes Julho, consumo de 460 kw/h\n"
      num = 2

      # preciso de um before com um cadastro de conta ou um mock para fazer o teste funcionar
      expect{ client.responde_menu(num) }.to output(texto).to_stdout
    end

    it 'se eu insiro o valor 3 obtenho a saída do mes de maior consumo'
    it 'se eu insiro o valor 4 chamo obtenho todas as contas cadastradas'
  end

end
