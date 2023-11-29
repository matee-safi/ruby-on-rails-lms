class AddDetailsToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :bio, :text
    add_column :users, :date_of_birth, :date
    add_column :users, :phone_number, :string
  end
end
