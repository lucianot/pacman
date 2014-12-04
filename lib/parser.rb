require 'nokogiri'
require 'csv'

class Parser
  def self.parse(file_name)
    self.new.parse(file_name)
  end

  def initialize
  end

  def parse(file_name)
    parsed_doc = parse_file(file_name)
    extract_transactions(parsed_doc)
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
      transaction_rows(rows)
    end

    def get_rows(doc)
      doc.css('table.TRNfundo tr').map { |row| get_row_elements(row) }
    end

    def get_row_elements(row)
      row.css('td').map { |element| element.content.strip }
    end

    def transaction_rows(rows)
      rows.select { |row_elements| contains_transaction?(row_elements) }
    end

    def contains_transaction?(elements)
      row_contains_3_elements?(elements) &&
      first_element_is_valid_date?(elements) &&
      last_element_is_number?(elements)
    end

    def row_contains_3_elements?(elements)
      elements.count == 3
    end

    def first_element_is_valid_date?(elements)
      date_regex = /^\d{2}\/\d{2}$/
      date_regex.match(elements.first)
    end

    def last_element_is_number?(elements)
      number_regex = /^-?[\d.]+,\d{2}$/
      number_regex.match(elements.last)
    end
end
