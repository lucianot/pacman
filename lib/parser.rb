require 'nokogiri'

class Parser
  def self.parse(file_name)
    self.new.parse(file_name)
  end

  def initialize
  end

  def parse(file_name)
    # parsed_doc = parse_file(file_name)
    # extract_transactions(parsed_doc)
    1
  end

  private

    def parse_file(file_name)
      file = File.open(file_name, "r")
      doc = Nokogiri::HTML(file)
      file.close
      doc
    end

    def extract_transactions(doc)
      # get rows
      rows = get_rows(doc)

      # remove rows that are not relevant
      relevant_rows(rows)

      # loop thru relevant rows and write values
    end

    def get_rows(doc)
      doc.css('table.TRNfundo tr')
    end

    def relevant_rows(rows)
      rows.select { |row| is_relevant?(row) }
    end

    def is_relevant?(row)
      true
    end
end
