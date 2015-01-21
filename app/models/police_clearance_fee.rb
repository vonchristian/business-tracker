class PoliceClearanceFee < ActiveRecord::Base
belongs_to :business
belongs_to :taxpayer
enum transaction_type: [:employment, :change_of_name, :application_for_filipino_citizenship, :passport_or_visa_application, :firearms_permit_application, :other_puirposes]

def set_amount
     self.amount=50 if self.transaction_type.employment?
     self.amount=50 if self.transaction_type.change_of_name?
     self.amount=200 if self.transaction_type.application_for_filipino_citizenship?
     self.amount=100 if self.transaction_type.passport_or_visa_application?
     self.amount=100 if self.transaction_type.firearms_permit_application?
     self.amount=50 if self.transaction_type.other_puirposes?
  end
end
