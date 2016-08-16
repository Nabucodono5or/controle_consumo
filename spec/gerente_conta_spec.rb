# encoding: UTF-8

require 'gerente_contas'
require 'spec_helper'

describe GerenteContas do
  # implementaremos testes dos métodos
  # testaremos se todos os argumentos foram enviados/recebidos (passed)
  # testaremos se inicializamos uma conta de luz (passed)
  # testaremos se o array da inicialização é incrementado (passed)
  # testaremos se possível a inicialização da classe ContaLuz (passed)
  # testaremos os métodos de comparação de contas (passed)
  # devemos acrescentar transferência de dados extras para possíveis exigências

  subject(:gerente_contas) { GerenteContas.new() }

  describe "#initialize" do
    # a princípio a lista será privada
    it "A lista de contas deve estar vazia" do
      expect(gerente_contas.instance_variable_get(:@listaContas)).to be_empty
    end
  end

  describe "#entrada_de_dados" do
    # Não identifiquei nenhum método melhor para testar se existe uma instancia
    # da classe ContaLuz sem chamá-la ao teste
    it "instacia uma conta de luz" do
      gerente_contas.entrada_de_dados(460, 206.43, 4166, 6, 2005, "4/7/2005", "15/07/2005")

      expect(gerente_contas.instance_variable_get(:@conta)).not_to eql(nil)
    end

    it "armazena sete argumentos lançados para serem instaciados em uma classe" do
      expect(gerente_contas).to respond_to(:entrada_de_dados).with(7).arguments

      gerente_contas.entrada_de_dados(460, 206.43, 4166, 6, 2005, "4/7/2005", "15/07/2005")
    end

    it "O array pode ser incrementado em um" do
      gerente_contas.entrada_de_dados(460, 206.43, 4166, 6, 2005, "4/7/2005", "15/07/2005")

      expect(gerente_contas.instance_variable_get(:@listaContas)).not_to be_empty
    end

    it "O array pode ser incrementado em dois" do
      gerente_contas.entrada_de_dados(460, 206.43, 4166, 6, 2005, "4/7/2005", "15/07/2005")
      gerente_contas.entrada_de_dados(350, 157.07, 4201, 8, 2005, "02/08/2005", "15/08/2005")
      lista = gerente_contas.instance_variable_get(:@listaContas)

      expect(lista.length).to be > 1

      lista.length
    end
  end

  describe "#mes_menor_consumo" do
    it "retorna a conta de menor consumo sem calculo caso haja uma única conta cadastrada" do
      menor = "Mes 6, consumo de 460 kw/h\n"
      gerente_contas.entrada_de_dados(460, 206.43, 4166, 6, 2005, "4/7/2005", "15/07/2005")

      expect{ gerente_contas.mes_menor_consumo }.to output(menor).to_stdout
    end

    it "levanta um erro caso não haja entrada de dados, ou seja a lista de contas é nula" do
      expect{ gerente_contas.mes_menor_consumo }.to raise_error (RuntimeError)
    end

    it "compara o qtdKwGasto de menor consumo entre todas as contas na lista de contas" do
      gerente_contas.entrada_de_dados(460, 206.43, 4166, 6, 2005, "4/7/2005", "15/07/2005")
      gerente_contas.entrada_de_dados(350, 157.07, 4201, 8, 2005, "02/08/2005", "15/08/2005")

      expect{ gerente_contas.mes_menor_consumo }.to output("Mes 8, consumo de 350 kw/h\n").to_stdout
    end
  end

  describe "#mes_maior_consumo" do
    it "retorna o valor de maior consumo sem calculo caso aja uma única conta cadastrada" do
      maior = "Mes 6, consumo de 460 kw/h\n"
      gerente_contas.entrada_de_dados(460, 206.43, 4166, 6, 2005, "4/7/2005", "15/07/2005")

      expect{ gerente_contas.mes_maior_consumo }.to output(maior).to_stdout
    end

    it "levanta um erro quando a lista de contas ainda está nula" do
      expect{ gerente_contas.mes_maior_consumo }.to raise_error(RuntimeError)
    end

    it "compara o qtdKwGasto de maior consumo entre todas as contas na lista de contas" do
      gerente_contas.entrada_de_dados(460, 206.43, 4166, 6, 2005, "4/7/2005", "15/07/2005")
      gerente_contas.entrada_de_dados(350, 157.07, 4201, 8, 2005, "02/08/2005", "15/08/2005")

      expect{ gerente_contas.mes_maior_consumo }.to output("Mes 6, consumo de 460 kw/h\n").to_stdout
    end
  end
end
