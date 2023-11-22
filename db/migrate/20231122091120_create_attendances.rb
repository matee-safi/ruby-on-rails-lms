class CreateAttendances < ActiveRecord::Migration[7.1]
  def change
    create_table :attendances do |t|
      t.references :user, null: false, foreign_key: true
      t.references :academic_class, null: false, foreign_key: true
      t.datetime :date

      t.timestamps
    end
  end
end
