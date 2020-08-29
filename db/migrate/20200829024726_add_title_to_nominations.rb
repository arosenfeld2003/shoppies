class AddTitleToNominations < ActiveRecord::Migration[6.0]
  def change
    add_column :nominations, :title, :string
  end
end
