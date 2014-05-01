class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
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

    add_index :companies, :permalink, unique: true
    add_index :companies, :neo_id, unique: true
  end
end
