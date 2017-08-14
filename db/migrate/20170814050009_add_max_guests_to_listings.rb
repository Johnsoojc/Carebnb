class AddMaxGuestsToListings < ActiveRecord::Migration[5.1]
  def change
    add_column :listings, :max_guests, :integer
  end
end
