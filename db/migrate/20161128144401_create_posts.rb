class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :description
      t.string :thumbnail
      t.string :media
      t.string :media_type

      t.timestamps
    end
  end
end
