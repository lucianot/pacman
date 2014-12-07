require 'sinatra'
require './app/parser'
require './app/writer'

def load_files
  Dir.glob("public/files/*")
end

get '/' do
	erb :upload
end

post '/upload' do
	if params[:file]
    filename = params[:file][:filename]
    file = params[:file][:tempfile]

    transactions = Parser.parse(file)
		file = Writer.new.generate_csv(transactions)

		content_type 'application/csv'
		attachment 'my_transactions.csv'
		file
  else
    "You need to select a file"
  end
end
