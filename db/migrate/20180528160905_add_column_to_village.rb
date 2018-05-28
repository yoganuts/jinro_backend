class AddColumnToVillage < ActiveRecord::Migration[5.2]
  def change
    add_column :villages, :image_no, :integer, default: 0
  end
end
