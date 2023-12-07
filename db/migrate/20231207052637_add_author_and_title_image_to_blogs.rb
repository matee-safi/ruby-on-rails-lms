class AddAuthorAndTitleImageToBlogs < ActiveRecord::Migration[7.1]
  def change
    add_reference :blogs, :author, foreign_key: { to_table: :users }, null: false
    add_column :blogs, :title_image, :string
  end
end
