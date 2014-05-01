class CreateInvestors < ActiveRecord::Migration
  def change
    create_table :investors do |t|
      t.string :permalink
      t.string :name
      t.string :category_code
      t.string :country_code
      t.string :state_code
      t.string :region
      t.string :city
      t.integer :neo_id

      t.timestamps
    end

    add_index :investors, :permalink, unique: true
    add_index :investors, :neo_id, unique: true
  end
end
