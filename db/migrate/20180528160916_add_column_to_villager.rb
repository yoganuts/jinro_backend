class AddColumnToVillager < ActiveRecord::Migration[5.2]
  def change
    add_column :villagers, :image_no, :integer, default: 0
  end
end
