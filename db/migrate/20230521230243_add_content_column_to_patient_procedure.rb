class AddContentColumnToPatientProcedure < ActiveRecord::Migration[6.1]
  def change
    add_column :patient_procedures, :content, :text
    add_column :patients, :phone_number, :string, default: ''
    add_column :patient_procedures, :done, :boolean, default: false
  end
end
