class Deal < ApplicationRecord
	belongs_to :user
	validates :title, presence: true, length: {minimum: 6, maximum: 100}
	validates :description, presence: true, length: {minimum: 10, maximum: 300}
	validates :price, :quantity, presence: true, numericality: { other_than: 0 }
	validates :image, :publish_date, :discount, presence: true
	has_one_attached :image

	validate :validate_deal_attributes

	def validate_deal_attributes
		is_published = Deal.where(publish_date: publish_date).size
		if publish_date.past? or publish_date.today?
			errors.add(:base, "publish date will be of future only")
		elsif is_published > 0
			errors.add(:base, "Only one deal can be published on a day, please publish on other days!")
		end
	end
end