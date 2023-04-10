class AddQrCodeToPatient < ActiveRecord::Migration[7.0]
  def change
    add_column :patients, :qr_code_data, :text
  end
end
