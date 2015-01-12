class BusinessNature < ActiveRecord::Base
  validates :description, :psic_code, presence: true
  has_many :line_of_businesses
  has_many :businesses, through: :line_of_businesses
end
