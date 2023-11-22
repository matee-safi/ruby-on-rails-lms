class CreateCertificates < ActiveRecord::Migration[7.1]
  def change
    create_table :certificates do |t|
      t.string :name
      t.string :qr_code
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
