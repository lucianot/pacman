require 'sinatra'
require 'sass'
require './app/parser'
require './app/writer'

set :views, :scss => 'app/public/stylesheets', :default => 'app/views'

helpers do
  def find_template(views, name, engine, &block)
    _, folder = views.detect { |k,v| engine == Tilt[k] }
    folder ||= views[:default]
    super(folder, name, engine, &block)
  end
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

get "/stylesheets/:stylesheet.css" do
  scss :"#{params[:stylesheet]}"
end
