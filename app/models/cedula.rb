class Cedula < ActiveRecord::Base
  belongs_to :taxpayer
  enum gender: [:male, :female]
validates :cedula_number, presence: true, uniqueness: true
end
