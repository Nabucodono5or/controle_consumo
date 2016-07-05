# encoding: UTF-8

require 'gerente_contas'
require 'spec_helper'

describe GerenteContas do
  # implementaremos testes dos métodos

  subject(:gerente_contas) { GerenteContas.new() }
  let(:conta_luz) { double("conta").as_null_object }

  describe "#entrada de dados" do
    it "aramazena a quantidade de kw Gasto dado" do
      allow(conta_luz).to receive(:qtd_kw_gasto).and_return(460)
      qtd = 460

      expect(conta_luz).to have_received(:qtd_kw_gasto).with(qtd)

      gerente_contas.entrada_de_dados(qtd)
    end
    it "armazena a quantidade de o valor a pagar"
    it "armazena o número de leitura da conta"
    it "armazena o mes"
    it "armazena o ano"
    it "aramazena a data de emissao"
    it "armazena a data de vencimento"
  end
end
