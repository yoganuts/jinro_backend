class AddStampNoToTalk < ActiveRecord::Migration[5.2]
  def change
    add_column :talks, :stamp_no, :integer, after: :content
  end
end
