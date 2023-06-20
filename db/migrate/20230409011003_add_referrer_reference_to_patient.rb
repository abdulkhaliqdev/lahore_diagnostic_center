class AddReferrerReferenceToPatient < ActiveRecord::Migration[7.0]
  def change
    add_reference :patients, :referrer
  end
end
