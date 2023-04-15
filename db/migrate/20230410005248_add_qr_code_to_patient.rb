class AddQrCodeToPatient < ActiveRecord::Migration[7.0]
  def change
    add_column :patients, :image_data, :text
  end
end
