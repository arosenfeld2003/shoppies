class DropNominations < ActiveRecord::Migration[6.0]
  def change
    drop_table :nominations
  end
end
