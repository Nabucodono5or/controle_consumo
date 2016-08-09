# encoding: UTF-8

require 'gerente_contas'
require 'spec_helper'

describe GerenteContas do
  # implementaremos testes dos métodos

  subject(:gerente_contas) { GerenteContas.new() }

  describe "#entrada de dados" do
    context '#entrada_de_dados para kw gasto' do
      it "aramazena a quantidade de kw Gasto dado" do
        qtd = 460
        gerente_contas.entrada_de_dados(460)

        expect(gerente_contas.qtd_kw_gasto).to eq(qtd)

        gerente_contas.qtd_kw_gasto
      end
    end

    it "armazena a quantidade de o valor a pagar"
    it "armazena o número de leitura da conta"
    it "armazena o mes"
    it "armazena o ano"
    it "aramazena a data de emissao"
    it "armazena a data de vencimento"
  end
end
