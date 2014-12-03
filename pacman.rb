require 'nokogiri'

FILE_NAME = File.join(Dir.home, 'Downloads', '30 horas.html')

class Parser
  def self.parse(file_name)
    self.new.parse(file_name)
  end

  def initialize
  end

  def parse(file_name)
    parsed_doc = parse_file(file_name)
    # extract_content(parsed_doc)
  end

  private

    def parse_file(file_name)
      file = File.open(file_name, "r")
      doc = Nokogiri::HTML(file)
      file.close
      doc
    end

    def extract_content(doc)
      rows = get_rows(doc)
      rows.map { |row| }
    end

    def get_rows
      doc.css('table.TRNfundo tr')
    end
end

# puts Parser.parse(FILE_NAME)

# parse file
# write csv