class Patient < ApplicationRecord
  has_many :patient_procedures, dependent: :destroy
  has_many :procedures, through: :patient_procedures
  accepts_nested_attributes_for :patient_procedures, allow_destroy: true, reject_if: :all_blank

  has_one :referrer
  
  before_create :generate_patient_and_case_id

  enum gender: {
    male: 0,
    female: 1
  }

  scope :uncompleted, -> { where(done: false) }
  scope :completed, -> { where(done: true) }

  def generate_patient_and_case_id
    year  = Date.today.year.to_s.last(2)
    month = Date.today.month
    self.patient_id = generate_id(year, month)
    self.case_id    = generate_id(year, month)
  end

  def qr_generate
    url = "https://lahorediagnosticcenter.com/?patient_id=#{self.patient_id}&case_id=#{self.case_id}"
    qrcode = RQRCode::QRCode.new(url, size: 5, level: :m)
    svg = qrcode.as_svg(
          color: "000",
          shape_rendering: "crispEdges",
          module_size: 4,
          standalone: true,
          use_path: true
        )

    svg.html_safe
  end

  def bill
    sum = 0
    self.patient_procedures.each {|obj| obj.price.present? ? (sum += obj.price) : (sum += obj.procedure.price)}

    sum.nil? ? 0 : sum
  end

  def done_status
    done ? 'Completed' : 'Uncompleted'
  end

  private

  def generate_id(year, month)
    "#{rand.to_s[2..6]}-#{year}-#{(month > 9) ? month.to_s : "0#{month}"}"
  end
end
