class CreateAcademicClasses < ActiveRecord::Migration[7.1]
  def change
    create_table :academic_classes do |t|
      t.string :name

      t.timestamps
    end
  end
end
