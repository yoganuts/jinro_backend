class CreateVillages < ActiveRecord::Migration[5.2]
  def change
    create_table :villages do |t|
      t.string :name
      t.string :code
      t.integer :status

      t.timestamps
    end
  end
end
