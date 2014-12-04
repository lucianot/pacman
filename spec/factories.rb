require 'factory_girl'
require './lib/transaction'

FactoryGirl.define do
  factory :credit, class: Transaction do
    date          "10/06/2014"
    description   "Foo"
    value         "1.234,56"

    initialize_with { new(date, description, value) }
  end

  factory :debit, class: Transaction do
    date          "10/12/2014"
    description   "Bar"
    value         "-9.876,54"

    initialize_with { new(date, description, value) }
  end
end
