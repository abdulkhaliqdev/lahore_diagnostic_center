class Patient < ApplicationRecord
  # include ImageUploader::Attachment(:qr_code)

  has_many :patient_procedures
  accepts_nested_attributes_for :patient_procedures, allow_destroy: true, reject_if: :all_blank

  has_many :referrers
  accepts_nested_attributes_for :referrers, allow_destroy: true, reject_if: :all_blank
  
  before_create :generate_patient_and_case_id

  enum gender: {
    male: 0,
    female: 1
  }

  def generate_patient_and_case_id
    year  = Date.today.year.to_s.last(2)
    month = Date.today.month
    self.patient_id = generate_id(year, month)
    self.case_id    = generate_id(year, month)
  end

  def qr_generate
    qrcode = RQRCode::QRCode.new("/?patient_id=#{self.patient_id}&case_id=#{self.case_id}")
    png = qrcode.as_png(
      bit_depth: 1,
      border_modules: 4,
      color_mode: ChunkyPNG::COLOR_GRAYSCALE,
      color: 'black',
      file: nil,
      fill: 'white',
      module_px_size: 6,
      resize_exactly_to: false,
      resize_gte_to: false,
      size: 120
    )

    png
  end

  private

  def generate_id(year, month)
    "#{rand.to_s[2..6]}-#{year}-#{(month > 9) ? month.to_s : "0#{month}"}"
  end
end
