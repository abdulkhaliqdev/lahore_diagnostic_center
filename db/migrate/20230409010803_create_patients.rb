class CreatePatients < ActiveRecord::Migration[6.1]
  def change
    create_table :patients do |t|
      t.string  :patient_id,      null: false, default: ""
      t.string  :case_id,         null: false, default: ""
      t.string  :name,            null: false, default: ""
      t.string  :father_husband,  default: ""
      t.integer :gender
      t.integer :age
      t.string  :address,         default: ""
      t.boolean :done,            default: false

      t.timestamps
    end
  end
end
