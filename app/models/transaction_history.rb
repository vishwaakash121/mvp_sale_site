class TransactionHistory < ApplicationRecord
	belongs_to :deal
	belongs_to :user
end
