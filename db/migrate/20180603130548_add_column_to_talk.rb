class AddColumnToTalk < ActiveRecord::Migration[5.2]
  def change
    add_reference :talks, :village, foreign_key: true, after: :villager_id
  end
end
