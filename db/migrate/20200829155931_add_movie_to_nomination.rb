class AddMovieToNomination < ActiveRecord::Migration[6.0]
  def change
    add_column :nominations, :movie, :jsonb, :null => false, :default => {}
  end
end
