require 'rails_helper'

RSpec.describe Deal, type: :model do
	current_user = User.first_or_create!(email: 'test@example.com', password: 'password', username: 'test', admin: true)

	it 'has a title' do
		deal = Deal.new(
      title: '',
      description: 'A Valid Deal is created',
      user: current_user,
      quantity: 1,
			publish_date: Date.today + 1,
			price: 10,
			discount: 2,
			state: 1
    )
    expect(deal).to_not be_valid

    deal.title = 'Has a title'
    expect(deal).to be_valid
  end

	it 'Quantity should be greater than 0' do
		deal = Deal.new(
      title: 'Has a title',
      description: 'A Valid Deal is created',
      user: current_user,
      quantity: nil,
			publish_date: Date.today + 1,
			price: 10,
			discount: 2,
			state: 1
    )
		expect(deal).to_not be_valid

    deal.quantity = 3
    expect(deal).to be_valid
  end
	
end