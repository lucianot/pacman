require 'spec_helper'

describe 'App' do
	describe 'GET /' do
	  it 'contains form to upload file' do
	  	get '/'
	    expect(last_response).to be_ok
	  	expect(last_response.body).to include("type=\"file\"")
	  end
	end

	describe 'POST /munch' do
		let(:file_name) { "public/files/cat.jpg" }

		before do
	    File.delete(file_name) if File.exists?(file_name)
		end

		it 'uploads successfully' do
			post '/munch', {:file =>{:filename=>"cat.jpg"}}
	    # expect(last_response.status).to eq(201)
	  	expect(last_response.body).to include("Uploaded")
		end

		it 'saves files' do
		  files_before = load_files.length
		  post '/munch', {:file =>{:filename=>"cat.jpg"}}
		  files_after = load_files.length
		  expect(files_after).to eq(files_before + 1)
		end
	end
end
