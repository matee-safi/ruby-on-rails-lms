class CreateCourses < ActiveRecord::Migration[7.1]
  def change
    create_table :courses do |t|
      t.string :name
      t.date :start_date
      t.integer :duration
      t.decimal :price

      t.timestamps
    end
  end
end
