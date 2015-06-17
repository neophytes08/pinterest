class AddPinIdToComments < ActiveRecord::Migration
  def change
    add_column :comments, :pin_id, :integer
    add_index :comments, :pin_id
  end
end
