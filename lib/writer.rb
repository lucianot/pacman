require 'csv'

class Writer
  def self.write_to_csv(transactions, file_name = 'transactions.csv')
    Writer.new.write_to_csv(transactions, file_name)
  end

  def write_to_csv(transactions, file_name)
    formatted_transactions = format_transactions(transactions)
    csv = generate_csv(formatted_transactions)
    File.open(file_name, 'w') { |file| file.write(csv) }
  end

  def generate_csv(transactions)
    CSV.generate do |csv|
      transactions.each do |transaction|
        csv << transaction
      end
    end
  end

  private

    def format_transactions(transactions)
      sort_by_date(transactions).map(&:to_array)
    end

    def sort_by_date(transactions)
      transactions.sort_by { |transaction| transaction.date }
    end
end
