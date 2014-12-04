require './lib/parser.rb'

RSpec.describe Parser do
  subject(:parser) { Parser.new }

  let(:file_name) { './spec/fixtures/card.html' }
  let(:expected_transactions) do
    [
      Transaction.new(*["15/11", "AVAL.EMERG.CREDITO", "18,90"]),
      Transaction.new(*["17/11", "PAGAMENTO EFETUADO", "-56.416,21"])
    ]
  end

  describe '#parse' do
    let(:parsed_transactions) { parser.parse(file_name) }

    it 'parses HTML file' do
      expect(parsed_transactions[0..1]).to eq(expected_transactions)
    end

    it 'parsed all the transactions' do
      expect(parsed_transactions.count).to eq(109)
    end
  end
end
