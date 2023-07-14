class CreatePatientProcedures < ActiveRecord::Migration[6.1]
  def change
    create_table :patient_procedures do |t|
      t.references :patients, null: false, foreign_key: true
      t.references :procedures, null: false, foreign_key: true
      t.references :users, null: false, foreign_key: true
      t.integer :price

      t.timestamps
    end
  end
end
