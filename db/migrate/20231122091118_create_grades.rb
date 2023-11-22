class CreateGrades < ActiveRecord::Migration[7.1]
  def change
    create_table :grades do |t|
      t.string :value
      t.references :user, null: false, foreign_key: true
      t.references :academic_class, null: false, foreign_key: true

      t.timestamps
    end
  end
end
