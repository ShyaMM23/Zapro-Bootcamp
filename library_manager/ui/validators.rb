module Validators
  def self.validate_year(year)
    raise InvalidInputError, "Year must be a Number" unless year.match?(/^\d+$/)
    year.to_i
  end
end