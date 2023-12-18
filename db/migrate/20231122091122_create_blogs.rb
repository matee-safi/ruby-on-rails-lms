class CreateBlogs < ActiveRecord::Migration[7.1]
  def change
    create_table :blogs do |t|
      t.string :title
      t.text :content
      t.string :title_image
      t.references :author, foreign_key: { to_table: :users }, null: false

      t.timestamps
    end
  end
end
