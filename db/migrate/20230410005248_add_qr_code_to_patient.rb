class AddQrCodeToPatient < ActiveRecord::Migration[6.1]
  def change
    add_column :patients, :image_data, :text
  end
end
