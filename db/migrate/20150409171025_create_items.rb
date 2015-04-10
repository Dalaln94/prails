class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :cateogyr
      t.string :manufacturer
      t.string :picture
      t.string :name

      t.timestamps
    end
  end
end
