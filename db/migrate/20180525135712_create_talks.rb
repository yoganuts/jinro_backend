class CreateTalks < ActiveRecord::Migration[5.2]
  def change
    create_table :talks do |t|
      t.references :villager, foreign_key: true
      t.text :content

      t.timestamps
    end
  end
end
