require './lib/transaction.rb'

RSpec.describe Transaction do
  subject(:transaction) { Transaction.new(*credit_row) }

  let(:credit_row) { ["03/11", "DISK COOK", "1.234,90"] }
  let(:debit_row) { ["03/11", "DISK COOK", "-1.234,90"] }
  let(:expected_date) { Date.new(2014, 11, 3) }
  let(:positive_value) { 1234.90 }
  let(:negative_value) { -1234.90 }

  it 'parses date' do
    expect(transaction.date).to eq(expected_date)
  end

  it 'parses value' do
    expect(transaction.value).to eq(positive_value)
  end

  it 'parses negative value' do
    transaction = Transaction.new(*debit_row)
    expect(transaction.value).to eq(negative_value)
  end

  describe '#to_array' do
    it 'converts to array' do
      expected_array = ["03/11/2014", "DISK COOK", "1234.90"]
      expect(transaction.to_array).to eq(expected_array)
    end

    it 'converts to array with negative value' do
      transaction = Transaction.new(*debit_row)
      expected_array = ["03/11/2014", "DISK COOK", "-1234.90"]
      expect(transaction.to_array).to eq(expected_array)
    end
  end
end
