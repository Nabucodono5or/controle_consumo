# encoding: UTF-8

require 'gerente_contas'
require 'spec_helper'

describe GerenteContas do
  # implementaremos testes dos métodos
  # testaremos se todos os argumentos foram enviados/recebidos (passed)
  # testaremos se inicializamos uma conta de luz (passed)
  # testaremos se o array da inicialização é incrementado
  # testaremos se possível a inicialização da classe ContaLuz
  # testaremos os métodos de comparação de contas

  subject(:gerente_contas) { GerenteContas.new() }

  describe "#initialize" do
    # Não identifiquei nenhum método melhor para testar se existe uma instancia
    # da classe ContaLuz sem chamá-la ao teste
    it "instacia uma conta de luz" do
      expect(gerente_contas.instance_variable_get(:@conta)).not_to eql(nil)
    end

    # a princípio a lista será privada
    it "A lista de contas de estar vazia" do
      expect(gerente_contas.instance_variable_get(:@listaContas)).to be_empty
    end
  end

  describe "#entrada de dados" do
    it "armazena sete argumentos lançados para serem instaciados em uma classe" do
      expect(gerente_contas).to respond_to(:entrada_de_dados).with(7).arguments

      gerente_contas.entrada_de_dados(460, 206.43, 4166, 6, 2005, "4/7/2005", "15/07/2005")
    end

    it "O array será incrementado em um" do
      gerente_contas.entrada_de_dados(460, 206.43, 4166, 6, 2005, "4/7/2005", "15/07/2005")

      expect(gerente_contas.instance_variable_get(:@listaContas)).not_to be_empty
    end

    it "O array será incrementado em dois" do
      gerente_contas.entrada_de_dados(460, 206.43, 4166, 6, 2005, "4/7/2005", "15/07/2005")
      gerente_contas.entrada_de_dados(350, 157.07, 4201, 8, 2005, "02/08/2005", "15/08/2005")
      lista = gerente_contas.instance_variable_get(:@listaContas)

      expect(lista.length).to be > 1
    end
  end
end
