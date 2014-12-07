require 'spec_helper'
require './app/writer'
require './app/transaction'

RSpec.describe Writer do
  subject(:writer) { Writer.new }

  let(:expected_csv_file_name) { './spec/fixtures/expected.csv' }
  let(:credit) { build(:credit) }
  let(:debit) { build(:debit) }
  let(:transactions) { [debit, credit] }
  let(:transactions_array) { [debit.to_array, credit.to_array] }

  before do
    Timecop.freeze(Date.new(2014,12,02))
  end

  after do
    Timecop.return
  end

  describe '#write_to_csv' do
    it 'formats the data' do
      allow(File).to receive(:open) # avoid csv file write

      expect(writer).to receive(:generate_csv).with(transactions_array)
      writer.write_to_csv(transactions, 'trans.csv')
    end
  end

  describe '#generate_csv' do
    it 'generates a CSV file' do
      expected_csv = File.read(expected_csv_file_name)
      generated_csv = writer.generate_csv(transactions_array)
      expect(generated_csv).to eq(expected_csv)
    end
  end
end
