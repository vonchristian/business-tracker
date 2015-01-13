class LineOfBusinessTax < ActiveRecord::Base
  belongs_to :line_of_business
  belongs_to :tax
end
