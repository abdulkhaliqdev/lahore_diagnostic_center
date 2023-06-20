class CreatePatientProcedures < ActiveRecord::Migration[7.0]
  def change
    create_table :patient_procedures do |t|
      t.references :patient, null: false, foreign_key: true
      t.references :procedure, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.integer :price

      t.timestamps
    end
  end
end
