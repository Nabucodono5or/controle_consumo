# encoding: UTF-8

require 'gerente_contas'
require 'spec_helper'

describe GerenteContas do
  # implementaremos testes dos métodos
  # testaremos se todos os argumentos foram enviados/recebidos
  # testaremos se o array da inicialização é incrementado
  # testaremos se possível a inicialização da classe ContaLuz
  # testaremos os métodos de comparação de contas

  subject(:gerente_contas) { GerenteContas.new() }
  let(:conta) { double("conta") }

  describe "#entrada de dados" do

    it "armazena o número de leitura da conta como argumento" do
      expect(gerente_contas).to respond_to(:entrada_de_dados).with(3).arguments

      gerente_contas.entrada_de_dados(460, 206.43, 4166)
    end

    it "armazena o mes como argumento" do
      expect(gerente_contas).to respond_to(:entrada_de_dados).with(4).arguments

      gerente_contas.entrada_de_dados(460, 206.43, 4166, 6)
    end
    it "armazena o ano como argumento"
    it "aramazena a data de emissao como argumento"
    it "armazena a data de vencimento como argumento"
  end
end
