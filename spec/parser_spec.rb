require './lib/parser.rb'

RSpec.describe Parser do
  subject(:parser) { Parser.new }

  let(:file_name) { './spec/fixtures/card.html' }
  let(:expected_transactions) do
    [
      ["15/11", "AVAL.EMERG.CREDITO", "18,90"],
      ["17/11", "PAGAMENTO EFETUADO", "-56.416,21"],
      ["21/11", "VDA A VALOR ECONOMICO", "63,90"],
      ["20/10", "IFOOD AGENCIA DE SERV", "160,50"],
      ["03/11", "DISK COOK", "80,90"]
    ]
  end

  describe '#parse' do
    let(:parsed_transactions) { parser.parse(file_name) }

    it 'parses HTML file' do
      expect(parsed_transactions[0..4]).to eq(expected_transactions)
    end

    it 'parsed all the transactions' do
      expect(parsed_transactions.count).to eq(109)
    end
  end
end
