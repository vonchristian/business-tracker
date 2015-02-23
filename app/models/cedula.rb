class Cedula < ActiveRecord::Base
  belongs_to :taxpayer
  enum gender: [:male, :female]
end
