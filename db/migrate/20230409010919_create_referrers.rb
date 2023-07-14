class CreateReferrers < ActiveRecord::Migration[6.1]
  def change
    create_table :referrers do |t|
      t.string :doctor_name
      t.string :hospital_name

      t.timestamps
    end
  end
end
