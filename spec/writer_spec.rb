require_relative '../lib/writer.rb'

RSpec.describe Writer do
  describe '#generate_csv' do
    subject(:writer) { Writer.new }

    let(:expected_csv_file_name) { './spec/fixtures/expected.csv' }
    let(:transactions) do
      [
        ["10/06/2014", "Luciano", "1234.56"],
        ["10/12/2014", "Henrique", "9876.54"]
      ]
    end

    it 'generates a CSV file' do
      expected_csv = File.read(expected_csv_file_name)
      generated_csv = writer.generate_csv(transactions)
      expect(generated_csv).to eq(expected_csv)
    end
  end
end
