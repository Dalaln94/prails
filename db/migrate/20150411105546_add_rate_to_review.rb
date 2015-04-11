class AddRateToReview < ActiveRecord::Migration
  def change
    add_column :reviews, :rate, :integer
  end
end
