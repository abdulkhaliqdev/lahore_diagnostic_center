class CreateProcedures < ActiveRecord::Migration[7.0]
  def change
    create_table :procedures do |t|
      t.string  :procedure_type,  null: false
      t.string  :title,           null: false
      t.integer :price,           null: false, default: 0

      t.timestamps
    end
  end
end
