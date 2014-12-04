class Transaction
  attr_reader :date, :description, :value

  def initialize(date, description, value)
    @date = parse_date(date)
    @description = description
    @value = parse_value(value)
  end

  private

    def parse_date(date)
      Date.strptime(date, '%d/%m')
    end

    def parse_value(value)
      value.delete('.').sub(',', '.').to_f
    end
end
