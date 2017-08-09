class CreateListings < ActiveRecord::Migration[5.1]
  def change
    create_table :listings do |t|
      t.string :title
      t.integer :price
      t.integer :user_id

      t.timestamps
    end
  end
end
