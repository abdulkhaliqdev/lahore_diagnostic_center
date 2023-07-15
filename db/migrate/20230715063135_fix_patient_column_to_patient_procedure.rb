class FixPatientColumnToPatientProcedure < ActiveRecord::Migration[6.1]
  def self.up
    rename_column :patient_procedures, :patients_id,   :patient_id
    rename_column :patient_procedures, :procedures_id, :procedure_id
    rename_column :patient_procedures, :users_id, :user_id
  end

  def self.down
    rename_column :patient_procedures, :patient_id, :patients_id
    rename_column :patient_procedures, :procedure_id, :procedures_id
    rename_column :patient_procedures, :user_id, :users_id
  end
end
