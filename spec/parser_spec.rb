require_relative '../lib/parser.rb'

RSpec.describe Parser do
  subject(:parser) { Parser.new }

  let(:filename) { 'XYZ' }

  describe '#parse' do
    it 'parses HTML file' do
      expect(parser.parse(filename)).to eq(1)
    end
  end
end
