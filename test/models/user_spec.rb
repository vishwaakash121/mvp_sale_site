require 'rails_helper'

RSpec.describe User, type: :model do
	current_user = User.first_or_create!(email: 'test@example.com', password: 'password', username: 'test')

	it 'should have username' do
		user = User.new(
			username: nil,
			email: 'test_1@demo.com',
			password: 'password'
    )
		expect(user).to_not be_valid

    user.username = 'test_akash'
    expect(user).to be_valid
  end
end