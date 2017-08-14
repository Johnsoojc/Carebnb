class CreateTags < ActiveRecord::Migration[5.1]
  def change
    create_table :tags do |t|
      t.integer :tagging_id
      t.integer :listing_id

      t.timestamps
    end
  end
end
