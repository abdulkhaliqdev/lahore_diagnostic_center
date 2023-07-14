class AddReferrerReferenceToPatient < ActiveRecord::Migration[6.1]
  def change
    add_reference :patients, :referrer
  end
end
