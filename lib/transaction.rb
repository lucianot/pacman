class Transaction
  attr_reader :date, :description, :value

  def initialize(date, description, value)
    @date = parse_date(date)
    @description = description
    @value = parse_value(value)
  end

  def to_array(date_format='%d/%m/%Y')
    Array[
      @date.strftime(date_format),
      @description,
      sprintf('%.2f', @value)
    ]
  end

  def ==(object)
    object.class == self.class && object.state == state
  end
  alias_method :eql?, :==

  protected

    def state
      [@date, @description, @value]
    end

  private

    def parse_date(date)
      Date.strptime(date, '%d/%m')
    end

    def parse_value(value)
      value.delete('.').sub(',', '.').to_f
    end
end
