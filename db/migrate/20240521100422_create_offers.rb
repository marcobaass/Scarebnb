class CreateOffers < ActiveRecord::Migration[7.1]
  def change
    create_table :offers do |t|
      t.string :title
      t.string :images
      t.text :description
      t.float :price
      t.string :city
      t.string :address
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
