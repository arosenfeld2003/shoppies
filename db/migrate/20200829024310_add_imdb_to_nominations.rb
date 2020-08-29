class AddImdbToNominations < ActiveRecord::Migration[6.0]
  def change
    add_column :nominations, :imdbID, :string
  end
end
