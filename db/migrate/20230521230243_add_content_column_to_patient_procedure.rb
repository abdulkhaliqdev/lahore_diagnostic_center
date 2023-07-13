class AddContentColumnToPatientProcedure < ActiveRecord::Migration[7.0]
  def change
    add_column :patient_procedures, :content, :text
    add_column :patients, :phone_number, :integer
    add_column :patient_procedures, :done, :boolean, default: false
  end
end
