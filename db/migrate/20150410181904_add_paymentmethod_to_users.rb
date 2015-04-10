class AddPaymentmethodToUsers < ActiveRecord::Migration
  def change
    add_column :users, :paymentmethod, :string
  end
end
