class CreateTransactionHistories < ActiveRecord::Migration[6.1]
  def change
    create_table :transaction_histories do |t|
      t.integer :deal_id
      t.integer :user_id
      t.timestamps
    end
  end
end
