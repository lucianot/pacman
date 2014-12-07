require 'spec_helper'

describe 'App' do
	describe 'GET /' do
	  it 'contains form to upload file' do
	  	get '/'
	    expect(last_response).to be_ok
	  	expect(last_response.body).to include("type=\"file\"")
	  end
	end

	describe 'POST /upload' do
		let(:input_file) { "./spec/fixtures/card.html" }
		let(:expected_csv_file_name) { "./spec/fixtures/expected_response.csv" }

		it 'uploads successfully' do
			post '/upload', "file" => Rack::Test::UploadedFile.new(input_file, "text")
			expected_csv = File.read(expected_csv_file_name)
	    expect(last_response).to be_ok
	  	expect(last_response.body).to eq(expected_csv)
		end
	end
end
