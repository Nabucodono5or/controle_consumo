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

end
