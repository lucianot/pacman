require 'spec_helper'
require './app/transaction.rb'

RSpec.describe Transaction do
  let(:credit) { build(:credit) }
  let(:debit) { build(:debit) }

  let(:credit_row) { ["10/06", "Foo", "1.234,56"] }
  let(:debit_row) { ["10/12", "Bar", "-9.876,54"] }
  let(:credit_date) { Date.new(2014, 6, 10) }
  let(:debit_date) { Date.new(2013, 12, 10) }
  let(:credit_value) { 1234.56 }
  let(:debit_value) { -9876.54 }

  before do
    Timecop.freeze(Date.new(2014,12,02))
  end

  after do
    Timecop.return
  end

  context 'parses date' do
    it 'when date is correct' do
      expect(credit.date).to eq(credit_date)
    end

    it 'when date is in the future' do
      expect(debit.date).to eq(debit_date)
    end
  end

  context 'parses value' do
    it 'when positive' do
      expect(credit.value).to eq(credit_value)
    end

    it 'when negative' do
      expect(debit.value).to eq(debit_value)
    end
  end

  describe '#to_array' do
    it 'converts to array' do
      expected_array = ["10/06/2014", "Foo", "1234.56"]
      expect(credit.to_array).to eq(expected_array)
    end

    it 'converts to array with negative value' do
      expected_array = ["10/12/2013", "Bar", "-9876.54"]
      expect(debit.to_array).to eq(expected_array)
    end
  end
end
