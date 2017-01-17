class ChangeMediaTypeColumnType < ActiveRecord::Migration[5.0]
  def change
    change_column :posts, :media_type, :integer
  end
end
