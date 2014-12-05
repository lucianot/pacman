require 'sinatra'
require './lib/writer'

get '/' do
  transactions = [["10/06", "Foo", "1.234,56"]]
  file = Writer.new.generate_csv(transactions)

  content_type 'application/csv'
  attachment "myfilename.csv"
  file
end
