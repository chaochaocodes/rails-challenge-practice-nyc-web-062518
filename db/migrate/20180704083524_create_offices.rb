class CreateOffices < ActiveRecord::Migration[5.1]
  def change
    create_table :offices do |t|
      t.string :building
      t.string :company
      t.integer :floor
      t.references :building
      t.references :company
      t.timestamps
    end
  end
end
