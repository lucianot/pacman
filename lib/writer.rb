require 'csv'

class Writer
  def self.write_to_csv(transactions, file_name = 'transactions.csv')
    Writer.new.write_to_csv(transactions, file_name)
  end

  def write_to_csv(transactions, file_name)
    csv = generate_csv(transations)
    File.open(file_name) { |file| file.write(csv) }
  end

  def generate_csv(transactions)
    CSV.generate do |csv|
      transactions.each do |transaction|
        csv << transaction
      end
    end
  end
end
