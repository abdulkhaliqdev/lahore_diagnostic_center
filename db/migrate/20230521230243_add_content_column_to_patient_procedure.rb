class AddContentColumnToPatientProcedure < ActiveRecord::Migration[7.0]
  def change
    add_column :patient_procedures, :content, :text
  end
end
