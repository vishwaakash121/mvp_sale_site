class AddTimestampsToDeals < ActiveRecord::Migration[6.1]
  def change
    add_column :deals, :created_at, :datetime
    add_column :deals, :updated_at, :datetime
  end
end
