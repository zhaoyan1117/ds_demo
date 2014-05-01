class CreateInvestings < ActiveRecord::Migration
  def change
    create_table :investings do |t|
      t.integer :company_id
      t.integer :investor_id
      t.string :round_type
      t.integer :amount, limit: 8
      t.integer :neo_id

      t.timestamps
    end

    add_index :investings, :neo_id
  end
end
