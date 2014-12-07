require_relative 'parser'
require_relative 'writer'

INPUT_FILE = File.join(Dir.home, 'Downloads', '30 horas.html')
OUTPUT_FILE = File.join(Dir.home, 'Downloads', 'transactions.csv')

class Pacman
  def self.munch
    Pacman.new.munch
  end

  def munch
    transactions = Parser.parse(INPUT_FILE)
    Writer.write_to_csv(transactions, OUTPUT_FILE)
  end
end
