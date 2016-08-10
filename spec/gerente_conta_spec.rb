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

    context '#entrada_de_dados para kw gasto' do
      before do
        allow(conta).to receive(:qtd_kw_gasto).and_return(460)
      end

      it "aramazena a quantidade de kw Gasto dado" do

        expect(gerente_contas).to respond_to(:entrada_de_dados)

        gerente_contas.entrada_de_dados(460)
      end

      # isso foi um teste para verificar a entrada de dados, o method qtd_kw_gasto era temporário
      it "impede que tenha acesso a qtd_kw_gasto um método para acessar o dado de entrada" do
        gerente_contas.entrada_de_dados(460)

        expect(gerente_contas).not_to respond_to(:qtd_kw_gasto)
      end
    end

    it "armazena a quantidade de o valor a pagar como argumento"
    it "armazena o número de leitura da conta como argumento"
    it "armazena o mes como argumento"
    it "armazena o ano como argumento"
    it "aramazena a data de emissao como argumento"
    it "armazena a data de vencimento como argumento"
  end
end
