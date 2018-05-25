class CreateVillagers < ActiveRecord::Migration[5.2]
  def change
    create_table :villagers do |t|
      t.string :name
      t.string :code
      t.references :village, foreign_key: true
      t.references :role, foreign_key: true

      t.timestamps
    end
  end
end
