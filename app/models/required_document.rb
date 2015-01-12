class RequiredDocument < ActiveRecord::Base
  belongs_to :business
  belongs_to :document
end
