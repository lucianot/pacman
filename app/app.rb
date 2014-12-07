require 'sinatra'
require './app/writer'

def load_files
  Dir.glob("public/files/*")
end

get '/' do
	erb :upload
end

post '/munch' do
	File.open('public/files/' + params['file'][:filename], "w") do |f|
    f.write(params['file'][:tempfile].read)
  end
  "Uploaded"
end

# tempfile = params.fetch('file').fetch(:tempfile)
# filename = params['file'][:filename]
# # File.copy(tempfile.path, "./files/#{filename}")
# transactions = Parser.parse(tempfile) if tempfile
# file = Writer.new.generate_csv(transactions)

# content_type 'application/csv'
# attachment 'my_transactions.csv'
# file
# params.fetch('file')


__END__

@@upload
<form action='/munch' enctype="multipart/form-data" method='POST'>
    <input name="file" type="file" />
    <input type="button" value="Upload" />
</form>


