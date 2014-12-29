class Account < ActiveRecord::Base
	validates :owner, presence: true
end