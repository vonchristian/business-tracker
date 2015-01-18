class BusinessFee < ActiveRecord::Base
  belongs_to :fee
  belongs_to :business
end
