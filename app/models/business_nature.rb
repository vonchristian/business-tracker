class BusinessNature < ActiveRecord::Base
  validates :description, :psic_code, presence: true
  has_many :businesses
end
