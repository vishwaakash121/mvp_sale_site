require 'rails_helper'

RSpec.describe '/deals', type: :request do
  current_user = User.first_or_create!(email: 'akash@example.com', password: 'password')

  let(:valid_attributes) do
    {
      'id' => '1',
      'title' => 'This is 40% off deal',
      'description' => 'This is 40% off deal',
      'user' => current_user,
			'price' => 80,
			'discount' => 10,
			'quantity' => 2,
			'publish_date' => Date.today + 1
    }
  end

  let(:invalid_attributes) do
    {
      'id' => 'a',
      'title' => '1',
      'description' => 'This is 40% off deal',
      'user' => current_user,
			'price' => 0,
			'discount' => 10,
			'quantity' => 0,
			'publish_date' => Date.today - 1
    }
  end

  describe 'GET /index' do
    it 'renders a unsuccessful response' do
      deal = Deal.new(invalid_attributes)
      deal.user = current_user
      deal.save
			get deals_path
			byebug
			expect(response).to eq(400)
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      deal = Deal.new(valid_attributes)
      deal.user = current_user
      deal.save
			get deal_path(deal)
      expect(response).to eq(200)
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
			deal = Deal.new(valid_attributes)
      deal.user = current_user
			deal.publish_date = Date.today + 2
      deal.save
      get new_deal_path
			expect(response.status).to eq(302)
    end
  end
end
