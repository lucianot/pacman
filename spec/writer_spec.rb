require './lib/writer'
require './lib/transaction'

RSpec.describe Writer do
  subject(:writer) { Writer.new }

  let(:expected_csv_file_name) { './spec/fixtures/expected.csv' }
  let(:transactions) do
    [
      Transaction.new(*["10/12", "Bar", "-9.876,54"]),
      Transaction.new(*["10/06", "Foo", "1.234,56"])
    ]
  end

  let(:transactions_array) do
    [
      ["10/06/2014", "Foo", "1234.56"],
      ["10/12/2014", "Bar", "-9876.54"]
    ]
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
