# encoding: UTF-8

require 'gerente_contas'
require 'spec_helper'

describe GerenteContas do
  # implementaremos testes dos métodos
  # testaremos se todos os argumentos foram enviados/recebidos (passed)
  # testaremos se o array da inicialização é incrementado
  # testaremos se possível a inicialização da classe ContaLuz
  # testaremos os métodos de comparação de contas

  subject(:gerente_contas) { GerenteContas.new() }
  let(:conta) { double("conta") }

  describe "#entrada de dados" do
    it "armazena sete argumentos lançados para serem instaciados em uma classe" do
      expect(gerente_contas).to respond_to(:entrada_de_dados).with(7).arguments

      gerente_contas.entrada_de_dados(460, 206.43, 4166, 6, 2005, "4/7/2005", "15/07/2005")
    end
  end
end
